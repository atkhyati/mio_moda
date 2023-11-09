import 'dart:async';
import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/home_api_repository.dart';
import 'package:meta_package/api/api_repository/menu_api_repository.dart';
import 'package:meta_package/api/api_repository/product_list_api_repository.dart';
import 'package:meta_package/api/models/home/menu_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';

class HomeController extends GetxController {
   RxInt index = 0.obs;
  RxBool isLoading = true.obs;
  Rx<MenuModel>? menuModel = MenuModel().obs;
  Rx<ProductModel>? productModel = ProductModel().obs;
  RxList<ProductModel?> homeTileModel = RxList();

  final ProductListAPIRepository productListAPIRepository =
      ProductListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  final MenuAPIRepository menuAPIRepository =
      MenuAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  final HomeAPIRepository homeAPIRepository =
      HomeAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  HomeController();

  List<String> brandListIMG = [
    'assets/images/m_logo.png',
    'assets/images/Ralph-Lauren-Symbol 1.png',
    'assets/images/Tory_Burch_logo 1.png'
  ];

  @override
  void onInit() async{
    super.onInit();
    await localStore.getUserDetail();
    getMenuDataFromApi();
  }


    Future<void> getMenuDataFromApi() async {
    isLoading(true);
    debugPrint("CONTROLLER DATA ==============$menuModel");
    try {
      MenuModel data = await menuAPIRepository.getMenuAPISearchResponse();
      data.childrenData!.forEach((element) async {
        homeTileModel.value
            .add(await getHomeProducts(element.id.toString(), false));
        homeTileModel.refresh();
      });

      menuModel?.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
    }
  }

  Future<ProductModel?> getHomeProducts(String val, bool isBrand) async {
    try {
      ProductModel productModelData =
          await productListAPIRepository.getProductListApiResponse(val, isBrand,
              currentPage: 0,
              pageSize: 10,
              currentCurrency: localStore.currentCurrency);
      productModel?.value = productModelData;
      return productModelData;

      // isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}

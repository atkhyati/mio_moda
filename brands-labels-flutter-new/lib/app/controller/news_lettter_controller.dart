import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/dashboard_api_repository.dart';
import 'package:meta_package/api/api_repository/newsletter_api_respository.dart';
import 'package:meta_package/api/models/home/logo_model.dart';
import 'package:meta_package/api/models/newsletter/newsletter_request.dart';

class NewsLetterController extends GetxController {
  Rx<LogoModel>? logoModel = LogoModel().obs;
  DashboardAPIRepository dashboardAPIRepository =
      DashboardAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final NewsletterApiRepository newsletterAPIRepository =
      NewsletterApiRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxBool isLoading = false.obs;
  NewsLetterController();
  RxBool isEmailSelected = true.obs;

  Future<void> getMenuDataFromApi() async {
    debugPrint("getMenuDataFromApi -> ");
    try {
      LogoModel data1 = await dashboardAPIRepository.getLogoAPIResponse();
      logoModel?.value = data1;
      log('logoModel?.value is:-->>${logoModel?.value}');
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  @override
  void onInit() {
    getMenuDataFromApi();
    super.onInit();
  }

  Future<void> subscribeNewsLetter() async {
    isLoading.value = true;
    try {
      var userEmail = isEmailSelected.value ? localStore.userDetail.email : '';

      if (localStore.customerToken == "") {
        await newsletterAPIRepository.subscribeNewsLetter(email: userEmail);
      } else {
        await newsletterAPIRepository.subscribeNewsletterProviderUser(
            NewsletterRequestModel(
                customer: Customer1(
                    email: localStore.userDetail.email,
                    firstname: localStore.userDetail.firstname,
                    id: localStore.userDetail.id,
                    lastname: localStore.userDetail.lastname,
                    store_id: localStore.userDetail.storeId,
                    redExtensionAttributes:
                        RequestExtAttribute(is_subscribed: true).toJson(),
                    website_id: localStore.userDetail.websiteId)));
      }
      localStore.userDetail.extensionAttributes!.isSubscribed = true;
      Get.back();
      log('', name: "Value");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
    isLoading.value = false;
  }
}

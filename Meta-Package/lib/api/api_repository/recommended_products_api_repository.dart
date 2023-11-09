import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:meta_package/api/api_endpoint/recommended_product_api.dart';
import 'package:meta_package/api/models/cart/add_to_cart_modal.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/recommended_products/recommended_products_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';

class RecommendedProductsAPIRepository {
  List<RecommendedProductModel> itemData = [];

  String baseUrl;

  RecommendedProductsAPIRepository({required this.baseUrl});

  late RecommendedProductApi baseApi = RecommendedProductApi(baseUrl: baseUrl);

  Future<ProductItem> getProductDetailApi(String id) async {
    return await baseApi.getProductDetailApiProvider(id: id);
  }

  Future<String> postNotifyMeReq(Object? body) async {
    return await baseApi.postNotifyMeReqProvider(body: body);
  }

  Future<List<dynamic>> getEstimatedTime(String id) async {
    return await baseApi.getEstimatedTimeProvider(id: id);
  }

  Future<String> postSpecialSizeResponse(
      {required String email,
      required String sku,
      required String website}) async {
    return await baseApi.postSpecialSizeResponseProvider(
        body: {"email": email, "sku": sku, "website": website});
  }

  Future<List<SizeModel>> getChooseInSizeList() async {
    return await baseApi.getChooseInSizeListProvider();
  }

  Future<List<RecommendedProductModel>> getRecommendedProductResponse(
    String id,
  ) async {
    return await baseApi.getRecommendedProductResponseProvider(id: id);
  }

  Future<String> getGenerateCartApiResponse() async {
    LocalStore.localStore.checkGuest();
    if (LocalStore.localStore.isGuest) {
      return await baseApi.getGenerateGuestCartApiResponseProvider();
    } else {
      return await baseApi.getGenerateUserCartApiResponseProvider();
    }
  }

  Future<AddToCartModal> guestPostAddTOCartProductResponse(
      Map<String, dynamic> addToCartData) async {
    return await baseApi.guestPostAddTOCartProductProvider(
        body: FormData.fromMap(addToCartData));
  }

  Future<Items> guestUpdateProductQty(
    Map<String, dynamic> addToCartData,
    String itemId,
  ) async {
    return await baseApi.guestUpdateProductQty(
        itemId: itemId, body: addToCartData);
  }

  Future<Map<String, dynamic>> getSizeListApi(String id) async {
    log(id, name: "getSizeListApi");
    return await baseApi.getSizeListApiProvider(id: id);
  }

  Future<AddToCartModal> postAddTOCartProductResponse(
    Map addToCartData,
  ) async {
    return await baseApi.postAddTOCartProductProvider(
        body: json.encode(addToCartData));
  }

  Future<Items> updateProductQty(
    Map addToCartData,
    String itemId,
  ) async {
    return await baseApi.productUpdateQty(
        itemId: itemId, body: json.encode(addToCartData));
  }

  Future<Map<String, dynamic>> getCreateCartApiResponse() async {
    return await baseApi.getCreateCartApiProvider();
  }
}

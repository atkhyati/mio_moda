import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/cart/add_to_cart_modal.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/recommended_products/recommended_products_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';

class RecommendedProductApi<T> extends RecommendedProductApiInterface {
  static const String stockNotifyMe = '/rest/V1/stocknotifyme';
  static const String getProductDetailApi = "/V1/products/";
  static String apiEstimatedTime = "/rest/V1/estimate/date-api/";
  static String notifyMe = '/rest/V1/notifyMe';
  static const String getChooseInOptionApi =
      "/rest/all/V1/products/attributes/size_v2/options/";
  static String recommendedProductsEndPoint = "/V1/recommendedList?sku=";
  static const String guestCreateCart = "/V1/guest-carts";
  static const String createCart = "/V1/carts/mine";
  static const String getSizeListApi = "/rest/V1/sizeList/";
  static const String addToCartData = "/V1/carts/mine/items";

  String baseUrl;
  late DioClient client;

  RecommendedProductApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<String> postNotifyMeReqProvider({required dynamic body}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "POST", baseUrl + stockNotifyMe,
          body: body);
      return response.data != null ? response.data!["message"].toString() : '';
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<ProductItem> getProductDetailApiProvider({
    required String id,
  }) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("GET",
          "$baseUrl${LocalStore.getUrlWithCode()}$getProductDetailApi$id");
      return response.one((json) => ProductItem.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<dynamic>> getEstimatedTimeProvider({required String id}) async {
    try {
      final response = await client.getClientWithoutHeader<List<dynamic>>(
          "GET", baseUrl + apiEstimatedTime + id);
      return response.data ?? [];
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<String> postSpecialSizeResponseProvider(
      {required dynamic body}) async {
    try {
      final response = await client.getClientWithOutToken<List<dynamic>>(
          "PUT", baseUrl + notifyMe,
          body: body);
      //todo
      return response.data?.isNotEmpty == true
          ? (response.data?[0])['message'].toString()
          : '';
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<SizeModel>> getChooseInSizeListProvider() async {
    try {
      final response = await client.getClient<List<dynamic>>(
          "GET", baseUrl + getChooseInOptionApi);
      return response.many((json) => SizeModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<RecommendedProductModel>> getRecommendedProductResponseProvider(
      {required String id}) async {
    try {
      final response = await client.getClientWithoutHeader<List<dynamic>>("GET",
          "$baseUrl${LocalStore.getUrlWithCode()}$recommendedProductsEndPoint$id");
      return response.many((json) => RecommendedProductModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<String> getGenerateUserCartApiResponseProvider() async {
    try {
      var endpoint =
          LocalStore.getUrlWithCode() + RecommendedProductApi.createCart;
      final response = await client
          .getClient<String>("POST", baseUrl + endpoint, token: true);
      return response.data?.toString() ?? '';
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<String> getGenerateGuestCartApiResponseProvider() async {
    try {
      var endpoint =
          LocalStore.getUrlWithCode() + RecommendedProductApi.guestCreateCart;
      final response = await client
          .getClient<String>("POST", baseUrl + endpoint, token: true);
      return response.data?.toString() ?? '';
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<AddToCartModal> guestPostAddTOCartProductProvider(
      {required dynamic body}) async {
    try {
      final response = await client.getClientWithOutToken<Map<String, dynamic>>(
          "POST",
          '$baseUrl${LocalStore.getUrlWithCode()}$guestCreateCart/${LocalStore.localStore.guestToken}/items',
          body: body);
      //todo
      return response.one((json) => AddToCartModal.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<Items> guestUpdateProductQty(
      {required dynamic body, required String itemId}) async {
    try {
      final response = await client.getClientWithOutToken<Map<String, dynamic>>(
          "PUT",
          '$baseUrl${LocalStore.getUrlWithCode()}$guestCreateCart/${LocalStore.localStore.guestToken}/items/$itemId',
          body: body);
      return response.one((json) => Items.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<Map<String, dynamic>> getSizeListApiProvider(
      {required String id}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET", baseUrl + getSizeListApi + id,
          token: false);
      //todo
      return response.data ?? {};
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<AddToCartModal> postAddTOCartProductProvider({
    required dynamic body,
  }) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "POST", "$baseUrl${LocalStore.getUrlWithCode()}$addToCartData",
          body: body, token: true);
      //todo
      return response.one((json) => AddToCartModal.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<Items> productUpdateQty({
    required dynamic body,
    required String itemId,
  }) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "PUT", '$baseUrl${LocalStore.getUrlWithCode()}$addToCartData/$itemId',
          token: true, body: body);
      return response.one((json) => Items.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<Map<String, dynamic>> getCreateCartApiProvider() async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
        "GET",
        "$baseUrl${LocalStore.getUrlWithCode()}$createCart",
        token: true,
      );
      return response.data ?? {};
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class RecommendedProductApiInterface<T> {
  Future<T?> postNotifyMeReqProvider({
    required dynamic body,
  });

  Future<T?> getProductDetailApiProvider({
    required String id,
  });

  Future<T?> getEstimatedTimeProvider({
    required String id,
  });

  Future<T?> postSpecialSizeResponseProvider({
    required dynamic body,
  });

  Future<T?> getChooseInSizeListProvider();

  Future<T?> getRecommendedProductResponseProvider({
    required String id,
  });

  Future<T?> getGenerateUserCartApiResponseProvider();

  Future<T?> getGenerateGuestCartApiResponseProvider();

  Future<T?> guestPostAddTOCartProductProvider({
    required dynamic body,
  });

  Future<T?> guestUpdateProductQty({
    required dynamic body,
    required String itemId,
  });

  Future<T?> getSizeListApiProvider({
    required String id,
  });

  Future<T?> postAddTOCartProductProvider({
    required dynamic body,
  });

  Future<T?> productUpdateQty({
    required dynamic body,
    required String itemId,
  });

  Future<T?> getCreateCartApiProvider();
}

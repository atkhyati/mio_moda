import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class WishListApi<T> extends WishListApiInterface {
  static const String wishList = "/V1/wishlist";
  static const String deleteWishlist = "/rest/V1/wishlist/";
  static const String postWishlist = "/rest/V1/wishlist/";
  static String addWishList = '/V1/wishlist/';

  String baseUrl;
  late DioClient client;

  WishListApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<WishListProductModel> getWishListResponseProvider() async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET", "$baseUrl${LocalStore.getUrlWithCode()}$wishList",
          token: true);
      return response.one((json) => WishListProductModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<bool> deleteWishListProvider({
    required dynamic body,
    required String sku,
  }) async {
    try {
      final response = await client.getClient<bool>(
          "DELETE", "$baseUrl${LocalStore.getUrlWithCode()}$addWishList$sku",
          token: true, body: body);
      //todo
      return response.data ?? false;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<bool> putAddToWishListProductProvider({
    required dynamic body,
    required String sku,
  }) async {
    try {
      final response = await client.getClient<bool>(
          "PUT", "$baseUrl${LocalStore.getUrlWithCode()}$addWishList$sku",
          token: true, body: body);
      return response.data ?? false;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class WishListApiInterface<T> {
  Future<T?> getWishListResponseProvider();

  Future<T?> deleteWishListProvider({
    required dynamic body,
    required String sku,
  });

  Future<dynamic> putAddToWishListProductProvider({
    required dynamic body,
    required String sku,
  });
}

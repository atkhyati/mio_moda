import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/home/menu_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class MenuApi<T> extends MenuApiInterface {
  static String menuEndPoint = "/V1/categories";


  String baseUrl;
  late DioClient client;

  MenuApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<MenuModel> getMenuResponseProvider() async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET", "$baseUrl${LocalStore.getUrlWithCode()}$menuEndPoint");
      return response.one((json) => MenuModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<MenuModel> getMenuSearchResponseProvider() async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET", '$baseUrl${LocalStore.getUrlWithCode()}$menuEndPoint');
      return response.one((json) => MenuModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class MenuApiInterface<T> {
  Future<T?> getMenuResponseProvider();

  Future<T?> getMenuSearchResponseProvider();
}

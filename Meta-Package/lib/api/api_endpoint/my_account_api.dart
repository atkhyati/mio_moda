import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';
import 'package:meta_package/api/models/my_account/update_user_request_model.dart';

class MyAccountApi<T> {
  static const String account = "/V1/customers/me";
  static const String changePassword = "/V1/customers/me/password";

  String baseUrl;
  late DioClient client;

  MyAccountApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  Future<MyAccountDetails> getAccountDetailsResponseProvider() async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET", "$baseUrl${LocalStore.getUrlWithCode()}$account",
          token: true);
      return response.one((json) => MyAccountDetails.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  Future<bool> changePasswordResponseProvider({required dynamic body}) async {
    try {
      final response = await client.getClient<bool>(
          "PUT", "$baseUrl${LocalStore.getUrlWithCode()}$changePassword",
          token: true, body: body);
      return response.data ?? false;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<MyAccountDetails> updateUser(
      {required UpdateUserRequest requestJson}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "PUT", "$baseUrl${LocalStore.getUrlWithCode()}$account",
          body: requestJson, token: true);
      return response.one((json) => MyAccountDetails.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

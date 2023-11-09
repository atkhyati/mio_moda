import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/signup_request_model.dart';
import 'package:meta_package/api/models/signup_response_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class AuthApi<T> extends AuthApiInterface {
  static const String login = '/rest/V1/integration/customer/token';
  static const String socialLogin = '/rest/V1/sociallogin/';
  static const String signUp = "/rest/V1/customers";
  static const String forgetPassword = '/V1/customers/password';
  static const String forgetPasswordEndPoint = 'https://dev2.brands-labels.com';
  static const String updateUser = "/rest/V1/customers/me";
  static const String getUser = "/rest/V1/customers/me";
  String baseUrl;
  late DioClient client;

  AuthApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<bool> putForgetPasswordProvider({required String requestJson}) async {
    try {
      final response = await client.getClient<bool>(
          "PUT", "$baseUrl${LocalStore.getUrlWithCode()}$forgetPassword",
          body: requestJson);
      return response.data ?? false;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<SocialLoginResponse> postLoginResponseProvider(
      {required String method, required String requestJson}) async {
    try {
      final response = await client.getClient<String>(
          "POST", "$baseUrl/${LocalStore.localStore.currentCode}$login$method",
          body: requestJson);
      return SocialLoginResponse(
          errorMessage: '',
          isError: response.statusCode == 200,
          response: response.data ?? '',
          apiErrorMessage: '');
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<SocialLoginResponse> postSocialLoginResponseProvider(
      {required String requestJson}) async {
    try {
      final response = await client.getClient<String>(
          "POST", "$baseUrl/${LocalStore.localStore.currentCode}$socialLogin",
          body: requestJson);
      return SocialLoginResponse(
          errorMessage: '',
          isError: response.statusCode == 200,
          response: response.data ?? '',
          apiErrorMessage: '');
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<SignUpResponseModel> getSignupResponseProvider(
      {required SignUpRequestModel requestJson}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "POST", '$baseUrl/${LocalStore.localStore.currentCode}$signUp',
          body: requestJson);
      return response.one((json) => SignUpResponseModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class AuthApiInterface<T> {
  Future<T?> putForgetPasswordProvider({required String requestJson});

  Future<T?> postLoginResponseProvider(
      {required String method, required String requestJson});

  Future<T?> postSocialLoginResponseProvider({
    required String requestJson,
  });

  Future<T?> getSignupResponseProvider(
      {required SignUpRequestModel requestJson});
}

class SocialLoginResponse {
  final String errorMessage;
  final String? apiErrorMessage;
  final String response;
  final bool isError;

  SocialLoginResponse({
    required this.response,
    required this.errorMessage,
    this.apiErrorMessage,
    required this.isError,
  });
}

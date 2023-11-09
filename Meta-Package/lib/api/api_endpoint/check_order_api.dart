import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/checkout_order/estimate_shipping_method_model.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class CheckOrderApi<T> extends CheckOrderApiInterface {
  static String estimatesShippingMethodEndPoint =
      "/V1/carts/mine/estimate-shipping-methods";
  static const String estimateMethods = "/estimate-shipping-methods";
  static const String shippingInformation = "/shipping-information";
  static String shippingInformationEndPoint =
      "/V1/carts/mine/shipping-information";
  static String paymentInformationEndPoint =
      "/V1/carts/mine/payment-information";
  static const String guestOrderApi = "/rest/V1/guest-carts/";

  String baseUrl;
  late DioClient client;

  CheckOrderApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<List<EstimateShippingMethodModel>> postEstimateResponseProvider(
      {required String requestJson}) async {
    try {
      final response = await client.getClient<List<dynamic>>("POST",
          "$baseUrl${LocalStore.getUrlWithCode()}$estimatesShippingMethodEndPoint",
          additionalHeaders: {"Accept": "application/json"},
          body: requestJson,
          token: true);
      return response
          .many((json) => EstimateShippingMethodModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<EstimateShippingMethodModel>> postGuestEstimateResponseProvider(
      {required String requestJson}) async {
    try {
      final response = await client.getClient<List<dynamic>>("POST",
          '$baseUrl${LocalStore.getUrlWithCode()}/V1/guest-carts/${LocalStore.localStore.guestToken}$estimateMethods',
          additionalHeaders: {"Accept": "application/json"}, body: requestJson);
      return response
          .many((json) => EstimateShippingMethodModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<ShippingInformationModel> postGuestShippingInformationResponseProvider(
      {required String requestJson}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("POST",
          '$baseUrl${LocalStore.getUrlWithCode()}/V1/guest-carts/${LocalStore.localStore.guestToken}$shippingInformation',
          additionalHeaders: {"Accept": "application/json"}, body: requestJson);
      return response.one((json) => ShippingInformationModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<ShippingInformationModel> postShippingInformationResponseProvider(
      {required String requestJson}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("POST",
          "$baseUrl${LocalStore.getUrlWithCode()}$shippingInformationEndPoint",
          additionalHeaders: {"Accept": "application/json"},
          body: requestJson,
          token: true);
      return response.one((json) => ShippingInformationModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<String> postPaymentInformationProvider(
      {required String requestJson}) async {
    try {
      final response = await client.getClient<String>("POST",
          "$baseUrl${LocalStore.getUrlWithCode()}$paymentInformationEndPoint",
          additionalHeaders: {"Accept": "application/json"},
          body: requestJson,
          token: true);
      return response.data?.replaceAll('"', '') ?? '';
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<String> postGuestCreateOrderResponseProvider(
      {required String requestJson, required String cartId}) async {
    try {
      final response = await client.getClient<String>("PUT",
          "$baseUrl/${LocalStore.localStore.currentCode}$guestOrderApi$cartId/order",
          additionalHeaders: {"Accept": "application/json"},
          body: requestJson,
          token: true);
      return response.data?.replaceAll('"', '') ?? '';
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class CheckOrderApiInterface<T> {
  Future<T?> postEstimateResponseProvider({required String requestJson});

  Future<T?> postGuestEstimateResponseProvider({required String requestJson});

  Future<T?> postGuestShippingInformationResponseProvider(
      {required String requestJson});

  Future<T?> postShippingInformationResponseProvider(
      {required String requestJson});

  Future<T?> postPaymentInformationProvider({required String requestJson});

  Future<T?> postGuestCreateOrderResponseProvider(
      {required String requestJson, required String cartId});
}

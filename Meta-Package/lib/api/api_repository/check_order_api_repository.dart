import 'dart:developer';

import 'package:meta_package/api/api_endpoint/check_order_api.dart';
import 'package:meta_package/api/models/checkout_order/estimate_shipping_method_model.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart';
import 'package:meta_package/api/services/checkout_service.dart';

import '../models/checkout_order/multi_address_model.dart';

class CheckoutOrderAPIRepository {
  String baseUrl;

  CheckoutOrderAPIRepository(
      {required this.checkoutService, required this.baseUrl});

  late CheckOrderApi baseApi = CheckOrderApi(baseUrl: baseUrl);
  final CheckoutService checkoutService;

  Future<List<EstimateShippingMethodModel>> postEstimateAPIResponse(
    String requestJson,
  ) async {
    log('postEstimateAPIResponse is:-->> 000 ');
    return await baseApi.postEstimateResponseProvider(requestJson: requestJson);
  }

  Future<List<EstimateShippingMethodModel>> postGuestEstimateAPIResponse(
      String requestJson) async {
    return await baseApi.postGuestEstimateResponseProvider(
        requestJson: requestJson);
  }

  Future<ShippingInformationModel> postGuestShippingInformationResponse(
      String requestJson) async {
    return await baseApi.postGuestShippingInformationResponseProvider(
        requestJson: requestJson);
  }

  Future<ShippingInformationModel> postShippingInformationAPIResponse(
      String requestJson) async {
    return await baseApi.postShippingInformationResponseProvider(
        requestJson: requestJson);
  }

  Future<String> postPaymentInformationAPIResponse(String requestJson) async {
    return await baseApi.postPaymentInformationProvider(
        requestJson: requestJson);
  }

  Future<String> postGuestCreateOrderAPIResponse(
      String requestJson, String cartId) async {
    return await baseApi.postGuestCreateOrderResponseProvider(
        requestJson: requestJson, cartId: cartId);
  }

  Future<ShippingInformationModel> postShippingInformation(
      Address address,
      Address billingAddress,
      String email,
      bool isSameAsBilling,
      String carrierCode,
      String carrierMethod) async {
    return await checkoutService.postShippingInformation(address,
        billingAddress, email, isSameAsBilling, carrierCode, carrierMethod);
  }

  Future<List<EstimateShippingMethodModel>> postEstimate(
      Address address, String email, bool isSameAsBilling) async {
    return await checkoutService.postEstimate(address, email, isSameAsBilling);
  }

  Future<String> postPaymentInformation(
      {required Address selectedAddress,
      required String email,
      required String paymentMethod}) async {
    return await checkoutService.postPaymentInformation(
        selectedAddress: selectedAddress,
        email: email,
        paymentMethod: paymentMethod);
  }
}

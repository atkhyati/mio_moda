import 'dart:convert';

import 'package:meta_package/api/api_endpoint/check_order_api.dart';
import 'package:meta_package/api/models/checkout_order/estimate_shipping_method_model.dart';
import 'package:meta_package/api/models/checkout_order/multi_address_model.dart';
import 'package:meta_package/api/models/checkout_order/shipping_info_request_model.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart';
import 'package:meta_package/api/models/estimate_api_address/estimate_api_address_model.dart';
import 'package:meta_package/api/models/payment_info_request_model/payment_info_request_model.dart';

class CheckoutService {
  final CheckOrderApi checkoutOrderApi;

  CheckoutService({required this.checkoutOrderApi});

  Future<List<EstimateShippingMethodModel>> postEstimate(
      Address address, String email, bool isSameAsBilling) async {
    var data = EstimateAddressModel(EstimateAddressItem(
        region: address.region != null && address.region?.region != null
            ? address.region?.region?.toString()
            : null,
        regionCode: address.region != null && address.region?.regionCode != null
            ? address.region?.regionCode?.toString()
            : null,
        regionId: address.region != null && address.region?.regionId != null
            ? address.region?.regionId
            : null,
        countryId: address.countryId,
        street: address.street,
        postcode: address.postcode,
        city: address.city,
        firstname: address.firstname,
        lastname: address.lastname,
        customerId: address.customerId,
        email: email,
        telephone: address.telephone,
        sameAsBilling: isSameAsBilling ? 1 : 0));
    return await checkoutOrderApi.postEstimateResponseProvider(
        requestJson: jsonEncode(data.toJson()));
  }

  Future<ShippingInformationModel> postShippingInformation(
      Address address,
      Address billingAddress,
      String email,
      bool isSameAsBilling,
      String carrierCode,
      String carrierMethod) async {
    var shippingAddr = EstimateAddressItem(
        region: (address.region != null && address.region?.region != null)
            ? address.region?.region.toString()
            : null,
        regionCode:
            (address.region != null && address.region?.regionCode != null)
                ? address.region?.regionCode.toString()
                : null,
        regionId: (address.region != null && address.region?.regionId != null)
            ? address.region?.regionId
            : null,
        countryId: address.countryId,
        street: address.street,
        postcode: address.postcode,
        city: address.city,
        firstname: address.firstname,
        lastname: address.lastname,
        customerId: address.customerId,
        email: email,
        telephone: address.telephone,
        sameAsBilling: isSameAsBilling ? 1 : 0);
    var billingAddr = EstimateAddressItem(
        region: (billingAddress.region != null &&
                billingAddress.region?.region != null)
            ? billingAddress.region?.region.toString()
            : null,
        regionCode: (billingAddress.region != null &&
                billingAddress.region?.regionCode != null)
            ? billingAddress.region?.regionCode.toString()
            : null,
        regionId: (billingAddress.region != null &&
                billingAddress.region?.regionId != null)
            ? billingAddress.region?.regionId
            : null,
        countryId: billingAddress.countryId,
        street: billingAddress.street,
        postcode: billingAddress.postcode,
        city: billingAddress.city,
        firstname: billingAddress.firstname,
        lastname: billingAddress.lastname,
        customerId: billingAddress.customerId,
        email: email,
        telephone: billingAddress.telephone,
        sameAsBilling: isSameAsBilling ? 1 : 0);

    ShippingInformationRequestModel requestInfo =
        ShippingInformationRequestModel(AddressInformation(
            shippingAddr, billingAddr, carrierCode, carrierMethod));

    return await checkoutOrderApi.postShippingInformationResponseProvider(
        requestJson: jsonEncode(requestInfo.toJson()));
  }

  Future<String> postPaymentInformation(
      {required Address selectedAddress,
      required String email,
      required String paymentMethod}) async {
    final addr = EstimateAddressItem(
      region: selectedAddress.region != null &&
              selectedAddress.region?.region != null
          ? selectedAddress.region?.region?.toString()
          : null,
      regionCode: selectedAddress.region != null &&
              selectedAddress.region?.regionCode != null
          ? selectedAddress.region?.regionCode?.toString()
          : null,
      regionId: selectedAddress.region != null &&
              selectedAddress.region?.regionId != null
          ? selectedAddress.region?.regionId
          : null,
      countryId: selectedAddress.countryId,
      street: selectedAddress.street,
      postcode: selectedAddress.postcode,
      city: selectedAddress.city,
      firstname: selectedAddress.firstname,
      lastname: selectedAddress.lastname,
      customerId: selectedAddress.customerId,
      email: email,
      telephone: selectedAddress.telephone,
    );
    final param =
        PaymentInformationRequestModel(PaymentMethodItem(paymentMethod), addr);
    return await checkoutOrderApi.postPaymentInformationProvider(
        requestJson: jsonEncode(param.toJson()));
  }
}

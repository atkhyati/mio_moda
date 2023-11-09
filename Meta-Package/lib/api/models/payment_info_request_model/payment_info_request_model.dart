import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/api/models/estimate_api_address/estimate_api_address_model.dart';

part 'payment_info_request_model.g.dart';

@JsonSerializable()
class PaymentInformationRequestModel {
  @JsonKey(name: 'paymentMethod')
  final PaymentMethodItem paymentMethod;

  @JsonKey(name: 'billing_address')
  final EstimateAddressItem billingAddress;

  PaymentInformationRequestModel(this.paymentMethod, this.billingAddress);

  factory PaymentInformationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentInformationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentInformationRequestModelToJson(this);
}

@JsonSerializable()
class PaymentMethodItem {
  @JsonKey()
  final String method;

  PaymentMethodItem(this.method);
  factory PaymentMethodItem.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodItemFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodItemToJson(this);
}

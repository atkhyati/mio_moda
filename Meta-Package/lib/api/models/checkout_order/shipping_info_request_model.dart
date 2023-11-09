import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/api/models/estimate_api_address/estimate_api_address_model.dart';

part 'shipping_info_request_model.g.dart';

@JsonSerializable()
class ShippingInformationRequestModel {
  @JsonKey(name: 'addressInformation')
  final AddressInformation addressInformation;

  ShippingInformationRequestModel(this.addressInformation);
  factory ShippingInformationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingInformationRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ShippingInformationRequestModelToJson(this);
}

@JsonSerializable()
class AddressInformation {
  @JsonKey(name: 'shipping_address')
  final EstimateAddressItem shippingAddress;

  @JsonKey(name: 'billing_address')
  final EstimateAddressItem billingAddress;

  @JsonKey(name: 'shipping_carrier_code')
  final String shippingCarrierCode;

  @JsonKey(name: 'shipping_method_code')
  final String shippingMethodCode;

  AddressInformation(
    this.shippingAddress,
    this.billingAddress,
    this.shippingCarrierCode,
    this.shippingMethodCode,
  );
  factory AddressInformation.fromJson(Map<String, dynamic> json) =>
      _$AddressInformationFromJson(json);

  Map<String, dynamic> toJson() => _$AddressInformationToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_info_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingInformationRequestModel _$ShippingInformationRequestModelFromJson(
        Map<String, dynamic> json) =>
    ShippingInformationRequestModel(
      AddressInformation.fromJson(
          json['addressInformation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShippingInformationRequestModelToJson(
        ShippingInformationRequestModel instance) =>
    <String, dynamic>{
      'addressInformation': instance.addressInformation,
    };

AddressInformation _$AddressInformationFromJson(Map<String, dynamic> json) =>
    AddressInformation(
      EstimateAddressItem.fromJson(
          json['shipping_address'] as Map<String, dynamic>),
      EstimateAddressItem.fromJson(
          json['billing_address'] as Map<String, dynamic>),
      json['shipping_carrier_code'] as String,
      json['shipping_method_code'] as String,
    );

Map<String, dynamic> _$AddressInformationToJson(AddressInformation instance) =>
    <String, dynamic>{
      'shipping_address': instance.shippingAddress,
      'billing_address': instance.billingAddress,
      'shipping_carrier_code': instance.shippingCarrierCode,
      'shipping_method_code': instance.shippingMethodCode,
    };

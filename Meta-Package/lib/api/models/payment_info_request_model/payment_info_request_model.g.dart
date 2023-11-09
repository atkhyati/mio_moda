// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_info_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentInformationRequestModel _$PaymentInformationRequestModelFromJson(
        Map<String, dynamic> json) =>
    PaymentInformationRequestModel(
      PaymentMethodItem.fromJson(json['paymentMethod'] as Map<String, dynamic>),
      EstimateAddressItem.fromJson(
          json['billing_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentInformationRequestModelToJson(
        PaymentInformationRequestModel instance) =>
    <String, dynamic>{
      'paymentMethod': instance.paymentMethod,
      'billing_address': instance.billingAddress,
    };

PaymentMethodItem _$PaymentMethodItemFromJson(Map<String, dynamic> json) =>
    PaymentMethodItem(
      json['method'] as String,
    );

Map<String, dynamic> _$PaymentMethodItemToJson(PaymentMethodItem instance) =>
    <String, dynamic>{
      'method': instance.method,
    };

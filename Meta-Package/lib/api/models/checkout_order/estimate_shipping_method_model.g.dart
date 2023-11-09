// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_shipping_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstimateShippingMethodModel _$EstimateShippingMethodModelFromJson(
        Map<String, dynamic> json) =>
    EstimateShippingMethodModel(
      carrierCode: json['carrier_code'] as String?,
      methodCode: json['method_code'] as String?,
      carrierTitle: json['carrier_title'] as String?,
      methodTitle: json['method_title'] as String?,
      amount: json['amount'] as int?,
      baseAmount: json['base_amount'] as int?,
      available: json['available'] as bool?,
      errorMessage: json['error_message'] as String?,
      priceExclTax: json['price_excl_tax'] as int?,
      priceInclTax: json['price_incl_tax'] as int?,
    );

Map<String, dynamic> _$EstimateShippingMethodModelToJson(
        EstimateShippingMethodModel instance) =>
    <String, dynamic>{
      'carrier_code': instance.carrierCode,
      'method_code': instance.methodCode,
      'carrier_title': instance.carrierTitle,
      'method_title': instance.methodTitle,
      'amount': instance.amount,
      'base_amount': instance.baseAmount,
      'available': instance.available,
      'error_message': instance.errorMessage,
      'price_excl_tax': instance.priceExclTax,
      'price_incl_tax': instance.priceInclTax,
    };

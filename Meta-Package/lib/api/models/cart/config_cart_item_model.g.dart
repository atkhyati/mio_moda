// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigurableCartItemModel _$ConfigurableCartItemModelFromJson(
        Map<String, dynamic> json) =>
    ConfigurableCartItemModel(
      json['sku'] as String,
      json['qty'] as int,
      json['quote_id'] as String,
      ProductOption.fromJson(json['product_option'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigurableCartItemModelToJson(
        ConfigurableCartItemModel instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'qty': instance.qty,
      'quote_id': instance.quoteId,
      'product_option': instance.productOption,
    };

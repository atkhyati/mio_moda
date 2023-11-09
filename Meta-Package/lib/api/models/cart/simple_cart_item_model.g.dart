// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleCartItemModel _$SimpleCartItemModelFromJson(Map<String, dynamic> json) =>
    SimpleCartItemModel(
      json['sku'] as String,
      json['qty'] as int,
      json['quote_id'] as String,
    );

Map<String, dynamic> _$SimpleCartItemModelToJson(
        SimpleCartItemModel instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'qty': instance.qty,
      'quote_id': instance.quoteId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartModal _$AddToCartModalFromJson(Map<String, dynamic> json) =>
    AddToCartModal(
      itemId: json['item_id'] as int?,
      sku: json['sku'] as String?,
      qty: json['qty'] as int?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      productType: json['product_type'] as String?,
      quoteId: json['quote_id'] as String?,
    );

Map<String, dynamic> _$AddToCartModalToJson(AddToCartModal instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'sku': instance.sku,
      'qty': instance.qty,
      'name': instance.name,
      'price': instance.price,
      'product_type': instance.productType,
      'quote_id': instance.quoteId,
    };

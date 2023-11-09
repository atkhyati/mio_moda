// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      price: (json['price'] as num?)?.toDouble(),
      qty: json['qty'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'qty': instance.qty,
      'message': instance.message,
    };

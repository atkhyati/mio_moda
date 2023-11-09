// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendedProductModel _$RecommendedProductModelFromJson(
        Map<String, dynamic> json) =>
    RecommendedProductModel(
      productId: json['product_id'] as String?,
      sku: json['sku'] as String?,
      typeId: json['type_id'] as String?,
      name: json['name'] as String?,
      productUrl: json['product_url'] as String?,
      imageUrl: json['image_url'] as String?,
      brandName: json['brand_name'] as String?,
      price: json['price'] as String?,
      status: json['status'] as String?,
      message: json['message'] as String?,
      storeId: json['store_id'] as int?,
    );

Map<String, dynamic> _$RecommendedProductModelToJson(
        RecommendedProductModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'sku': instance.sku,
      'type_id': instance.typeId,
      'name': instance.name,
      'product_url': instance.productUrl,
      'image_url': instance.imageUrl,
      'brand_name': instance.brandName,
      'price': instance.price,
      'status': instance.status,
      'message': instance.message,
      'store_id': instance.storeId,
    };

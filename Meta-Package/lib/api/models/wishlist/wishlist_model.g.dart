// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishListProductModel _$WishListProductModelFromJson(
        Map<String, dynamic> json) =>
    WishListProductModel(
      itemsCount: json['items_count'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WishListProductModelToJson(
        WishListProductModel instance) =>
    <String, dynamic>{
      'items_count': instance.itemsCount,
      'items': instance.items,
    };

ItemProduct _$ItemProductFromJson(Map<String, dynamic> json) => ItemProduct(
      id: json['id'] as int?,
      product: json['product'] == null
          ? null
          : WishlistItem.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemProductToJson(ItemProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };

WishlistItem _$WishlistItemFromJson(Map<String, dynamic> json) => WishlistItem(
      id: json['id'] as int?,
      sku: json['sku'] as String?,
      name: json['name'] as String?,
      attributeSetId: json['attribute_set_id'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      status: json['status'] as int?,
      visibility: json['visibility'] as int?,
      typeId: json['type_id'] as String?,
      createdAt:
          DateParseUtils.dateTimeFromJsonUTC(json['created_at'] as String?),
      updatedAt:
          DateParseUtils.dateTimeFromJsonUTC(json['updated_at'] as String?),
      extensionAttributes: json['extension_attributes'] == null
          ? null
          : ExtensionAttributesProduct.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
      productLinks: json['product_links'] as List<dynamic>?,
      tierPrices: json['tier_prices'] as List<dynamic>?,
      customAttributes: (json['custom_attributes'] as List<dynamic>?)
          ?.map((e) => CustomAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: json['weight'] as int?,
      options: json['options'] as List<dynamic>?,
      mediaGalleryEntries: (json['media_gallery_entries'] as List<dynamic>?)
          ?.map((e) => MediaGalleryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..sizeList = (json['sizeList'] as List<dynamic>?)
        ?.map((e) => SizeModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$WishlistItemToJson(WishlistItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'name': instance.name,
      'attribute_set_id': instance.attributeSetId,
      'price': instance.price,
      'status': instance.status,
      'visibility': instance.visibility,
      'type_id': instance.typeId,
      'created_at': DateParseUtils.dateTimeToJsonUTC(instance.createdAt),
      'updated_at': DateParseUtils.dateTimeToJsonUTC(instance.updatedAt),
      'extension_attributes': instance.extensionAttributes,
      'product_links': instance.productLinks,
      'tier_prices': instance.tierPrices,
      'custom_attributes': instance.customAttributes,
      'weight': instance.weight,
      'options': instance.options,
      'media_gallery_entries': instance.mediaGalleryEntries,
      'sizeList': instance.sizeList,
    };

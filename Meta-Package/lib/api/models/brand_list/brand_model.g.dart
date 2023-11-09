// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => BrandModel(
      brandId: json['brand_id'] as String,
      attributeId: json['attribute_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      urlKey: json['url_key'] as String,
      logoPath: json['logo_path'] as String,
      sortOrder: json['sort_order'] as String,
      isActive: json['is_active'] as String,
      isFeatured: json['is_featured'] as String,
      seoTitle: json['seo_title'] as String,
      seoDesc: json['seo_desc'] as String,
      seoKeyword: json['seo_keyword'] as String,
      updatedAt:
          DateParseUtils.dateTimeFromJsonUTC(json['updated_at'] as String?),
      createdAt:
          DateParseUtils.dateTimeFromJsonUTC(json['created_at'] as String?),
    );

Map<String, dynamic> _$BrandModelToJson(BrandModel instance) =>
    <String, dynamic>{
      'brand_id': instance.brandId,
      'attribute_id': instance.attributeId,
      'name': instance.name,
      'description': instance.description,
      'url_key': instance.urlKey,
      'logo_path': instance.logoPath,
      'sort_order': instance.sortOrder,
      'is_active': instance.isActive,
      'is_featured': instance.isFeatured,
      'seo_title': instance.seoTitle,
      'seo_desc': instance.seoDesc,
      'seo_keyword': instance.seoKeyword,
      'created_at': DateParseUtils.dateTimeToJsonUTC(instance.createdAt),
      'updated_at': DateParseUtils.dateTimeToJsonUTC(instance.updatedAt),
    };

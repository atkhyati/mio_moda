// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_views_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreViewsModel _$StoreViewsModelFromJson(Map<String, dynamic> json) =>
    StoreViewsModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      websiteId: json['website_id'] as int?,
      storeGroupId: json['store_group_id'] as int?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$StoreViewsModelToJson(StoreViewsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'website_id': instance.websiteId,
      'store_group_id': instance.storeGroupId,
      'is_active': instance.isActive,
    };

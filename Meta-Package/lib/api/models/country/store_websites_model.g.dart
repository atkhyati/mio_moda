// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_websites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreWebSitesModel _$StoreWebSitesModelFromJson(Map<String, dynamic> json) =>
    StoreWebSitesModel(
      code: json['code'] as String?,
      name: json['name'] as String?,
      websiteId: json['website_id'] as int?,
      storeList: (json['store_list'] as List<dynamic>?)
          ?.map((e) => StoreListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultDisplayCurrencyCode:
          json['default_display_currency_code'] as String?,
    );

Map<String, dynamic> _$StoreWebSitesModelToJson(StoreWebSitesModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'website_id': instance.websiteId,
      'default_display_currency_code': instance.defaultDisplayCurrencyCode,
      'store_list': instance.storeList,
    };

StoreListModel _$StoreListModelFromJson(Map<String, dynamic> json) =>
    StoreListModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$StoreListModelToJson(StoreListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'is_active': instance.isActive,
    };

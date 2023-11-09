// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreConfigModel _$StoreConfigModelFromJson(Map<String, dynamic> json) =>
    StoreConfigModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      websiteId: json['website_id'] as int?,
      locale: json['locale'] as String?,
      baseCurrencyCode: json['base_currency_code'] as String?,
      defaultDisplayCurrencyCode:
          json['default_display_currency_code'] as String?,
      timezone: json['timezone'] as String?,
      weightUnit: json['weight_unit'] as String?,
      baseUrl: json['base_url'] as String?,
      baseLinkUrl: json['base_link_url'] as String?,
      baseStaticUrl: json['base_static_url'] as String?,
      baseMediaUrl: json['base_media_url'] as String?,
      secureBaseUrl: json['secure_base_url'] as String?,
      secureBaseLinkUrl: json['secure_base_link_url'] as String?,
      secureBaseStaticUrl: json['secure_base_static_url'] as String?,
      secureBaseMediaUrl: json['secure_base_media_url'] as String?,
    );

Map<String, dynamic> _$StoreConfigModelToJson(StoreConfigModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'website_id': instance.websiteId,
      'locale': instance.locale,
      'base_currency_code': instance.baseCurrencyCode,
      'default_display_currency_code': instance.defaultDisplayCurrencyCode,
      'timezone': instance.timezone,
      'weight_unit': instance.weightUnit,
      'base_url': instance.baseUrl,
      'base_link_url': instance.baseLinkUrl,
      'base_static_url': instance.baseStaticUrl,
      'base_media_url': instance.baseMediaUrl,
      'secure_base_url': instance.secureBaseUrl,
      'secure_base_link_url': instance.secureBaseLinkUrl,
      'secure_base_static_url': instance.secureBaseStaticUrl,
      'secure_base_media_url': instance.secureBaseMediaUrl,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_store_language_currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalStoreLanguageCurrencyModel _$LocalStoreLanguageCurrencyModelFromJson(
        Map<String, dynamic> json) =>
    LocalStoreLanguageCurrencyModel(
      countryName: json['country_name'] as String?,
      id: json['id'] as int?,
      storeLanguageList: (json['store_language_list'] as List<dynamic>?)
          ?.map((e) => StoreViewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      storeLanguageCurrencyList: (json['store_language_currency_list']
              as List<dynamic>?)
          ?.map((e) =>
              StoreLanguageCurrencyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..currentId = json['current_id'] as int?;

Map<String, dynamic> _$LocalStoreLanguageCurrencyModelToJson(
        LocalStoreLanguageCurrencyModel instance) =>
    <String, dynamic>{
      'current_id': instance.currentId,
      'id': instance.id,
      'country_name': instance.countryName,
      'store_language_list': instance.storeLanguageList,
      'store_language_currency_list': instance.storeLanguageCurrencyList,
    };

StoreLanguageCurrencyModel _$StoreLanguageCurrencyModelFromJson(
        Map<String, dynamic> json) =>
    StoreLanguageCurrencyModel(
      id: json['id'] as int?,
      locale: json['locale'] as String?,
      baseCurrencyCode: json['base_currency_code'] as String?,
      defaultDisplayCurrencyCode:
          json['default_display_currency_code'] as String?,
    );

Map<String, dynamic> _$StoreLanguageCurrencyModelToJson(
        StoreLanguageCurrencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locale': instance.locale,
      'base_currency_code': instance.baseCurrencyCode,
      'default_display_currency_code': instance.defaultDisplayCurrencyCode,
    };

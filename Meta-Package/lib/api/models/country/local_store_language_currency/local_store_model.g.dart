// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalStoreModel _$LocalStoreModelFromJson(Map<String, dynamic> json) =>
    LocalStoreModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      currentCode: json['current_code'] as String?,
      currentCurrency: json['current_currency'] as String?,
      languageList: json['language_list'] as List<dynamic>?,
      currencyList: json['currency_list'] as List<dynamic>?,
      storeViewModelList: (json['store_view_model'] as List<dynamic>?)
          ?.map((e) => LocalStoreViewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      storeLanguageCurrencyModelList:
          (json['store_language_currency_model'] as List<dynamic>?)
              ?.map((e) => LocalStoreLanguageCurrencyModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$LocalStoreModelToJson(LocalStoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'current_code': instance.currentCode,
      'current_currency': instance.currentCurrency,
      'language_list': instance.languageList,
      'currency_list': instance.currencyList,
      'store_view_model': instance.storeViewModelList,
      'store_language_currency_model': instance.storeLanguageCurrencyModelList,
    };

LocalStoreLanguageCurrencyModel _$LocalStoreLanguageCurrencyModelFromJson(
        Map<String, dynamic> json) =>
    LocalStoreLanguageCurrencyModel(
      id: json['id'] as int?,
      locale: json['locale'] as String?,
      baseCurrencyCode: json['base_currency_code'] as String?,
      defaultDisplayCurrencyCode:
          json['default_display_currency_code'] as String?,
    );

Map<String, dynamic> _$LocalStoreLanguageCurrencyModelToJson(
        LocalStoreLanguageCurrencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locale': instance.locale,
      'base_currency_code': instance.baseCurrencyCode,
      'default_display_currency_code': instance.defaultDisplayCurrencyCode,
    };

LocalStoreViewModel _$LocalStoreViewModelFromJson(Map<String, dynamic> json) =>
    LocalStoreViewModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      websiteId: json['website_id'] as int?,
      storeGroupId: json['store_group_id'] as int?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$LocalStoreViewModelToJson(
        LocalStoreViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'website_id': instance.websiteId,
      'store_group_id': instance.storeGroupId,
      'is_active': instance.isActive,
    };

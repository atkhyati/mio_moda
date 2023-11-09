// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      baseCurrencyCode: json['base_currency_code'] as String?,
      baseCurrencySymbol: json['base_currency_symbol'] as String?,
      defaultDisplayCurrencyCode:
          json['default_display_currency_code'] as String? ?? "",
      defaultDisplayCurrencySymbol:
          json['default_display_currency_symbol'] as String?,
      availableCurrencyCodes:
          (json['available_currency_codes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      exchangeRates: (json['exchange_rates'] as List<dynamic>?)
          ?.map((e) => ExchangeRates.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'base_currency_code': instance.baseCurrencyCode,
      'base_currency_symbol': instance.baseCurrencySymbol,
      'default_display_currency_code': instance.defaultDisplayCurrencyCode,
      'default_display_currency_symbol': instance.defaultDisplayCurrencySymbol,
      'available_currency_codes': instance.availableCurrencyCodes,
      'exchange_rates': instance.exchangeRates,
    };

ExchangeRates _$ExchangeRatesFromJson(Map<String, dynamic> json) =>
    ExchangeRates(
      currencyTo: json['currency_to'] as String?,
      rate: json['rate'],
    );

Map<String, dynamic> _$ExchangeRatesToJson(ExchangeRates instance) =>
    <String, dynamic>{
      'currency_to': instance.currencyTo,
      'rate': instance.rate,
    };

import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel {
  CurrencyModel({
    this.baseCurrencyCode,
    this.baseCurrencySymbol,
    this.defaultDisplayCurrencyCode = "",
    this.defaultDisplayCurrencySymbol,
    this.availableCurrencyCodes,
    this.exchangeRates,
  });

  @JsonKey(name: 'base_currency_code')
  String? baseCurrencyCode;
  @JsonKey(name: 'base_currency_symbol')
  String? baseCurrencySymbol;
  @JsonKey(name: 'default_display_currency_code')
  String? defaultDisplayCurrencyCode;
  @JsonKey(name: 'default_display_currency_symbol')
  String? defaultDisplayCurrencySymbol;
  @JsonKey(name: 'available_currency_codes')
  List<String>? availableCurrencyCodes;
  @JsonKey(name: 'exchange_rates')
  List<ExchangeRates>? exchangeRates;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}

@JsonSerializable()
class ExchangeRates {
  ExchangeRates({
    this.currencyTo,
    this.rate,
  });

  @JsonKey(name: 'currency_to')
  String? currencyTo;
  dynamic rate;

  factory ExchangeRates.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRatesFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRatesToJson(this);
}

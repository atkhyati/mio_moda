import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/api/models/country/store_views_model.dart';

part 'local_store_language_currency_model.g.dart';

@JsonSerializable()
class LocalStoreLanguageCurrencyModel {
  LocalStoreLanguageCurrencyModel(
      {this.countryName,
      this.id,
      this.storeLanguageList,
      this.storeLanguageCurrencyList});

  @JsonKey(name: 'current_id')
  int? currentId;
  int? id;
  @JsonKey(name: 'country_name')
  String? countryName;
  @JsonKey(name: 'store_language_list')
  List<StoreViewsModel>? storeLanguageList;
  @JsonKey(name: 'store_language_currency_list')
  List<StoreLanguageCurrencyModel>? storeLanguageCurrencyList;

  factory LocalStoreLanguageCurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$LocalStoreLanguageCurrencyModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalStoreLanguageCurrencyModelToJson(this);
}

@JsonSerializable()
class StoreLanguageCurrencyModel {
  StoreLanguageCurrencyModel(
      {this.id,
      this.locale,
      this.baseCurrencyCode,
      this.defaultDisplayCurrencyCode});

  int? id;
  String? locale;
  @JsonKey(name: 'base_currency_code')
  String? baseCurrencyCode;
  @JsonKey(name: 'default_display_currency_code')
  String? defaultDisplayCurrencyCode;

  factory StoreLanguageCurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$StoreLanguageCurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreLanguageCurrencyModelToJson(this);
}

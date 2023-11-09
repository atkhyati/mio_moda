// To parse this JSON data, do
//
//     final localStoreModel = localStoreModelFromJson(jsonString?);

import 'package:json_annotation/json_annotation.dart';

part 'local_store_model.g.dart';

@JsonSerializable()
class LocalStoreModel {
  LocalStoreModel({
    this.id,
    this.name,
    this.currentCode,
    this.currentCurrency,
    this.languageList,
    this.currencyList,
    this.storeViewModelList,
    this.storeLanguageCurrencyModelList,
  });

  int? id;
  String? name;
  @JsonKey(name: 'current_code')
  String? currentCode;
  @JsonKey(name: 'current_currency')
  String? currentCurrency;
  @JsonKey(name: 'language_list')
  List<dynamic>? languageList;
  @JsonKey(name: 'currency_list')
  List<dynamic>? currencyList;
  @JsonKey(name: 'store_view_model')
  List<LocalStoreViewModel>? storeViewModelList;
  @JsonKey(name: 'store_language_currency_model')
  List<LocalStoreLanguageCurrencyModel>? storeLanguageCurrencyModelList;

  factory LocalStoreModel.fromJson(Map<String, dynamic> json) =>
      _$LocalStoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocalStoreModelToJson(this);

  LocalStoreViewModel? getStore(code) {
    LocalStoreViewModel localStoreViewModel =
        storeViewModelList!.firstWhere((element) => element.code == code);
    return localStoreViewModel;
  }
}

@JsonSerializable()
class LocalStoreLanguageCurrencyModel {
  LocalStoreLanguageCurrencyModel(
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

  factory LocalStoreLanguageCurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$LocalStoreLanguageCurrencyModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalStoreLanguageCurrencyModelToJson(this);
}

@JsonSerializable()
class LocalStoreViewModel {
  LocalStoreViewModel({
    this.id,
    this.code,
    this.name,
    this.websiteId,
    this.storeGroupId,
    this.isActive,
  });

  int? id;
  String? code;
  String? name;
  @JsonKey(name: 'website_id')
  int? websiteId;
  @JsonKey(name: 'store_group_id')
  int? storeGroupId;
  @JsonKey(name: 'is_active')
  int? isActive;

  factory LocalStoreViewModel.fromJson(Map<String, dynamic> json) =>
      _$LocalStoreViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocalStoreViewModelToJson(this);
}

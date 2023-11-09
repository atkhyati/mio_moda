// To parse this JSON data, do
//
//     final storeWebSitesModel = storeWebSitesModelFromJson(jsonString);
import 'package:json_annotation/json_annotation.dart';

part 'store_websites_model.g.dart';

@JsonSerializable()
class StoreWebSitesModel {
  StoreWebSitesModel({
    this.code,
    this.name,
    this.websiteId,
    this.storeList,
    this.defaultDisplayCurrencyCode
  });

  String? code;
  String? name;
  @JsonKey(name: 'website_id')
  int? websiteId;
  @JsonKey(name: "default_display_currency_code")
  String? defaultDisplayCurrencyCode;
  @JsonKey(name: 'store_list')
  List<StoreListModel>? storeList;

  factory StoreWebSitesModel.fromJson(Map<String, dynamic> json) =>
      _$StoreWebSitesModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreWebSitesModelToJson(this);
}

@JsonSerializable()
class StoreListModel {
  StoreListModel({
    this.id,
    this.code,
    this.name,
    this.isActive,
  });

  int? id;
  String? code;
  String? name;
  @JsonKey(name: 'is_active')
  int? isActive;

  factory StoreListModel.fromJson(Map<String, dynamic> json) =>
      _$StoreListModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreListModelToJson(this);
}

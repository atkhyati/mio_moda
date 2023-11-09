// To parse this JSON data, do
//
//     final storeConfigModel = storeConfigModelFromJson(jsonString);

// ignore_for_file: prefer_conditional_assignment, constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'store_config_model.g.dart';

@JsonSerializable()
class StoreConfigModel {
  StoreConfigModel({
    this.id,
    this.code,
    this.websiteId,
    this.locale,
    this.baseCurrencyCode,
    this.defaultDisplayCurrencyCode,
    this.timezone,
    this.weightUnit,
    this.baseUrl,
    this.baseLinkUrl,
    this.baseStaticUrl,
    this.baseMediaUrl,
    this.secureBaseUrl,
    this.secureBaseLinkUrl,
    this.secureBaseStaticUrl,
    this.secureBaseMediaUrl,
  });

  int? id;
  String? code;
  @JsonKey(name: 'website_id')
  int? websiteId;
  String? locale;
  @JsonKey(name: 'base_currency_code')
  String? baseCurrencyCode;
  @JsonKey(name: 'default_display_currency_code')
  String? defaultDisplayCurrencyCode;
  String? timezone;
  @JsonKey(name: 'weight_unit')
  String? weightUnit;
  @JsonKey(name: 'base_url')
  String? baseUrl;
  @JsonKey(name: 'base_link_url')
  String? baseLinkUrl;
  @JsonKey(name: 'base_static_url')
  String? baseStaticUrl;
  @JsonKey(name: 'base_media_url')
  String? baseMediaUrl;
  @JsonKey(name: 'secure_base_url')
  String? secureBaseUrl;
  @JsonKey(name: 'secure_base_link_url')
  String? secureBaseLinkUrl;
  @JsonKey(name: 'secure_base_static_url')
  String? secureBaseStaticUrl;
  @JsonKey(name: 'secure_base_media_url')
  String? secureBaseMediaUrl;

  factory StoreConfigModel.fromJson(Map<String, dynamic> json) =>
      _$StoreConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreConfigModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/utils/date_utils.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel {
  BrandModel({
    required this.brandId,
    required this.attributeId,
    required this.name,
    required this.description,
    required this.urlKey,
    required this.logoPath,
    required this.sortOrder,
    required this.isActive,
    required this.isFeatured,
    required this.seoTitle,
    required this.seoDesc,
    required this.seoKeyword,
    required this.updatedAt,
    required this.createdAt,
  });

  @JsonKey(name: 'brand_id')
  String brandId;
  @JsonKey(name: 'attribute_id')
  String attributeId;
  String name;
  String description;
  @JsonKey(name: 'url_key')
  String urlKey;
  @JsonKey(name: 'logo_path')
  String logoPath;
  @JsonKey(name: 'sort_order')
  String sortOrder;
  @JsonKey(name: 'is_active')
  String isActive;
  @JsonKey(name: 'is_featured')
  String isFeatured;
  @JsonKey(name: 'seo_title')
  String seoTitle;
  @JsonKey(name: 'seo_desc')
  String seoDesc;
  @JsonKey(name: 'seo_keyword')
  String seoKeyword;
  @JsonKey(
      name: 'created_at',
      fromJson: DateParseUtils.dateTimeFromJsonUTC,
      toJson: DateParseUtils.dateTimeToJsonUTC)
  DateTime? createdAt;
  @JsonKey(
      name: 'updated_at',
      fromJson: DateParseUtils.dateTimeFromJsonUTC,
      toJson: DateParseUtils.dateTimeToJsonUTC)
  DateTime? updatedAt;

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);

  void add(BrandModel brand) {}
}

import 'package:json_annotation/json_annotation.dart';

part 'store_views_model.g.dart';

@JsonSerializable()
class StoreViewsModel {
  StoreViewsModel({
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

  factory StoreViewsModel.fromJson(Map<String, dynamic> json) =>
      _$StoreViewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreViewsModelToJson(this);
}

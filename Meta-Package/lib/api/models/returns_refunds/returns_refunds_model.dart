import 'package:json_annotation/json_annotation.dart';

part 'returns_refunds_model.g.dart';

@JsonSerializable()
class ReturnsAndRefundsModel {
  ReturnsAndRefundsModel({
    this.cmspagemanagerId,
    this.cmsId,
    this.status,
    this.extraData,
    this.cmsText,
    this.createdAt,
  });

  @JsonKey(name: 'cmspagemanager_id')
  String? cmspagemanagerId;
  @JsonKey(name: 'cms_id')
  String? cmsId;
  String? status;
  @JsonKey(name: 'extra_data')
  dynamic extraData;
  @JsonKey(name: 'cms_text')
  List<CmsText>? cmsText;
  @JsonKey(name: 'created_at')
  String? createdAt;

  factory ReturnsAndRefundsModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnsAndRefundsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnsAndRefundsModelToJson(this);
}

@JsonSerializable()
class CmsText {
  CmsText({
    this.title,
    this.subTitle,
    this.description,
  });

  String? title;
  @JsonKey(name: 'sub_title')
  String? subTitle;
  String? description;

  factory CmsText.fromJson(Map<String, dynamic> json) =>
      _$CmsTextFromJson(json);

  Map<String, dynamic> toJson() => _$CmsTextToJson(this);
}

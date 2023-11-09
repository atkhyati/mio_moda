import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/utils/date_utils.dart';

part 'shipping_model.g.dart';

@JsonSerializable()
class ShippingData {
  ShippingData({
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
  @JsonKey(
      name: 'created_at',
      fromJson: DateParseUtils.dateTimeFromJsonUTC,
      toJson: DateParseUtils.dateTimeToJsonUTC)
  DateTime? createdAt;

  factory ShippingData.fromJson(Map<String, dynamic> json) =>
      _$ShippingDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingDataToJson(this);
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

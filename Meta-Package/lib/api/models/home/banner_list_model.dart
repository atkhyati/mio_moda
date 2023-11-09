import 'package:json_annotation/json_annotation.dart';

part 'banner_list_model.g.dart';

@JsonSerializable()
class BannerListModel {
  BannerListModel({
    this.id,
    this.sliderId,
    this.status,
    this.showTitle,
    this.title,
    this.description,
    this.altText,
    this.url,
    this.customContent,
    this.image,
    this.mobileImage,
    this.thumbImage,
    this.video,
    this.validFrom,
    this.validTo,
    this.gaPromoId,
    this.gaPromoName,
    this.gaPromoCreative,
    this.gaPromoPosition,
  });

  String? id;
  @JsonKey(name: 'slider_id')
  String? sliderId;
  String? status;
  @JsonKey(name: 'show_title')
  String? showTitle;
  String? title;
  String? description;
  @JsonKey(name: 'alt_text')
  String? altText;
  String? url;
  @JsonKey(name: 'custom_content')
  String? customContent;
  String? image;
  @JsonKey(name: 'mobile_image')
  String? mobileImage;
  @JsonKey(name: 'thumb_image')
  String? thumbImage;
  String? video;
  @JsonKey(name: 'valid_from')
  String? validFrom;
  @JsonKey(name: 'valid_to')
  String? validTo;
  @JsonKey(name: 'ga_promo_id')
  String? gaPromoId;
  @JsonKey(name: 'ga_promo_name')
  String? gaPromoName;
  @JsonKey(name: 'ga_promo_creative')
  String? gaPromoCreative;
  @JsonKey(name: 'ga_promo_position')
  String? gaPromoPosition;

  factory BannerListModel.fromJson(Map<String, dynamic> json) =>
      _$BannerListModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerListModelToJson(this);
}

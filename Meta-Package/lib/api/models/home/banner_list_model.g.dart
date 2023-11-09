// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerListModel _$BannerListModelFromJson(Map<String, dynamic> json) =>
    BannerListModel(
      id: json['id'] as String?,
      sliderId: json['slider_id'] as String?,
      status: json['status'] as String?,
      showTitle: json['show_title'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      altText: json['alt_text'] as String?,
      url: json['url'] as String?,
      customContent: json['custom_content'] as String?,
      image: json['image'] as String?,
      mobileImage: json['mobile_image'] as String?,
      thumbImage: json['thumb_image'] as String?,
      video: json['video'] as String?,
      validFrom: json['valid_from'] as String?,
      validTo: json['valid_to'] as String?,
      gaPromoId: json['ga_promo_id'] as String?,
      gaPromoName: json['ga_promo_name'] as String?,
      gaPromoCreative: json['ga_promo_creative'] as String?,
      gaPromoPosition: json['ga_promo_position'] as String?,
    );

Map<String, dynamic> _$BannerListModelToJson(BannerListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slider_id': instance.sliderId,
      'status': instance.status,
      'show_title': instance.showTitle,
      'title': instance.title,
      'description': instance.description,
      'alt_text': instance.altText,
      'url': instance.url,
      'custom_content': instance.customContent,
      'image': instance.image,
      'mobile_image': instance.mobileImage,
      'thumb_image': instance.thumbImage,
      'video': instance.video,
      'valid_from': instance.validFrom,
      'valid_to': instance.validTo,
      'ga_promo_id': instance.gaPromoId,
      'ga_promo_name': instance.gaPromoName,
      'ga_promo_creative': instance.gaPromoCreative,
      'ga_promo_position': instance.gaPromoPosition,
    };

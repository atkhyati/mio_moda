// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqModel _$FaqModelFromJson(Map<String, dynamic> json) => FaqModel(
      cmspagemanagerId: json['cmspagemanager_id'] as String?,
      cmsId: json['cms_id'] as String?,
      status: json['status'] as String?,
      extraData: json['extra_data'],
      cmsText: (json['cms_text'] as List<dynamic>?)
          ?.map((e) => CmsText.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$FaqModelToJson(FaqModel instance) => <String, dynamic>{
      'cmspagemanager_id': instance.cmspagemanagerId,
      'cms_id': instance.cmsId,
      'status': instance.status,
      'extra_data': instance.extraData,
      'cms_text': instance.cmsText,
      'created_at': instance.createdAt,
    };

CmsText _$CmsTextFromJson(Map<String, dynamic> json) => CmsText(
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CmsTextToJson(CmsText instance) => <String, dynamic>{
      'title': instance.title,
      'sub_title': instance.subTitle,
      'description': instance.description,
    };

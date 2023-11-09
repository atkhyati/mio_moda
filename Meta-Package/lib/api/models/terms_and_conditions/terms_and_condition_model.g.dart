// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_condition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsAndConditionsModel _$TermsAndConditionsModelFromJson(
        Map<String, dynamic> json) =>
    TermsAndConditionsModel(
      id: json['id'] as int?,
      identifier: json['identifier'] as String?,
      title: json['title'] as String?,
      pageLayout: json['page_layout'] as String?,
      metaTitle: json['meta_title'] as String?,
      metaKeywords: json['meta_keywords'] as String?,
      metaDescription: json['meta_description'] as String?,
      contentHeading: json['content_heading'] as String?,
      content: json['content'] as String?,
      creationTime: json['creation_time'] as String?,
      updateTime: json['update_time'] as String?,
      sortOrder: json['sort_order'] as String?,
      layoutUpdateXml: json['layout_update_xml'] as String?,
      customTheme: json['custom_theme'] as String?,
      customRootTemplate: json['custom_root_template'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$TermsAndConditionsModelToJson(
        TermsAndConditionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identifier': instance.identifier,
      'title': instance.title,
      'page_layout': instance.pageLayout,
      'meta_title': instance.metaTitle,
      'meta_keywords': instance.metaKeywords,
      'meta_description': instance.metaDescription,
      'content_heading': instance.contentHeading,
      'content': instance.content,
      'creation_time': instance.creationTime,
      'update_time': instance.updateTime,
      'sort_order': instance.sortOrder,
      'layout_update_xml': instance.layoutUpdateXml,
      'custom_theme': instance.customTheme,
      'custom_root_template': instance.customRootTemplate,
      'active': instance.active,
    };

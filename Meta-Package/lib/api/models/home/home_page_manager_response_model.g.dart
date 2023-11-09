// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_manager_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageManagerResponseModel _$HomePageManagerResponseModelFromJson(
        Map<String, dynamic> json) =>
    HomePageManagerResponseModel(
      id: json['id'] as String?,
      layout: json['layout'] as String?,
      layoutId: json['layout_id'] as String?,
      title: json['title'] as String?,
      status: json['status'] as String?,
      sortOrder: json['sort_order'] as String?,
      extraData: json['extra_data'],
      description: json['description'] as String?,
      btnText: json['btn_text'] as String?,
      imagesData: (json['images_data'] as List<dynamic>?)
          ?.map((e) => ImagesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$HomePageManagerResponseModelToJson(
        HomePageManagerResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'layout': instance.layout,
      'layout_id': instance.layoutId,
      'title': instance.title,
      'status': instance.status,
      'sort_order': instance.sortOrder,
      'extra_data': instance.extraData,
      'description': instance.description,
      'btn_text': instance.btnText,
      'images_data': instance.imagesData,
      'created_at': instance.createdAt,
    };

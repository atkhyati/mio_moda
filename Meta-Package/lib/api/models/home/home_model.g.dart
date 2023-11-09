// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      id: json['id'] as String?,
      layout: json['layout'] as String?,
      layoutId: json['layout_id'] as String?,
      title: json['title'] as String?,
      status: json['status'] as String?,
      sortOrder: json['sort_order'] as String?,
      extraData: json['extra_data'] as String?,
      imagesData: (json['images_data'] as List<dynamic>?)
          ?.map((e) => ImagesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
    )..content = json['content'] as String?;

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'id': instance.id,
      'layout': instance.layout,
      'layout_id': instance.layoutId,
      'title': instance.title,
      'status': instance.status,
      'sort_order': instance.sortOrder,
      'extra_data': instance.extraData,
      'images_data': instance.imagesData,
      'created_at': instance.createdAt,
      'content': instance.content,
    };

ImagesData _$ImagesDataFromJson(Map<String, dynamic> json) => ImagesData(
      title: json['title'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ImagesDataToJson(ImagesData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
    };

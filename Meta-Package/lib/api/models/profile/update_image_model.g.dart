// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateImageModel _$UpdateImageModelFromJson(Map<String, dynamic> json) =>
    UpdateImageModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateImageModelToJson(UpdateImageModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      image: json['image'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'image': instance.image,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommentModel _$GetCommentModelFromJson(Map<String, dynamic> json) =>
    GetCommentModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCommentModelToJson(GetCommentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

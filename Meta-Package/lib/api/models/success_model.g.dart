// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessModel _$SuccessModelFromJson(Map<String, dynamic> json) => SuccessModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SuccessModelToJson(SuccessModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

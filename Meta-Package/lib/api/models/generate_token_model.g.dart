// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateTokenModel _$GenerateTokenModelFromJson(Map<String, dynamic> json) =>
    GenerateTokenModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerateTokenModelToJson(GenerateTokenModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      token: json['token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'token': instance.token,
      'refresh_token': instance.refreshToken,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsResponseModel _$ContactUsResponseModelFromJson(
        Map<String, dynamic> json) =>
    ContactUsResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactUsResponseModelToJson(
        ContactUsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
    };

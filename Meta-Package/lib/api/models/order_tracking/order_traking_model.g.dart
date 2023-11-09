// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_traking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderTrackingModel _$OrderTrackingModelFromJson(Map<String, dynamic> json) =>
    OrderTrackingModel(
      statusCode: json['status_code'] as String?,
      statusTitle: json['status_title'] as String?,
      statusDate: json['status_date'] as String?,
    );

Map<String, dynamic> _$OrderTrackingModelToJson(OrderTrackingModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_title': instance.statusTitle,
      'status_date': instance.statusDate,
    };

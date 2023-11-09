// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) =>
    UpdateUserRequest(
      customer: json['customer'] == null
          ? null
          : CustomerDetails.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) =>
    <String, dynamic>{
      'customer': instance.customer,
    };

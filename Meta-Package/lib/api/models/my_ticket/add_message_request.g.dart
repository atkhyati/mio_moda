// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMessageRequest _$AddMessageRequestFromJson(Map<String, dynamic> json) =>
    AddMessageRequest(
      website: json['website'],
      ticketId: json['ticket_id'],
      action: json['action'],
      message: json['message'],
      email: json['email'],
    );

Map<String, dynamic> _$AddMessageRequestToJson(AddMessageRequest instance) =>
    <String, dynamic>{
      'website': instance.website,
      'ticket_id': instance.ticketId,
      'message': instance.message,
      'action': instance.action,
      'email': instance.email,
    };

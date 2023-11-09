// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_reason_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelReasonRequest _$CancelReasonRequestFromJson(Map<String, dynamic> json) =>
    CancelReasonRequest(
      itemId: json['item_id'],
      orderId: json['order_id'],
      reason: json['reason'],
      langCode: json['lang_code'],
    );

Map<String, dynamic> _$CancelReasonRequestToJson(
        CancelReasonRequest instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'order_id': instance.orderId,
      'reason': instance.reason,
      'lang_code': instance.langCode,
    };

CancelReasonForm _$CancelReasonFormFromJson(Map<String, dynamic> json) =>
    CancelReasonForm(
      json['cancelRequestForm'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CancelReasonFormToJson(CancelReasonForm instance) =>
    <String, dynamic>{
      'cancelRequestForm': instance.cancelRequestForm,
    };

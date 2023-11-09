// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnItemRequest _$ReturnItemRequestFromJson(Map<String, dynamic> json) =>
    ReturnItemRequest(
      itemId: json['item_id'],
      orderId: json['order_id'],
      reason: json['reason'],
      langCode: json['lang_code'],
    );

Map<String, dynamic> _$ReturnItemRequestToJson(ReturnItemRequest instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'order_id': instance.orderId,
      'reason': instance.reason,
      'lang_code': instance.langCode,
    };

ReturnItemForm _$ReturnItemFormFromJson(Map<String, dynamic> json) =>
    ReturnItemForm(
      json['returnItemForm'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ReturnItemFormToJson(ReturnItemForm instance) =>
    <String, dynamic>{
      'returnItemForm': instance.returnItemForm,
    };

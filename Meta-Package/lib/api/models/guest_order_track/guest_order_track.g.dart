// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_order_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestOrderRequest _$GuestOrderRequestFromJson(Map<String, dynamic> json) =>
    GuestOrderRequest(
      orderId: json['order_id'] as String?,
      billingLastName: json['billing_last_name'] as String?,
      type: json['type'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$GuestOrderRequestToJson(GuestOrderRequest instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'billing_last_name': instance.billingLastName,
      'type': instance.type,
      'email': instance.email,
    };

GuestOrderForm _$GuestOrderFormFromJson(Map<String, dynamic> json) =>
    GuestOrderForm(
      json['guestOrderForm'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$GuestOrderFormToJson(GuestOrderForm instance) =>
    <String, dynamic>{
      'guestOrderForm': instance.guestOrderForm,
    };

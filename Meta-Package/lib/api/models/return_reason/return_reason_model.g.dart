// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_reason_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnReasonModel _$ReturnReasonModelFromJson(Map<String, dynamic> json) =>
    ReturnReasonModel(
      orderreturnId: json['orderreturn_id'] as String?,
      orderId: json['order_id'] as String?,
      productSku: json['product_sku'] as String?,
      customerEmail: json['customer_email'] as String?,
      type: json['type'],
      reason: json['reason'] as String?,
      langCode: json['lang_code'] as String?,
      website: json['website'] as String?,
      erpReturnStatus: json['erp_return_status'] as String?,
      createdAt:
          DateParseUtils.dateTimeFromJsonUTC(json['created_at'] as String?),
    );

Map<String, dynamic> _$ReturnReasonModelToJson(ReturnReasonModel instance) =>
    <String, dynamic>{
      'orderreturn_id': instance.orderreturnId,
      'order_id': instance.orderId,
      'product_sku': instance.productSku,
      'customer_email': instance.customerEmail,
      'type': instance.type,
      'reason': instance.reason,
      'lang_code': instance.langCode,
      'website': instance.website,
      'erp_return_status': instance.erpReturnStatus,
      'created_at': DateParseUtils.dateTimeToJsonUTC(instance.createdAt),
    };

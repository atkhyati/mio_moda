// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCreditModel _$StoreCreditModelFromJson(Map<String, dynamic> json) =>
    StoreCreditModel(
      transactionId: json['transaction_id'] as String?,
      customerId: json['customer_id'] as String?,
      amount: json['amount'] as int?,
      balance: json['balance'] as int?,
      used: json['used'] as int?,
      orderId: json['order_id'] as String?,
      invoiceId: json['invoice_id'] as String?,
      creditmemoId: json['creditmemo_id'],
      suppressNotification: json['suppress_notification'] as bool?,
      atTime: DateParseUtils.dateTimeFromJsonUTC(json['at_time'] as String?),
      summary: json['summary'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$StoreCreditModelToJson(StoreCreditModel instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'customer_id': instance.customerId,
      'amount': instance.amount,
      'balance': instance.balance,
      'used': instance.used,
      'order_id': instance.orderId,
      'invoice_id': instance.invoiceId,
      'creditmemo_id': instance.creditmemoId,
      'suppress_notification': instance.suppressNotification,
      'at_time': DateParseUtils.dateTimeToJsonUTC(instance.atTime),
      'summary': instance.summary,
      'type': instance.type,
      'status': instance.status,
      'message': instance.message,
    };

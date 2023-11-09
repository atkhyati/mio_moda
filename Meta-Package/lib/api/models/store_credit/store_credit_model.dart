import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/utils/date_utils.dart';

part 'store_credit_model.g.dart';

@JsonSerializable()
class StoreCreditModel {
  StoreCreditModel({
    this.transactionId,
    this.customerId,
    this.amount,
    this.balance,
    this.used,
    this.orderId,
    this.invoiceId,
    this.creditmemoId,
    this.suppressNotification,
    this.atTime,
    this.summary,
    this.type,
    this.status,
    this.message
  });

  @JsonKey(name: 'transaction_id')
  String? transactionId;
  @JsonKey(name: 'customer_id')
  String? customerId;
  int? amount;
  int? balance;
  int? used;
  @JsonKey(name: 'order_id')
  String? orderId;
  @JsonKey(name: 'invoice_id')
  String? invoiceId;
  @JsonKey(name: 'creditmemo_id')
  dynamic creditmemoId;
  @JsonKey(name: 'suppress_notification')
  bool? suppressNotification;
  @JsonKey(
      name: 'at_time',
      fromJson: DateParseUtils.dateTimeFromJsonUTC,
      toJson: DateParseUtils.dateTimeToJsonUTC)
  DateTime? atTime;
  String? summary;
  String? type;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'message')
  String? message;
  factory StoreCreditModel.fromJson(Map<String, dynamic> json) =>
      _$StoreCreditModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCreditModelToJson(this);
}

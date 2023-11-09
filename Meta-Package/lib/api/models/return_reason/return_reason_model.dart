// To parse this JSON data, do
//
//     final returnReasonModel = returnReasonModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/utils/date_utils.dart';

part 'return_reason_model.g.dart';

@JsonSerializable()
class ReturnReasonModel {
  ReturnReasonModel({
    this.orderreturnId,
    this.orderId,
    this.productSku,
    this.customerEmail,
    this.type,
    this.reason,
    this.langCode,
    this.website,
    this.erpReturnStatus,
    this.createdAt,
  });

  @JsonKey(name: 'orderreturn_id')
  String? orderreturnId;
  @JsonKey(name: 'order_id')
  String? orderId;
  @JsonKey(name: 'product_sku')
  String? productSku;
  @JsonKey(name: 'customer_email')
  String? customerEmail;
  dynamic type;
  String? reason;
  @JsonKey(name: 'lang_code')
  String? langCode;
  String? website;
  @JsonKey(name: 'erp_return_status')
  String? erpReturnStatus;
  @JsonKey(
      name: 'created_at',
      fromJson: DateParseUtils.dateTimeFromJsonUTC,
      toJson: DateParseUtils.dateTimeToJsonUTC)
  DateTime? createdAt;

  factory ReturnReasonModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnReasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnReasonModelToJson(this);
}

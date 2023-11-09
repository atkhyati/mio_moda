// To parse this JSON data, do
//
//     final orderTrackingModel = orderTrackingModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'order_traking_model.g.dart';

@JsonSerializable()
class OrderTrackingModel {
  OrderTrackingModel({
    this.statusCode,
    this.statusTitle,
    this.statusDate,
  });

  @JsonKey(name: 'status_code')
  String? statusCode;
  @JsonKey(name: 'status_title')
  String? statusTitle;
  @JsonKey(name: 'status_date')
  String? statusDate;

  factory OrderTrackingModel.fromJson(Map<String, dynamic> json) =>
      _$OrderTrackingModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderTrackingModelToJson(this);
}

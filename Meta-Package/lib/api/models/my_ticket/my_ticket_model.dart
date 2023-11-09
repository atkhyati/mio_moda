// To parse this JSON data, do
//
//     final myTicketModel = myTicketModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/utils/date_utils.dart';

part 'my_ticket_model.g.dart';

@JsonSerializable()
class MyTicketModel {
  MyTicketModel({
    this.id,
    this.customerId,
    this.name,
    this.email,
    this.ticketId,
    this.subject,
    this.message,
    this.resolutionDate,
    this.assignedTo,
    this.sourceOfTicket,
    this.statusId,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.typeOfInquiry,
    this.lastName,
    this.country,
    this.phoneNo,
    this.orderNo,
    this.notifyOn,
    this.amount,
    this.sku,
    this.brand,
    this.style,
    this.keyword,
    this.image,
    this.deletedAt,
    this.langCode,
    this.status,
    this.messages,
  });

  int? id;
  @JsonKey(name: 'customer_id')
  String? customerId;
  String? name;
  String? email;
  @JsonKey(name: 'ticket_id')
  String? ticketId;
  String? subject;
  String? message;
  @JsonKey(name: 'resolution_date')
  dynamic resolutionDate;
  @JsonKey(name: 'assigned_to')
  dynamic assignedTo;
  @JsonKey(name: 'source_of_ticket')
  String? sourceOfTicket;
  @JsonKey(name: 'status_id')
  int? statusId;
  @JsonKey(
      fromJson: DateParseUtils.dateTimeFromJsonUTC,
      toJson: DateParseUtils.dateTimeToJsonUTC)
  DateTime? date;
  @JsonKey(
      name: 'created_at',
      fromJson: DateParseUtils.dateTimeFromJsonUTC,
      toJson: DateParseUtils.dateTimeToJsonUTC)
  DateTime? createdAt;
  @JsonKey(
      name: 'updated_at',
      fromJson: DateParseUtils.dateTimeFromJsonUTC,
      toJson: DateParseUtils.dateTimeToJsonUTC)
  DateTime? updatedAt;
  @JsonKey(name: 'type_of_inquiry')
  String? typeOfInquiry;
  @JsonKey(name: 'last_name')
  String? lastName;
  dynamic country;
  @JsonKey(name: 'phone_no')
  String? phoneNo;
  @JsonKey(name: 'order_no')
  dynamic orderNo;
  @JsonKey(name: 'notify_on')
  dynamic notifyOn;
  dynamic amount;
  dynamic sku;
  dynamic brand;
  dynamic style;
  dynamic keyword;
  dynamic image;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'lang_code')
  String? langCode;
  String? status;
  List<dynamic>? messages;

  factory MyTicketModel.fromJson(Map<String, dynamic> json) =>
      _$MyTicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyTicketModelToJson(this);
}

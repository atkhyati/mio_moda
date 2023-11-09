import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/utils/date_utils.dart';

part 'ticket_messages_model.g.dart';

@JsonSerializable()
class TicketMessagesModel {
  TicketMessagesModel({
    this.status,
    this.tickets,
  });

  String? status;
  Tickets? tickets;

  factory TicketMessagesModel.fromJson(Map<String, dynamic> json) =>
      _$TicketMessagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketMessagesModelToJson(this);
}

@JsonSerializable()
class Tickets {
  Tickets({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  @JsonKey(name: 'current_page')
  int? currentPage;
  List<TicketData>? data;
  @JsonKey(name: 'first_page_url')
  String? firstPageUrl;
  int? from;
  @JsonKey(name: 'last_page')
  int? lastPage;
  @JsonKey(name: 'last_page_url')
  String? lastPageUrl;
  @JsonKey(name: 'next_page_url')
  dynamic nextPageUrl;
  String? path;
  @JsonKey(name: 'per_page')
  int? perPage;
  @JsonKey(name: 'prev_page_url')
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Tickets.fromJson(Map<String, dynamic> json) =>
      _$TicketsFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsToJson(this);
}

@JsonSerializable()
class TicketData {
  TicketData({
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
  int? customerId;
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
  List<TicketMessages>? messages;

  factory TicketData.fromJson(Map<String, dynamic> json) =>
      _$TicketDataFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDataToJson(this);
}

@JsonSerializable()
class TicketMessages {
  TicketMessages({
    this.id,
    this.message,
    this.createdAt,
    this.userId,
    this.sendBy,
  });

  int? id;
  String? message;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'send_by')
  String? sendBy;

  factory TicketMessages.fromJson(Map<String, dynamic> json) =>
      _$TicketMessagesFromJson(json);

  Map<String, dynamic> toJson() => _$TicketMessagesToJson(this);
}

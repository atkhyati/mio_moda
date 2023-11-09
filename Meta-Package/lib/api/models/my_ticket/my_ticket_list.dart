import 'package:json_annotation/json_annotation.dart';

part 'my_ticket_list.g.dart';

@JsonSerializable()
class MyTicketList {
  MyTicketList(
      {this.myticketsId,
      this.name,
      this.lastName,
      this.email,
      this.phone,
      this.brand,
      this.style,
      this.keyword,
      this.image,
      this.remarks,
      this.ticketCode,
      this.langCode,
      this.status,
      this.createdAt,
      this.customerId,
      this.ticketType,
      this.orderreturnId,
      this.messages,
      this.error,
      this.message});

  @JsonKey(name: 'mytickets_id')
  String? myticketsId;
  String? name;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? email;
  String? phone;
  String? brand;
  String? style;
  String? keyword;
  String? image;
  String? remarks;
  @JsonKey(name: 'ticket_code')
  String? ticketCode;
  @JsonKey(name: 'lang_code')
  String? langCode;
  String? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'customer_id')
  String? customerId;
  @JsonKey(name: 'ticket_type')
  String? ticketType;
  @JsonKey(name: 'orderreturn_id')
  String? orderreturnId;
  List<Messages>? messages;
  @JsonKey(name: 'error')
  bool? error;
  @JsonKey(name: 'message')
  String? message;
  factory MyTicketList.fromJson(Map<String, dynamic> json) =>
      _$MyTicketListFromJson(json);

  Map<String, dynamic> toJson() => _$MyTicketListToJson(this);
}

@JsonSerializable()
class Messages {
  Messages({
    this.isMerchant,
    this.timestamp,
    this.message,
  });

  @JsonKey(name: 'is_merchant')
  int? isMerchant;
  int? timestamp;
  String? message;

  factory Messages.fromJson(Map<String, dynamic> json) =>
      _$MessagesFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesToJson(this);
}

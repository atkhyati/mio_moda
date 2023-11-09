import 'package:json_annotation/json_annotation.dart';

part 'track_ticket_modal.g.dart';

@JsonSerializable()
class TrackTicketModal {
  TrackTicketModal(
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
      this.isItBought,
      this.cheaperWebsite,
      this.cheaperLink,
      this.cheaperPriceWithTax,
      this.countryId,
      this.cheaperAvaliable,
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
  dynamic messages;
  @JsonKey(name: 'is_it_bought')
  dynamic isItBought;
  @JsonKey(name: 'cheaper_website')
  dynamic cheaperWebsite;
  @JsonKey(name: 'cheaper_link')
  dynamic cheaperLink;
  @JsonKey(name: 'cheaper_price_with_tax')
  dynamic cheaperPriceWithTax;
  @JsonKey(name: 'country_id')
  dynamic countryId;
  @JsonKey(name: 'cheaper_avaliable')
  dynamic cheaperAvaliable;
  @JsonKey(name: 'error')
  bool? error;
  @JsonKey(name: 'message')
  String? message;

  factory TrackTicketModal.fromJson(Map<String, dynamic> json) =>
      _$TrackTicketModalFromJson(json);

  Map<String, dynamic> toJson() => _$TrackTicketModalToJson(this);
}

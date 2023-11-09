import 'package:json_annotation/json_annotation.dart';

part 'create_ticket_request.g.dart';

@JsonSerializable()
class CreateTicketRequest {
  CreateTicketRequest(
      {this.name,
      this.lastName,
      this.email,
      this.phone,
      this.brand,
      this.style,
      this.keyword,
      this.imageUrl,
      this.remarks,
      this.customerId,
      this.langCode,
      this.ticketType,
      this.isItBought,
      this.cheaperWebsite,
      this.cheaperLink,
      this.cheaperPriceWithTax,
      this.cheaperAvailable,
      this.countryId});

  @JsonKey(name: 'name')
  dynamic name;
  @JsonKey(name: 'last_name')
  dynamic lastName;
  @JsonKey(name: 'email')
  dynamic email;
  @JsonKey(name: 'phone')
  dynamic phone;
  @JsonKey(name: 'brand')
  dynamic brand;
  @JsonKey(name: 'style')
  dynamic style;
  @JsonKey(name: 'keyword')
  dynamic keyword;
  @JsonKey(name: 'image_url')
  dynamic imageUrl;
  @JsonKey(name: 'remarks')
  dynamic remarks;
  @JsonKey(name: 'customer_id')
  dynamic customerId;
  @JsonKey(name: 'lang_code')
  dynamic langCode;
  @JsonKey(name: 'ticket_type')
  dynamic ticketType;
  @JsonKey(name: 'is_it_bought')
  dynamic isItBought;
  @JsonKey(name: 'cheaper_website')
  dynamic cheaperWebsite;
  @JsonKey(name: 'cheaper_link')
  dynamic cheaperLink;
  @JsonKey(name: 'Cheaper_price_with_tax')
  dynamic cheaperPriceWithTax;
  @JsonKey(name: 'cheaper_avaliable')
  dynamic cheaperAvailable;
  @JsonKey(name: 'country_id')
  dynamic countryId;

  factory CreateTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTicketRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTicketRequestToJson(this);
}

@JsonSerializable()
class TicketForm {
  TicketForm(this.ticketForm);

  Map<String, dynamic> ticketForm;

  factory TicketForm.fromJson(Map<String, dynamic> json) =>
      _$TicketFormFromJson(json);

  Map<String, dynamic> toJson() => _$TicketFormToJson(this);
}

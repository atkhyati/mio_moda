import 'package:json_annotation/json_annotation.dart';

part 'contact_us_request.g.dart';

@JsonSerializable()
class ContactUsRequest {
  ContactUsRequest(
      {this.name,
        this.lastName,
        this.email,
        this.phone,
        this.message,
        this.typeOfInquiry,
        this.orderNo,
        this.country,
        this.subject,
        this.sourceOfTicket,
     });

  @JsonKey(name: 'name')
  dynamic name;
  @JsonKey(name: 'lastname')
  dynamic lastName;
  @JsonKey(name: 'email')
  dynamic email;
  @JsonKey(name: 'phone_no')
  dynamic phone;
  @JsonKey(name: 'message')
  dynamic message;
  @JsonKey(name: 'type_of_inquiry')
  dynamic typeOfInquiry;
  @JsonKey(name: 'order_no')
  dynamic orderNo;
  @JsonKey(name: 'country')
  dynamic country;
  @JsonKey(name: 'subject')
  dynamic subject;
  @JsonKey(name: 'source_of_ticket')
  dynamic sourceOfTicket;

  factory ContactUsRequest.fromJson(Map<String, dynamic> json) =>
      _$ContactUsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsRequestToJson(this);
}

@JsonSerializable()
class ContactUsForm {
  ContactUsForm(this.contactForm);

  Map<String, dynamic> contactForm;

  factory ContactUsForm.fromJson(Map<String, String> json) =>
      _$ContactUsFormFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsFormToJson(this);
}

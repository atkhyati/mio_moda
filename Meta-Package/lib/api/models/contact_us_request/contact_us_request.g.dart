// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsRequest _$ContactUsRequestFromJson(Map<String, dynamic> json) =>
    ContactUsRequest(
      name: json['name'],
      lastName: json['lastname'],
      email: json['email'],
      phone: json['phone_no'],
      message: json['message'],
      typeOfInquiry: json['type_of_inquiry'],
      orderNo: json['order_no'],
      country: json['country'],
      subject: json['subject'],
      sourceOfTicket: json['source_of_ticket'],
    );

Map<String, dynamic> _$ContactUsRequestToJson(ContactUsRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastname': instance.lastName,
      'email': instance.email,
      'phone_no': instance.phone,
      'message': instance.message,
      'type_of_inquiry': instance.typeOfInquiry,
      'order_no': instance.orderNo,
      'country': instance.country,
      'subject': instance.subject,
      'source_of_ticket': instance.sourceOfTicket,
    };

ContactUsForm _$ContactUsFormFromJson(Map<String, dynamic> json) =>
    ContactUsForm(
      json['contactForm'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ContactUsFormToJson(ContactUsForm instance) =>
    <String, dynamic>{
      'contactForm': instance.contactForm,
    };

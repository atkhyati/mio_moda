// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ticket_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTicketRequest _$CreateTicketRequestFromJson(Map<String, dynamic> json) =>
    CreateTicketRequest(
      name: json['name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      brand: json['brand'],
      style: json['style'],
      keyword: json['keyword'],
      imageUrl: json['image_url'],
      remarks: json['remarks'],
      customerId: json['customer_id'],
      langCode: json['lang_code'],
      ticketType: json['ticket_type'],
      isItBought: json['is_it_bought'],
      cheaperWebsite: json['cheaper_website'],
      cheaperLink: json['cheaper_link'],
      cheaperPriceWithTax: json['Cheaper_price_with_tax'],
      cheaperAvailable: json['cheaper_avaliable'],
      countryId: json['country_id'],
    );

Map<String, dynamic> _$CreateTicketRequestToJson(
        CreateTicketRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'brand': instance.brand,
      'style': instance.style,
      'keyword': instance.keyword,
      'image_url': instance.imageUrl,
      'remarks': instance.remarks,
      'customer_id': instance.customerId,
      'lang_code': instance.langCode,
      'ticket_type': instance.ticketType,
      'is_it_bought': instance.isItBought,
      'cheaper_website': instance.cheaperWebsite,
      'cheaper_link': instance.cheaperLink,
      'Cheaper_price_with_tax': instance.cheaperPriceWithTax,
      'cheaper_avaliable': instance.cheaperAvailable,
      'country_id': instance.countryId,
    };

TicketForm _$TicketFormFromJson(Map<String, dynamic> json) => TicketForm(
      json['ticketForm'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$TicketFormToJson(TicketForm instance) =>
    <String, dynamic>{
      'ticketForm': instance.ticketForm,
    };

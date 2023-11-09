// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_ticket_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackTicketModal _$TrackTicketModalFromJson(Map<String, dynamic> json) =>
    TrackTicketModal(
      myticketsId: json['mytickets_id'] as String?,
      name: json['name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      brand: json['brand'] as String?,
      style: json['style'] as String?,
      keyword: json['keyword'] as String?,
      image: json['image'] as String?,
      remarks: json['remarks'] as String?,
      ticketCode: json['ticket_code'] as String?,
      langCode: json['lang_code'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      customerId: json['customer_id'] as String?,
      ticketType: json['ticket_type'] as String?,
      orderreturnId: json['orderreturn_id'] as String?,
      messages: json['messages'],
      isItBought: json['is_it_bought'],
      cheaperWebsite: json['cheaper_website'],
      cheaperLink: json['cheaper_link'],
      cheaperPriceWithTax: json['cheaper_price_with_tax'],
      countryId: json['country_id'],
      cheaperAvaliable: json['cheaper_avaliable'],
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$TrackTicketModalToJson(TrackTicketModal instance) =>
    <String, dynamic>{
      'mytickets_id': instance.myticketsId,
      'name': instance.name,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'brand': instance.brand,
      'style': instance.style,
      'keyword': instance.keyword,
      'image': instance.image,
      'remarks': instance.remarks,
      'ticket_code': instance.ticketCode,
      'lang_code': instance.langCode,
      'status': instance.status,
      'created_at': instance.createdAt,
      'customer_id': instance.customerId,
      'ticket_type': instance.ticketType,
      'orderreturn_id': instance.orderreturnId,
      'messages': instance.messages,
      'is_it_bought': instance.isItBought,
      'cheaper_website': instance.cheaperWebsite,
      'cheaper_link': instance.cheaperLink,
      'cheaper_price_with_tax': instance.cheaperPriceWithTax,
      'country_id': instance.countryId,
      'cheaper_avaliable': instance.cheaperAvaliable,
      'error': instance.error,
      'message': instance.message,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_ticket_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyTicketList _$MyTicketListFromJson(Map<String, dynamic> json) => MyTicketList(
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
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Messages.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MyTicketListToJson(MyTicketList instance) =>
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
      'error': instance.error,
      'message': instance.message,
    };

Messages _$MessagesFromJson(Map<String, dynamic> json) => Messages(
      isMerchant: json['is_merchant'] as int?,
      timestamp: json['timestamp'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MessagesToJson(Messages instance) => <String, dynamic>{
      'is_merchant': instance.isMerchant,
      'timestamp': instance.timestamp,
      'message': instance.message,
    };

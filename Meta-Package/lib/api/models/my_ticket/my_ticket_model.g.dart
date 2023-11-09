// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyTicketModel _$MyTicketModelFromJson(Map<String, dynamic> json) =>
    MyTicketModel(
      id: json['id'] as int?,
      customerId: json['customer_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      ticketId: json['ticket_id'] as String?,
      subject: json['subject'] as String?,
      message: json['message'] as String?,
      resolutionDate: json['resolution_date'],
      assignedTo: json['assigned_to'],
      sourceOfTicket: json['source_of_ticket'] as String?,
      statusId: json['status_id'] as int?,
      date: DateParseUtils.dateTimeFromJsonUTC(json['date'] as String?),
      createdAt:
          DateParseUtils.dateTimeFromJsonUTC(json['created_at'] as String?),
      updatedAt:
          DateParseUtils.dateTimeFromJsonUTC(json['updated_at'] as String?),
      typeOfInquiry: json['type_of_inquiry'] as String?,
      lastName: json['last_name'] as String?,
      country: json['country'],
      phoneNo: json['phone_no'] as String?,
      orderNo: json['order_no'],
      notifyOn: json['notify_on'],
      amount: json['amount'],
      sku: json['sku'],
      brand: json['brand'],
      style: json['style'],
      keyword: json['keyword'],
      image: json['image'],
      deletedAt: json['deleted_at'],
      langCode: json['lang_code'] as String?,
      status: json['status'] as String?,
      messages: json['messages'] as List<dynamic>?,
    );

Map<String, dynamic> _$MyTicketModelToJson(MyTicketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'name': instance.name,
      'email': instance.email,
      'ticket_id': instance.ticketId,
      'subject': instance.subject,
      'message': instance.message,
      'resolution_date': instance.resolutionDate,
      'assigned_to': instance.assignedTo,
      'source_of_ticket': instance.sourceOfTicket,
      'status_id': instance.statusId,
      'date': DateParseUtils.dateTimeToJsonUTC(instance.date),
      'created_at': DateParseUtils.dateTimeToJsonUTC(instance.createdAt),
      'updated_at': DateParseUtils.dateTimeToJsonUTC(instance.updatedAt),
      'type_of_inquiry': instance.typeOfInquiry,
      'last_name': instance.lastName,
      'country': instance.country,
      'phone_no': instance.phoneNo,
      'order_no': instance.orderNo,
      'notify_on': instance.notifyOn,
      'amount': instance.amount,
      'sku': instance.sku,
      'brand': instance.brand,
      'style': instance.style,
      'keyword': instance.keyword,
      'image': instance.image,
      'deleted_at': instance.deletedAt,
      'lang_code': instance.langCode,
      'status': instance.status,
      'messages': instance.messages,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketMessagesModel _$TicketMessagesModelFromJson(Map<String, dynamic> json) =>
    TicketMessagesModel(
      status: json['status'] as String?,
      tickets: json['tickets'] == null
          ? null
          : Tickets.fromJson(json['tickets'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketMessagesModelToJson(
        TicketMessagesModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'tickets': instance.tickets,
    };

Tickets _$TicketsFromJson(Map<String, dynamic> json) => Tickets(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TicketData.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      lastPageUrl: json['last_page_url'] as String?,
      nextPageUrl: json['next_page_url'],
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'],
      to: json['to'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$TicketsToJson(Tickets instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

TicketData _$TicketDataFromJson(Map<String, dynamic> json) => TicketData(
      id: json['id'] as int?,
      customerId: json['customer_id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      ticketId: json['ticket_id'] as String?,
      subject: json['subject'] as String?,
      message: json['message'] as String?,
      resolutionDate: json['resolution_date'],
      assignedTo: json['assigned_to'],
      sourceOfTicket: json['source_of_ticket'] as String?,
      statusId: json['status_id'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
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
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => TicketMessages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketDataToJson(TicketData instance) =>
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
      'date': instance.date?.toIso8601String(),
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

TicketMessages _$TicketMessagesFromJson(Map<String, dynamic> json) =>
    TicketMessages(
      id: json['id'] as int?,
      message: json['message'] as String?,
      createdAt: json['created_at'] as String?,
      userId: json['user_id'] as int?,
      sendBy: json['send_by'] as String?,
    );

Map<String, dynamic> _$TicketMessagesToJson(TicketMessages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'created_at': instance.createdAt,
      'user_id': instance.userId,
      'send_by': instance.sendBy,
    };

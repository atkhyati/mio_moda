// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      notificationList: (json['notification_list'] as List<dynamic>?)
          ?.map((e) => NotificationDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['state'] == null
          ? null
          : State.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'notification_list': instance.notificationList,
      'state': instance.state,
    };

NotificationDatum _$NotificationDatumFromJson(Map<String, dynamic> json) =>
    NotificationDatum(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      notificationType: json['notification_type'] as int?,
      notificationData: json['notification_data'] == null
          ? null
          : NotificationData.fromJson(
              json['notification_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationDatumToJson(NotificationDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'notification_type': instance.notificationType,
      'notification_data': instance.notificationData,
    };

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      type: json['type'] as int?,
      reviewId: json['review_id'] as String?,
      storeId: json['store_id'] as String?,
      clickAction: json['click_action'] as String?,
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'review_id': instance.reviewId,
      'store_id': instance.storeId,
      'click_action': instance.clickAction,
    };

State _$StateFromJson(Map<String, dynamic> json) => State(
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      pageLimit: json['page_limit'] as int?,
    );

Map<String, dynamic> _$StateToJson(State instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'page_limit': instance.pageLimit,
    };

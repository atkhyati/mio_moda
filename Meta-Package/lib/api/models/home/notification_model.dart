import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  NotificationModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.notificationList,
    this.state,
  });

  @JsonKey(name: 'notification_list')
  List<NotificationDatum>? notificationList;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class NotificationDatum {
  NotificationDatum({
    this.id,
    this.title,
    this.description,
    this.notificationType,
    this.notificationData,
  });

  String? id;
  String? title;
  String? description;
  @JsonKey(name: 'notification_type')
  int? notificationType;
  @JsonKey(name: 'notification_data')
  NotificationData? notificationData;

  factory NotificationDatum.fromJson(Map<String, dynamic> json) =>
      _$NotificationDatumFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDatumToJson(this);
}

@JsonSerializable()
class NotificationData {
  NotificationData({
    this.type,
    this.reviewId,
    this.storeId,
    this.clickAction,
  });

  int? type;
  @JsonKey(name: 'review_id')
  String? reviewId;
  @JsonKey(name: 'store_id')
  String? storeId;
  @JsonKey(name: 'click_action')
  String? clickAction;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}

@JsonSerializable()
class State {
  State({
    this.page,
    this.limit,
    this.pageLimit,
  });

  int? page;
  int? limit;
  @JsonKey(name: 'page_limit')
  int? pageLimit;

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);
}

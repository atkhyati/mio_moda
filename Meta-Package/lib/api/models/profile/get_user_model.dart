import 'package:json_annotation/json_annotation.dart';

part 'get_user_model.g.dart';

@JsonSerializable()
class GetUserModel {
  GetUserModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory GetUserModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.fullName,
    this.userName,
    this.email,
    this.phoneNumber,
    this.image,
    this.isActive,
    this.isBlock,
    this.sId,
  });

  String? fullName;
  String? userName;
  String? email;
  String? phoneNumber;
  String? image;
  bool? isActive;
  bool? isBlock;
  @JsonKey(name: '_id')
  String? sId;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

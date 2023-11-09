import 'package:json_annotation/json_annotation.dart';

part 'contact_us_response_model.g.dart';

@JsonSerializable()
class ContactUsResponseModel {
  ContactUsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory ContactUsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactUsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.id,
  });

  String? id;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

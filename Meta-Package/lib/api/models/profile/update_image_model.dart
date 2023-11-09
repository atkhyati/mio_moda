import 'package:json_annotation/json_annotation.dart';

part 'update_image_model.g.dart';

@JsonSerializable()
class UpdateImageModel {
  UpdateImageModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory UpdateImageModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateImageModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.image,
  });

  String? image;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'generate_token_model.g.dart';

@JsonSerializable()
class GenerateTokenModel {
  GenerateTokenModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory GenerateTokenModel.fromJson(Map<String, dynamic> json) =>
      _$GenerateTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateTokenModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.token,
    this.refreshToken,
  });

  String? token;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'success_model.g.dart';

@JsonSerializable()
class SuccessModel {
  SuccessModel({
    this.status,
    this.message,
  });

  int? status;
  String? message;

  factory SuccessModel.fromJson(Map<String, dynamic> json) =>
      _$SuccessModelFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessModelToJson(this);
}

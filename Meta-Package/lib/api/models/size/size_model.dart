import 'package:json_annotation/json_annotation.dart';

part 'size_model.g.dart';

@JsonSerializable()
class SizeModel {
  SizeModel({
    this.label,
    this.value,
  });

  String? label;
  String? value;

  factory SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);
  Map<String, dynamic> toJson() => _$SizeModelToJson(this);
}

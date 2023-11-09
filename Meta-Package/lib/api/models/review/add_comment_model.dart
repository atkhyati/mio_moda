import 'package:json_annotation/json_annotation.dart';

import 'comment_class.dart';

part 'add_comment_model.g.dart';

@JsonSerializable()
class AddCommentModel {
  AddCommentModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Comment? data;

  factory AddCommentModel.fromJson(Map<String, dynamic> json) =>
      _$AddCommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCommentModelToJson(this);
}

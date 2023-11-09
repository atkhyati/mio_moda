import 'package:json_annotation/json_annotation.dart';
import 'comment_class.dart';

part 'get_comment_model.g.dart';

@JsonSerializable()
class GetCommentModel {
  GetCommentModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Comment>? data;

  factory GetCommentModel.fromJson(Map<String, dynamic> json) =>
      _$GetCommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCommentModelToJson(this);
}

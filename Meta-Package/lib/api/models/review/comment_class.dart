import 'package:json_annotation/json_annotation.dart';

import 'user_class.dart';

part 'comment_class.g.dart';

@JsonSerializable()
class Comment {
  Comment({
    this.id,
    this.message,
    this.createdAt,
    this.user,
  });

  @JsonKey(name: '_id')
  String? id;
  String? message;
  String? createdAt;
  List<User>? user;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

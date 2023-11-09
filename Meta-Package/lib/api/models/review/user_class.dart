import 'package:json_annotation/json_annotation.dart';

part 'user_class.g.dart';

@JsonSerializable()
class User {
  User({
    this.id,
    this.fullName,
    this.image,
  });

  @JsonKey(name: '_id')
  String? id;
  String? fullName;
  String? image;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

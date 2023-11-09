import 'package:json_annotation/json_annotation.dart';

import 'comment_class.dart';
import 'store_class.dart';
import 'user_class.dart';

part 'get_review_by_user_id_model.g.dart';

@JsonSerializable()
class GetReviewByUserIdModel {
  GetReviewByUserIdModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory GetReviewByUserIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetReviewByUserIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetReviewByUserIdModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.user,
    this.review,
  });

  User? user;
  List<ReviewByUserId>? review;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ReviewByUserId {
  ReviewByUserId({
    this.id,
    this.review,
    this.images,
    this.reaction,
    this.createdAt,
    this.store,
    this.comment,
  });

  @JsonKey(name: '_id')
  String? id;
  String? review;
  List<String>? images;
  String? reaction;
  String? createdAt;
  List<Store>? store;
  List<Comment>? comment;

  factory ReviewByUserId.fromJson(Map<String, dynamic> json) =>
      _$ReviewByUserIdFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewByUserIdToJson(this);
}

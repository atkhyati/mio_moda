import 'package:json_annotation/json_annotation.dart';

import 'comment_class.dart';
import 'user_class.dart';

part 'get_review_by_store_id.g.dart';

@JsonSerializable()
class GetReviewByStoreIdModel {
  GetReviewByStoreIdModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory GetReviewByStoreIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetReviewByStoreIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetReviewByStoreIdModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.reviewData,
    this.state,
  });

  @JsonKey(name: 'review_data')
  List<ReviewDataByStoreId>? reviewData;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ReviewDataByStoreId {
  ReviewDataByStoreId({
    this.id,
    this.review,
    this.images,
    this.reaction,
    this.createdAt,
    this.user,
    this.comment,
  });

  @JsonKey(name: '_id')
  String? id;
  String? review;
  List<String>? images;
  String? reaction;
  String? createdAt;
  List<User>? user;
  List<Comment>? comment;

  factory ReviewDataByStoreId.fromJson(Map<String, dynamic> json) =>
      _$ReviewDataByStoreIdFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDataByStoreIdToJson(this);
}

@JsonSerializable()
class State {
  State({
    this.page,
    this.limit,
    this.pageLimit,
  });

  int? page;
  int? limit;
  @JsonKey(name: 'page_limit')
  int? pageLimit;

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);
}

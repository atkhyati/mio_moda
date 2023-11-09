import 'package:json_annotation/json_annotation.dart';

import 'comment_class.dart';
import 'user_class.dart';

part 'get_all_review_by_store_id.g.dart';

@JsonSerializable()
class GetAllReviewByStoreId {
  GetAllReviewByStoreId({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory GetAllReviewByStoreId.fromJson(Map<String, dynamic> json) =>
      _$GetAllReviewByStoreIdFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllReviewByStoreIdToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.smile,
    this.sad,
    this.angry,
    this.heart,
    this.reviewData,
    this.state,
  });

  int? smile;
  int? sad;
  int? angry;
  int? heart;
  @JsonKey(name: 'review_data')
  List<ReviewDatum>? reviewData;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ReviewDatum {
  ReviewDatum({
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

  factory ReviewDatum.fromJson(Map<String, dynamic> json) =>
      _$ReviewDatumFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDatumToJson(this);
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

import 'package:json_annotation/json_annotation.dart';
import 'comment_class.dart';
import 'store_class.dart';

part 'view_all_review_by_userid_model.g.dart';

@JsonSerializable()
class ViewAllReviewByUserIdModel {
  ViewAllReviewByUserIdModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ViewAllReviewByUserIdModel.fromJson(Map<String, dynamic> json) =>
      _$ViewAllReviewByUserIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$ViewAllReviewByUserIdModelToJson(this);
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
  List<AllReviewDataByUserId>? reviewData;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class AllReviewDataByUserId {
  AllReviewDataByUserId({
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

  factory AllReviewDataByUserId.fromJson(Map<String, dynamic> json) =>
      _$AllReviewDataByUserIdFromJson(json);

  Map<String, dynamic> toJson() => _$AllReviewDataByUserIdToJson(this);
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

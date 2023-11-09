// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_all_review_by_userid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewAllReviewByUserIdModel _$ViewAllReviewByUserIdModelFromJson(
        Map<String, dynamic> json) =>
    ViewAllReviewByUserIdModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewAllReviewByUserIdModelToJson(
        ViewAllReviewByUserIdModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      smile: json['smile'] as int?,
      sad: json['sad'] as int?,
      angry: json['angry'] as int?,
      heart: json['heart'] as int?,
      reviewData: (json['review_data'] as List<dynamic>?)
          ?.map(
              (e) => AllReviewDataByUserId.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['state'] == null
          ? null
          : State.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'smile': instance.smile,
      'sad': instance.sad,
      'angry': instance.angry,
      'heart': instance.heart,
      'review_data': instance.reviewData,
      'state': instance.state,
    };

AllReviewDataByUserId _$AllReviewDataByUserIdFromJson(
        Map<String, dynamic> json) =>
    AllReviewDataByUserId(
      id: json['_id'] as String?,
      review: json['review'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      reaction: json['reaction'] as String?,
      createdAt: json['createdAt'] as String?,
      store: (json['store'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
      comment: (json['comment'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllReviewDataByUserIdToJson(
        AllReviewDataByUserId instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'review': instance.review,
      'images': instance.images,
      'reaction': instance.reaction,
      'createdAt': instance.createdAt,
      'store': instance.store,
      'comment': instance.comment,
    };

State _$StateFromJson(Map<String, dynamic> json) => State(
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      pageLimit: json['page_limit'] as int?,
    );

Map<String, dynamic> _$StateToJson(State instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'page_limit': instance.pageLimit,
    };

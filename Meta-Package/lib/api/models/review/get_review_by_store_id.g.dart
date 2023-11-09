// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_review_by_store_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReviewByStoreIdModel _$GetReviewByStoreIdModelFromJson(
        Map<String, dynamic> json) =>
    GetReviewByStoreIdModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetReviewByStoreIdModelToJson(
        GetReviewByStoreIdModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      reviewData: (json['review_data'] as List<dynamic>?)
          ?.map((e) => ReviewDataByStoreId.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['state'] == null
          ? null
          : State.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'review_data': instance.reviewData,
      'state': instance.state,
    };

ReviewDataByStoreId _$ReviewDataByStoreIdFromJson(Map<String, dynamic> json) =>
    ReviewDataByStoreId(
      id: json['_id'] as String?,
      review: json['review'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      reaction: json['reaction'] as String?,
      createdAt: json['createdAt'] as String?,
      user: (json['user'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      comment: (json['comment'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewDataByStoreIdToJson(
        ReviewDataByStoreId instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'review': instance.review,
      'images': instance.images,
      'reaction': instance.reaction,
      'createdAt': instance.createdAt,
      'user': instance.user,
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

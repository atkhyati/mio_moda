// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_review_by_user_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReviewByUserIdModel _$GetReviewByUserIdModelFromJson(
        Map<String, dynamic> json) =>
    GetReviewByUserIdModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetReviewByUserIdModelToJson(
        GetReviewByUserIdModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      review: (json['review'] as List<dynamic>?)
          ?.map((e) => ReviewByUserId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user': instance.user,
      'review': instance.review,
    };

ReviewByUserId _$ReviewByUserIdFromJson(Map<String, dynamic> json) =>
    ReviewByUserId(
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

Map<String, dynamic> _$ReviewByUserIdToJson(ReviewByUserId instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'review': instance.review,
      'images': instance.images,
      'reaction': instance.reaction,
      'createdAt': instance.createdAt,
      'store': instance.store,
      'comment': instance.comment,
    };

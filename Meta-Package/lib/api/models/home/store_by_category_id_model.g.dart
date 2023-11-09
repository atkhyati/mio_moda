// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_by_category_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreByCategoryIdModel _$StoreByCategoryIdModelFromJson(
        Map<String, dynamic> json) =>
    StoreByCategoryIdModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreByCategoryIdModelToJson(
        StoreByCategoryIdModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      storeData: (json['store_data'] as List<dynamic>?)
          ?.map((e) => StoreDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['state'] == null
          ? null
          : State.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'store_data': instance.storeData,
      'state': instance.state,
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

StoreDatum _$StoreDatumFromJson(Map<String, dynamic> json) => StoreDatum(
      id: json['_id'] as String?,
      storeName: json['storeName'] as String?,
      description: json['description'] as String?,
      totalRating: json['totalRating'],
      rating: json['rating'],
      storeImage: json['storeImage'] as String?,
      categoryName: json['categoryName'] as String?,
      isCollect: json['isCollect'] as bool?,
    );

Map<String, dynamic> _$StoreDatumToJson(StoreDatum instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'storeName': instance.storeName,
      'description': instance.description,
      'totalRating': instance.totalRating,
      'rating': instance.rating,
      'storeImage': instance.storeImage,
      'categoryName': instance.categoryName,
      'isCollect': instance.isCollect,
    };

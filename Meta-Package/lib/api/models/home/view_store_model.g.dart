// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewStoreModel _$ViewStoreModelFromJson(Map<String, dynamic> json) =>
    ViewStoreModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewStoreModelToJson(ViewStoreModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      storeData: (json['store_data'] as List<dynamic>?)
          ?.map((e) => ViewStoreData.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['state'] == null
          ? null
          : State.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'store_data': instance.storeData,
      'state': instance.state,
    };

ViewStoreData _$ViewStoreDataFromJson(Map<String, dynamic> json) =>
    ViewStoreData(
      id: json['_id'] as String?,
      storeName: json['storeName'] as String?,
      heart: json['heart'] as int?,
      smile: json['smile'] as int?,
      sad: json['sad'] as int?,
      angry: json['angry'] as int?,
      storeImage: json['storeImage'] as String?,
      categoryName: json['categoryName'] as String?,
      isCollect: json['isCollect'] as bool?,
    );

Map<String, dynamic> _$ViewStoreDataToJson(ViewStoreData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'storeName': instance.storeName,
      'heart': instance.heart,
      'smile': instance.smile,
      'sad': instance.sad,
      'angry': instance.angry,
      'storeImage': instance.storeImage,
      'categoryName': instance.categoryName,
      'isCollect': instance.isCollect,
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

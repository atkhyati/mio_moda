// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homescreen_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeScreenSearchModel _$HomeScreenSearchModelFromJson(
        Map<String, dynamic> json) =>
    HomeScreenSearchModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeScreenSearchModelToJson(
        HomeScreenSearchModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      storeData: (json['store_data'] as List<dynamic>?)
          ?.map((e) => SearchStoreData.fromJson(e as Map<String, dynamic>))
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

SearchStoreData _$SearchStoreDataFromJson(Map<String, dynamic> json) =>
    SearchStoreData(
      id: json['_id'] as String?,
      location: json['location'],
      storeName: json['storeName'] as String?,
      description: json['description'] as String?,
      totalRating: json['totalRating'],
      storeImage: json['storeImage'] as String?,
      categoryName: json['categoryName'] as String?,
      isCollect: json['isCollect'] as bool?,
    );

Map<String, dynamic> _$SearchStoreDataToJson(SearchStoreData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'location': instance.location,
      'storeName': instance.storeName,
      'description': instance.description,
      'totalRating': instance.totalRating,
      'storeImage': instance.storeImage,
      'categoryName': instance.categoryName,
      'isCollect': instance.isCollect,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

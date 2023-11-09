// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCollectionModel _$GetCollectionModelFromJson(Map<String, dynamic> json) =>
    GetCollectionModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCollectionModelToJson(GetCollectionModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      collectionData: (json['collection_data'] as List<dynamic>?)
          ?.map((e) => CollectionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['state'] == null
          ? null
          : State.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'collection_data': instance.collectionData,
      'state': instance.state,
    };

CollectionData _$CollectionDataFromJson(Map<String, dynamic> json) =>
    CollectionData(
      id: json['_id'] as String?,
      store: (json['store'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionDataToJson(CollectionData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'store': instance.store,
    };

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      id: json['id'] as String?,
      storeName: json['store_name'] as String?,
      description: json['description'] as String?,
      totalRating: json['total_rating'],
      rating: json['rating'],
      storeImage: json['store_image'] as String?,
      categoryName: json['category_name'] as String?,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'store_name': instance.storeName,
      'description': instance.description,
      'total_rating': instance.totalRating,
      'rating': instance.rating,
      'store_image': instance.storeImage,
      'category_name': instance.categoryName,
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

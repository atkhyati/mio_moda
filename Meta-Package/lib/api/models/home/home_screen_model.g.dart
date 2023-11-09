// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeScreenModel _$HomeScreenModelFromJson(Map<String, dynamic> json) =>
    HomeScreenModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeScreenModelToJson(HomeScreenModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      homeCategory: (json['category'] as List<dynamic>?)
          ?.map((e) => HomeCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      poster: (json['poster'] as List<dynamic>?)
          ?.map((e) => Poster.fromJson(e as Map<String, dynamic>))
          .toList(),
      nearStore: (json['nearStore'] as List<dynamic>?)
          ?.map((e) => NearStore.fromJson(e as Map<String, dynamic>))
          .toList(),
      popularStore: (json['popularStore'] as List<dynamic>?)
          ?.map((e) => PopularStore.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'category': instance.homeCategory,
      'poster': instance.poster,
      'nearStore': instance.nearStore,
      'popularStore': instance.popularStore,
    };

HomeCategory _$HomeCategoryFromJson(Map<String, dynamic> json) => HomeCategory(
      image: json['image'] as String?,
      sId: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$HomeCategoryToJson(HomeCategory instance) =>
    <String, dynamic>{
      'image': instance.image,
      '_id': instance.sId,
      'name': instance.name,
    };

Poster _$PosterFromJson(Map<String, dynamic> json) => Poster(
      image: json['image'] as String?,
      sId: json['_id'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PosterToJson(Poster instance) => <String, dynamic>{
      'image': instance.image,
      '_id': instance.sId,
      'message': instance.message,
    };

NearStore _$NearStoreFromJson(Map<String, dynamic> json) => NearStore(
      sId: json['_id'] as String?,
      storeName: json['storeName'] as String?,
      storeImage: json['storeImage'] as String?,
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCollect: json['isCollect'] as bool?,
    );

Map<String, dynamic> _$NearStoreToJson(NearStore instance) => <String, dynamic>{
      '_id': instance.sId,
      'storeName': instance.storeName,
      'storeImage': instance.storeImage,
      'category': instance.category,
      'isCollect': instance.isCollect,
    };

PopularStore _$PopularStoreFromJson(Map<String, dynamic> json) => PopularStore(
      sId: json['_id'] as String?,
      storeName: json['storeName'] as String?,
      storeImage: json['storeImage'] as String?,
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCollect: json['isCollect'] as bool?,
    );

Map<String, dynamic> _$PopularStoreToJson(PopularStore instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'storeName': instance.storeName,
      'storeImage': instance.storeImage,
      'category': instance.category,
      'isCollect': instance.isCollect,
    };

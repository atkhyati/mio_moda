// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      id: json['_id'] as String?,
      storeName: json['storeName'] as String?,
      storeImage: json['storeImage'] as String?,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      '_id': instance.id,
      'storeName': instance.storeName,
      'storeImage': instance.storeImage,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_store_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStoreByIdModel _$GetStoreByIdModelFromJson(Map<String, dynamic> json) =>
    GetStoreByIdModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StoreData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetStoreByIdModelToJson(GetStoreByIdModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

StoreData _$StoreDataFromJson(Map<String, dynamic> json) => StoreData(
      id: json['id'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      storeName: json['storeName'] as String?,
      description: json['description'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      webLink: json['webLink'] as String?,
      email: json['email'] as String?,
      facebook: json['facebook'] as String?,
      twitter: json['twitter'] as String?,
      googlePlus: json['googlePlus'] as String?,
      keyword:
          (json['keyword'] as List<dynamic>?)?.map((e) => e as String).toList(),
      amenity:
          (json['amenity'] as List<dynamic>?)?.map((e) => e as String).toList(),
      storeOwnerId: json['storeOwnerId'] as String?,
      categoryId: json['categoryId'] as List<dynamic>?,
      storeImages: (json['storeImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      address: json['address'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      zipCode: json['zipCode'] as String?,
      heart: json['heart'] as int?,
      smile: json['smile'] as int?,
      sad: json['sad'] as int?,
      angry: json['angry'] as int?,
      totalRating: json['totalRating'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool?,
      isEnable: json['isEnable'] as bool?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['v'] as int?,
      paymentMethods: (json['paymentMethods'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      instagram: json['instagram'] as String?,
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCollect: json['isCollect'] as bool?,
    );

Map<String, dynamic> _$StoreDataToJson(StoreData instance) => <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'storeName': instance.storeName,
      'description': instance.description,
      'phoneNumber': instance.phoneNumber,
      'webLink': instance.webLink,
      'email': instance.email,
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'googlePlus': instance.googlePlus,
      'keyword': instance.keyword,
      'amenity': instance.amenity,
      'storeOwnerId': instance.storeOwnerId,
      'categoryId': instance.categoryId,
      'storeImages': instance.storeImages,
      'address': instance.address,
      'state': instance.state,
      'city': instance.city,
      'country': instance.country,
      'zipCode': instance.zipCode,
      'heart': instance.heart,
      'smile': instance.smile,
      'sad': instance.sad,
      'angry': instance.angry,
      'totalRating': instance.totalRating,
      'rating': instance.rating,
      'isActive': instance.isActive,
      'isEnable': instance.isEnable,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
      'paymentMethods': instance.paymentMethods,
      'instagram': instance.instagram,
      'category': instance.category,
      'isCollect': instance.isCollect,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
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

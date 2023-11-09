import 'package:json_annotation/json_annotation.dart';

part 'get_store_by_id_model.g.dart';

@JsonSerializable()
class GetStoreByIdModel {
  GetStoreByIdModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<StoreData>? data;

  factory GetStoreByIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetStoreByIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetStoreByIdModelToJson(this);
}

@JsonSerializable()
class StoreData {
  StoreData({
    this.id,
    this.location,
    this.storeName,
    this.description,
    this.phoneNumber,
    this.webLink,
    this.email,
    this.facebook,
    this.twitter,
    this.googlePlus,
    this.keyword,
    this.amenity,
    this.storeOwnerId,
    this.categoryId,
    this.storeImages,
    this.address,
    this.state,
    this.city,
    this.country,
    this.zipCode,
    this.heart,
    this.smile,
    this.sad,
    this.angry,
    this.totalRating,
    this.rating,
    this.isActive,
    this.isEnable,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.paymentMethods,
    this.instagram,
    this.category,
    this.isCollect,
  });

  String? id;
  Location? location;
  String? storeName;
  String? description;
  String? phoneNumber;
  String? webLink;
  String? email;
  String? facebook;
  String? twitter;
  String? googlePlus;
  List<String>? keyword;
  List<String>? amenity;
  String? storeOwnerId;
  List<dynamic>? categoryId;
  List<String>? storeImages;
  String? address;
  String? state;
  String? city;
  String? country;
  String? zipCode;
  int? heart;
  int? smile;
  int? sad;
  int? angry;
  int? totalRating;
  double? rating;
  bool? isActive;
  bool? isEnable;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? v;
  List<String>? paymentMethods;
  String? instagram;
  List<Category>? category;
  bool? isCollect;

  factory StoreData.fromJson(Map<String, dynamic> json) =>
      _$StoreDataFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDataToJson(this);
}

@JsonSerializable()
class Category {
  Category({this.id, this.name});

  String? id;
  String? name;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Location {
  Location({this.type, this.coordinates});

  String? type;
  List<double>? coordinates;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

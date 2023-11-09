import 'package:json_annotation/json_annotation.dart';

import '../business/my_business_model.dart';

part 'home_screen_model.g.dart';

@JsonSerializable()
class HomeScreenModel {
  HomeScreenModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) =>
      _$HomeScreenModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeScreenModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.homeCategory,
    this.poster,
    this.nearStore,
    this.popularStore,
  });

  @JsonKey(name: 'category')
  List<HomeCategory>? homeCategory;
  List<Poster>? poster;
  List<NearStore>? nearStore;
  List<PopularStore>? popularStore;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class HomeCategory {
  HomeCategory({
    this.image,
    this.sId,
    this.name,
  });

  String? image;
  @JsonKey(name: '_id')
  String? sId;
  String? name;

  factory HomeCategory.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCategoryToJson(this);
}

@JsonSerializable()
class Poster {
  Poster({
    this.image,
    this.sId,
    this.message,
  });

  String? image;
  @JsonKey(name: '_id')
  String? sId;
  String? message;

  factory Poster.fromJson(Map<String, dynamic> json) => _$PosterFromJson(json);

  Map<String, dynamic> toJson() => _$PosterToJson(this);
}

@JsonSerializable()
class NearStore {
  NearStore({
    this.sId,
    this.storeName,
    this.storeImage,
    this.category,
    this.isCollect,
  });

  @JsonKey(name: '_id')
  String? sId;
  String? storeName;
  String? storeImage;
  List<Category>? category;
  bool? isCollect;

  factory NearStore.fromJson(Map<String, dynamic> json) =>
      _$NearStoreFromJson(json);

  Map<String, dynamic> toJson() => _$NearStoreToJson(this);
}

@JsonSerializable()
class PopularStore {
  PopularStore({
    this.sId,
    this.storeName,
    this.storeImage,
    this.category,
    this.isCollect,
  });

  @JsonKey(name: '_id')
  String? sId;
  String? storeName;
  String? storeImage;
  List<Category>? category;
  bool? isCollect;

  factory PopularStore.fromJson(Map<String, dynamic> json) =>
      _$PopularStoreFromJson(json);

  Map<String, dynamic> toJson() => _$PopularStoreToJson(this);
}

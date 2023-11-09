import 'package:json_annotation/json_annotation.dart';

part 'get_collection_model.g.dart';

@JsonSerializable()
class GetCollectionModel {
  GetCollectionModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory GetCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$GetCollectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCollectionModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.collectionData,
    this.state,
  });

  @JsonKey(name: 'collection_data')
  List<CollectionData>? collectionData;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class CollectionData {
  CollectionData({
    this.id,
    this.store,
  });

  @JsonKey(name: '_id')
  String? id;
  List<Store>? store;

  factory CollectionData.fromJson(Map<String, dynamic> json) =>
      _$CollectionDataFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionDataToJson(this);
}

@JsonSerializable()
class Store {
  Store({
    this.id,
    this.storeName,
    this.description,
    this.totalRating,
    this.rating,
    this.storeImage,
    this.categoryName,
  });

  String? id;
  @JsonKey(name: 'store_name')
  String? storeName;
  String? description;
  @JsonKey(name: 'total_rating')
  dynamic totalRating;
  dynamic rating;
  @JsonKey(name: 'store_image')
  String? storeImage;
  @JsonKey(name: 'category_name')
  String? categoryName;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}

@JsonSerializable()
class State {
  State({
    this.page,
    this.limit,
    this.pageLimit,
  });

  int? page;
  int? limit;
  @JsonKey(name: 'page_limit')
  int? pageLimit;

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);
}

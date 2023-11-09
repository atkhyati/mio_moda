import 'package:json_annotation/json_annotation.dart';

part 'homescreen_search_model.g.dart';

@JsonSerializable()
class HomeScreenSearchModel {
  HomeScreenSearchModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory HomeScreenSearchModel.fromJson(Map<String, dynamic> json) =>
      _$HomeScreenSearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeScreenSearchModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.storeData,
    this.state,
  });

  @JsonKey(name: 'store_data')
  List<SearchStoreData>? storeData;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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

@JsonSerializable()
class SearchStoreData {
  SearchStoreData({
    this.id,
    this.location,
    this.storeName,
    this.description,
    this.totalRating,
    this.storeImage,
    this.categoryName,
    this.isCollect,
  });

  @JsonKey(name: '_id')
  String? id;
  dynamic location;
  String? storeName;
  String? description;
  dynamic totalRating;
  String? storeImage;
  String? categoryName;
  bool? isCollect;

  factory SearchStoreData.fromJson(Map<String, dynamic> json) =>
      _$SearchStoreDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchStoreDataToJson(this);
}

@JsonSerializable()
class Location {
  Location({
    this.type,
    this.coordinates,
  });

  String? type;
  List<double>? coordinates;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'store_by_category_id_model.g.dart';

@JsonSerializable()
class StoreByCategoryIdModel {
  StoreByCategoryIdModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory StoreByCategoryIdModel.fromJson(Map<String, dynamic> json) =>
      _$StoreByCategoryIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreByCategoryIdModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.storeData,
    this.state,
  });

  @JsonKey(name: 'store_data')
  List<StoreDatum>? storeData;
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
class StoreDatum {
  StoreDatum({
    this.id,
    this.storeName,
    this.description,
    this.totalRating,
    this.rating,
    this.storeImage,
    this.categoryName,
    this.isCollect,
  });

  @JsonKey(name: '_id')
  String? id;
  String? storeName;
  String? description;
  dynamic totalRating;
  dynamic rating;
  String? storeImage;
  String? categoryName;
  bool? isCollect;

  factory StoreDatum.fromJson(Map<String, dynamic> json) =>
      _$StoreDatumFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDatumToJson(this);
}

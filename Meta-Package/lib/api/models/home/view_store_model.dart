// ignore: unused_import
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'view_store_model.g.dart';

@JsonSerializable()
class ViewStoreModel {
  ViewStoreModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ViewStoreModel.fromJson(Map<String, dynamic> json) =>
      _$ViewStoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$ViewStoreModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.storeData,
    this.state,
  });

  @JsonKey(name: 'store_data')
  List<ViewStoreData>? storeData;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ViewStoreData {
  ViewStoreData({
    this.id,
    this.storeName,
    this.heart,
    this.smile,
    this.sad,
    this.angry,
    this.storeImage,
    this.categoryName,
    this.isCollect,
  });

  @JsonKey(name: '_id')
  String? id;
  String? storeName;
  int? heart;
  int? smile;
  int? sad;
  int? angry;
  String? storeImage;
  String? categoryName;
  bool? isCollect;

  factory ViewStoreData.fromJson(Map<String, dynamic> json) =>
      _$ViewStoreDataFromJson(json);

  Map<String, dynamic> toJson() => _$ViewStoreDataToJson(this);
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

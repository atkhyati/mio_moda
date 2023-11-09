// To parse this JSON data, do
//
//     final homePageManagerResponseModel = homePageManagerResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/api/models/home/home_model.dart';

part 'home_page_manager_response_model.g.dart';

@JsonSerializable()
class HomePageManagerResponseModel {
  HomePageManagerResponseModel({
    this.id,
    this.layout,
    this.layoutId,
    this.title,
    this.status,
    this.sortOrder,
    this.extraData,
    this.description,
    this.btnText,
    this.imagesData,
    this.createdAt,
  });

  String? id;
  String? layout;
  @JsonKey(name: 'layout_id')
  String? layoutId;
  String? title;
  String? status;
  @JsonKey(name: 'sort_order')
  String? sortOrder;
  @JsonKey(name: 'extra_data')
  dynamic extraData;
  String? description;
  @JsonKey(name: 'btn_text')
  String? btnText;
  @JsonKey(name: 'images_data')
  List<ImagesData>? imagesData;
  @JsonKey(name: 'created_at')
  String? createdAt;

  factory HomePageManagerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomePageManagerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageManagerResponseModelToJson(this);
}

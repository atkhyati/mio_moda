import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  HomeModel({
    this.id,
    this.layout,
    this.layoutId,
    this.title,
    this.status,
    this.sortOrder,
    this.extraData,
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
  String? extraData;
  @JsonKey(name: 'images_data')
  List<ImagesData>? imagesData = [];
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? content;

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class ImagesData {
  ImagesData({
    this.title,
    this.image,
  });

  String? title;
  String? image;

  factory ImagesData.fromJson(Map<String, dynamic> json) =>
      _$ImagesDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesDataToJson(this);
}

class PageModel {
  RxInt currentPage = 1.obs;
  PageController? pageController;

  PageModel({this.pageController, required this.currentPage});
}

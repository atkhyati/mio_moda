import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_model.g.dart';

@JsonSerializable()
class MenuModel {
  MenuModel({
    this.id,
    this.parentId,
    this.name,
    this.isActive,
    this.position,
    this.level,
    this.productCount,
    this.childrenData,
  });

  int? id;
  @JsonKey(name: 'parent_id')
  int? parentId;
  String? name;
  @JsonKey(name: 'is_active')
  bool? isActive;
  int? position;
  int? level;
  @JsonKey(name: 'product_count')
  int? productCount;
  @JsonKey(name: 'children_data')
  List<ChildrenData>? childrenData;

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuModelToJson(this);
}

@JsonSerializable()
class ChildrenData {
  ChildrenData({
    this.id,
    this.parentId,
    this.name,
    this.isActive,
    this.position,
    this.level,
    this.productCount,
    this.childrenData,
  });

  int? id;
  @JsonKey(name: 'parent_id')
  int? parentId;
  String? name;
  @JsonKey(name: 'is_active')
  bool? isActive;
  int? position;
  int? level;
  @JsonKey(name: 'product_count')
  int? productCount;
  @JsonKey(name: 'children_data')
  List<ChildrenData>? childrenData;
  @JsonKey(ignore: true)
  RxBool isExpand = false.obs;

  factory ChildrenData.fromJson(Map<String, dynamic> json) =>
      _$ChildrenDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChildrenDataToJson(this);
}

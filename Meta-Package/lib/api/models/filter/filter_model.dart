// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_model.g.dart';

@JsonSerializable()
class FilterModel {
  FilterModel(
      {this.attrCode,
      this.attrLabel,
      this.category,
      this.minPrice = 0.0,
      this.maxPrice = 0.0,
      this.isSelected = false});

  @JsonKey(name: 'attr_code')
  String? attrCode;
  @JsonKey(name: 'attr_label')
  String? attrLabel;
  @JsonKey(name: 'values')
  List<Category>? category;
  @JsonKey(name: 'min_price')
  double minPrice;
  @JsonKey(name: 'max_price')
  double maxPrice;
  @JsonKey(name: 'is_selected')
  bool isSelected;

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterModelToJson(this);
}

@JsonSerializable()
class Category {
  Category({
    this.display,
    this.value,
    this.count,
    this.selected,
  });

  String? display;
  String? value;
  String? count;
  // @JsonKey(name: 'is_selected')
  bool? selected;

  @JsonKey(ignore: true)
  RxBool get isSelected => (selected ?? false).obs;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
      attrCode: json['attr_code'] as String?,
      attrLabel: json['attr_label'] as String?,
      category: (json['values'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      minPrice: (json['min_price'] as num?)?.toDouble() ?? 0.0,
      maxPrice: (json['max_price'] as num?)?.toDouble() ?? 0.0,
      isSelected: json['is_selected'] as bool? ?? false,
    );

Map<String, dynamic> _$FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'attr_code': instance.attrCode,
      'attr_label': instance.attrLabel,
      'values': instance.category,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'is_selected': instance.isSelected,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      display: json['display'] as String?,
      value: json['value'] as String?,
      count: json['count'] as String?,
      selected: json['selected'] as bool?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'display': instance.display,
      'value': instance.value,
      'count': instance.count,
      'selected': instance.selected,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuModel _$MenuModelFromJson(Map<String, dynamic> json) => MenuModel(
      id: json['id'] as int?,
      parentId: json['parent_id'] as int?,
      name: json['name'] as String?,
      isActive: json['is_active'] as bool?,
      position: json['position'] as int?,
      level: json['level'] as int?,
      productCount: json['product_count'] as int?,
      childrenData: (json['children_data'] as List<dynamic>?)
          ?.map((e) => ChildrenData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuModelToJson(MenuModel instance) => <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parentId,
      'name': instance.name,
      'is_active': instance.isActive,
      'position': instance.position,
      'level': instance.level,
      'product_count': instance.productCount,
      'children_data': instance.childrenData,
    };

ChildrenData _$ChildrenDataFromJson(Map<String, dynamic> json) => ChildrenData(
      id: json['id'] as int?,
      parentId: json['parent_id'] as int?,
      name: json['name'] as String?,
      isActive: json['is_active'] as bool?,
      position: json['position'] as int?,
      level: json['level'] as int?,
      productCount: json['product_count'] as int?,
      childrenData: (json['children_data'] as List<dynamic>?)
          ?.map((e) => ChildrenData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChildrenDataToJson(ChildrenData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parentId,
      'name': instance.name,
      'is_active': instance.isActive,
      'position': instance.position,
      'level': instance.level,
      'product_count': instance.productCount,
      'children_data': instance.childrenData,
    };

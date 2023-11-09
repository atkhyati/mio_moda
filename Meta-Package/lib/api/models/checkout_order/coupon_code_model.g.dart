// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponCode _$CouponCodeFromJson(Map<String, dynamic> json) => CouponCode(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => CouponItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchCriteria: json['search_criteria'] == null
          ? null
          : SearchCriteria.fromJson(
              json['search_criteria'] as Map<String, dynamic>),
      totalCount: json['total_count'] as int?,
    );

Map<String, dynamic> _$CouponCodeToJson(CouponCode instance) =>
    <String, dynamic>{
      'items': instance.items,
      'search_criteria': instance.searchCriteria,
      'total_count': instance.totalCount,
    };

CouponItems _$CouponItemsFromJson(Map<String, dynamic> json) => CouponItems(
      couponId: json['coupon_id'] as int?,
      ruleId: json['rule_id'] as int?,
      code: json['code'] as String?,
      usageLimit: json['usage_limit'] as int?,
      timesUsed: json['times_used'] as int?,
      isPrimary: json['is_primary'],
      createdAt: json['created_at'] as String?,
      expirationDate: json['expiration_date'] as String?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$CouponItemsToJson(CouponItems instance) =>
    <String, dynamic>{
      'coupon_id': instance.couponId,
      'rule_id': instance.ruleId,
      'code': instance.code,
      'usage_limit': instance.usageLimit,
      'times_used': instance.timesUsed,
      'is_primary': instance.isPrimary,
      'created_at': instance.createdAt,
      'expiration_date': instance.expirationDate,
      'type': instance.type,
    };

SearchCriteria _$SearchCriteriaFromJson(Map<String, dynamic> json) =>
    SearchCriteria(
      filterGroups: (json['filter_groups'] as List<dynamic>?)
          ?.map((e) => FilterGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchCriteriaToJson(SearchCriteria instance) =>
    <String, dynamic>{
      'filter_groups': instance.filterGroups,
    };

FilterGroup _$FilterGroupFromJson(Map<String, dynamic> json) => FilterGroup(
      filters: (json['filters'] as List<dynamic>?)
          ?.map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterGroupToJson(FilterGroup instance) =>
    <String, dynamic>{
      'filters': instance.filters,
    };

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      field: json['field'] as String?,
      value: json['value'] as String?,
      conditionType: json['condition_type'] as String?,
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
      'condition_type': instance.conditionType,
    };

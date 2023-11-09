import 'package:json_annotation/json_annotation.dart';

part 'coupon_code_model.g.dart';

@JsonSerializable()
class CouponCode {
  CouponCode({
    this.items,
    this.searchCriteria,
    this.totalCount,
  });

  List<CouponItems>? items;
  @JsonKey(name: 'search_criteria')
  SearchCriteria? searchCriteria;
  @JsonKey(name: 'total_count')
  int? totalCount;

  factory CouponCode.fromJson(Map<String, dynamic> json) =>
      _$CouponCodeFromJson(json);

  Map<String, dynamic> toJson() => _$CouponCodeToJson(this);
}

@JsonSerializable()
class CouponItems {
  CouponItems({
    this.couponId,
    this.ruleId,
    this.code,
    this.usageLimit,
    this.timesUsed,
    this.isPrimary,
    this.createdAt,
    this.expirationDate,
    this.type,
  });

  @JsonKey(name: 'coupon_id')
  int? couponId;
  @JsonKey(name: 'rule_id')
  int? ruleId;
  String? code;
  @JsonKey(name: 'usage_limit')
  int? usageLimit;
  @JsonKey(name: 'times_used')
  int? timesUsed;
  @JsonKey(name: 'is_primary')
  dynamic isPrimary;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'expiration_date')
  String? expirationDate;
  int? type;

  factory CouponItems.fromJson(Map<String, dynamic> json) =>
      _$CouponItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CouponItemsToJson(this);
}

@JsonSerializable()
class SearchCriteria {
  SearchCriteria({
    this.filterGroups,
  });

  @JsonKey(name: 'filter_groups')
  List<FilterGroup>? filterGroups;

  factory SearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$SearchCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCriteriaToJson(this);
}

@JsonSerializable()
class FilterGroup {
  FilterGroup({
    this.filters,
  });

  List<Filter>? filters;

  factory FilterGroup.fromJson(Map<String, dynamic> json) =>
      _$FilterGroupFromJson(json);

  Map<String, dynamic> toJson() => _$FilterGroupToJson(this);
}

@JsonSerializable()
class Filter {
  Filter({
    this.field,
    this.value,
    this.conditionType,
  });

  String? field;
  String? value;
  @JsonKey(name: 'condition_type')
  String? conditionType;

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import '../product/product_model.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  SearchModel({
    this.items,
    this.aggregations,
    this.searchCriteria,
    this.totalCount,
  });

  final List<SearchItems>? items;
  final Aggregations? aggregations;
  @JsonKey(name: 'search_criteria')
  final SearchCriteria? searchCriteria;
  @JsonKey(name: 'total_count')
  final int? totalCount;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}

@JsonSerializable()
class SearchItems {
  SearchItems({
    this.id,
    this.customAttributes,
  });

  final int? id;
  @JsonKey(name: 'custom_attributes')
  final List<CustomAttributes>? customAttributes;

  factory SearchItems.fromJson(Map<String, dynamic> json) =>
      _$SearchItemsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchItemsToJson(this);
}

@JsonSerializable()
class Aggregations {
  Aggregations({
    this.buckets,
    this.bucketNames,
  });

  final List<Buckets>? buckets;
  @JsonKey(name: 'bucket_names')
  final List<String>? bucketNames;

  factory Aggregations.fromJson(Map<String, dynamic> json) =>
      _$AggregationsFromJson(json);

  Map<String, dynamic> toJson() => _$AggregationsToJson(this);
}

@JsonSerializable()
class Buckets {
  Buckets({
    this.name,
    this.values,
  });

  final String? name;
  final List<ValuesSearch>? values;

  factory Buckets.fromJson(Map<String, dynamic> json) =>
      _$BucketsFromJson(json);

  Map<String, dynamic> toJson() => _$BucketsToJson(this);
}

@JsonSerializable()
class ValuesSearch {
  ValuesSearch({
    this.value,
    this.metrics,
  });

  final String? value;
  final List<int>? metrics;

  factory ValuesSearch.fromJson(Map<String, dynamic> json) =>
      _$ValuesSearchFromJson(json);

  Map<String, dynamic> toJson() => _$ValuesSearchToJson(this);
}

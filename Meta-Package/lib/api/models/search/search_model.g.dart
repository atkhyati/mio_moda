// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => SearchItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      aggregations: json['aggregations'] == null
          ? null
          : Aggregations.fromJson(json['aggregations'] as Map<String, dynamic>),
      searchCriteria: json['search_criteria'] == null
          ? null
          : SearchCriteria.fromJson(
              json['search_criteria'] as Map<String, dynamic>),
      totalCount: json['total_count'] as int?,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'aggregations': instance.aggregations,
      'search_criteria': instance.searchCriteria,
      'total_count': instance.totalCount,
    };

SearchItems _$SearchItemsFromJson(Map<String, dynamic> json) => SearchItems(
      id: json['id'] as int?,
      customAttributes: (json['custom_attributes'] as List<dynamic>?)
          ?.map((e) => CustomAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchItemsToJson(SearchItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'custom_attributes': instance.customAttributes,
    };

Aggregations _$AggregationsFromJson(Map<String, dynamic> json) => Aggregations(
      buckets: (json['buckets'] as List<dynamic>?)
          ?.map((e) => Buckets.fromJson(e as Map<String, dynamic>))
          .toList(),
      bucketNames: (json['bucket_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AggregationsToJson(Aggregations instance) =>
    <String, dynamic>{
      'buckets': instance.buckets,
      'bucket_names': instance.bucketNames,
    };

Buckets _$BucketsFromJson(Map<String, dynamic> json) => Buckets(
      name: json['name'] as String?,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => ValuesSearch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BucketsToJson(Buckets instance) => <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
    };

ValuesSearch _$ValuesSearchFromJson(Map<String, dynamic> json) => ValuesSearch(
      value: json['value'] as String?,
      metrics:
          (json['metrics'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$ValuesSearchToJson(ValuesSearch instance) =>
    <String, dynamic>{
      'value': instance.value,
      'metrics': instance.metrics,
    };

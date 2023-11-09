import 'package:json_annotation/json_annotation.dart';

part 'get_product_data_model.g.dart';

@JsonSerializable()
class ProductDetailsModel {
  ProductDetailsModel({
    this.items,
    this.searchCriteria,
    this.totalCount,
  });

  List<Items>? items;
  @JsonKey(name: 'search_criteria')
  SearchCriteria? searchCriteria;
  @JsonKey(name: 'total_count')
  int? totalCount;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
}

@JsonSerializable()
class Items {
  Items(
      {this.id,
      this.sku,
      this.name,
      this.attributeSetId,
      this.price,
      this.status,
      this.visibility,
      this.typeId,
      this.createdAt,
      this.updatedAt,
      this.weight,
      this.extensionAttributes,
      this.productLinks,
      this.options,
      this.mediaGalleryEntries,
      this.tierPrices,
      this.customAttributes});

  int? id;
  String? sku;
  String? name;
  @JsonKey(name: 'attribute_set_id')
  int? attributeSetId;
  dynamic price;
  int? status;
  int? visibility;
  @JsonKey(name: 'type_id')
  String? typeId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'extension_attributes')
  ExtensionAttributes? extensionAttributes;
  @JsonKey(name: 'product_links')
  List<dynamic>? productLinks;
  @JsonKey(name: 'tier_prices')
  List<dynamic>? tierPrices;
  @JsonKey(name: 'custom_attributes')
  List<CustomAttributes>? customAttributes;
  int? weight;
  List<dynamic>? options;
  @JsonKey(name: 'media_gallery_entries')
  List<MediaGalleryEntries>? mediaGalleryEntries;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class ExtensionAttributes {
  ExtensionAttributes({
    this.websiteIds,
    this.categoryLinks,
    this.configurableProductLinks,
    this.configurableProductOptions,
  });

  @JsonKey(name: 'website_ids')
  List<int>? websiteIds;
  @JsonKey(name: 'category_links')
  List<CategoryLinks>? categoryLinks;
  @JsonKey(name: 'configurable_product_links')
  List<int>? configurableProductLinks;
  @JsonKey(name: 'configurable_product_options')
  List<ConfigurableProductOptions>? configurableProductOptions;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionAttributesToJson(this);
}

@JsonSerializable()
class CategoryLinks {
  CategoryLinks({
    this.position,
    this.categoryId,
  });

  int? position;
  @JsonKey(name: 'category_id')
  String? categoryId;

  factory CategoryLinks.fromJson(Map<String, dynamic> json) =>
      _$CategoryLinksFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryLinksToJson(this);
}

@JsonSerializable()
class ConfigurableProductOptions {
  ConfigurableProductOptions({
    this.id,
    this.attributeId,
    this.label,
    this.position,
    this.values,
    this.productId,
  });

  int? id;
  @JsonKey(name: 'attribute_id')
  String? attributeId;
  String? label;
  int? position;
  List<Values>? values;
  @JsonKey(name: 'product_id')
  int? productId;

  factory ConfigurableProductOptions.fromJson(Map<String, dynamic> json) =>
      _$ConfigurableProductOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurableProductOptionsToJson(this);
}

@JsonSerializable()
class Values {
  Values({
    this.valueIndex,
  });

  @JsonKey(name: 'value_index')
  int? valueIndex;

  factory Values.fromJson(Map<String, dynamic> json) => _$ValuesFromJson(json);

  Map<String, dynamic> toJson() => _$ValuesToJson(this);
}

@JsonSerializable()
class MediaGalleryEntries {
  MediaGalleryEntries({
    this.id,
    this.mediaType,
    this.label,
    this.position,
    this.disabled,
    this.types,
    this.file,
  });

  int? id;
  @JsonKey(name: 'media_type')
  String? mediaType;
  dynamic label;
  int? position;
  bool? disabled;
  List<String>? types;
  String? file;

  factory MediaGalleryEntries.fromJson(Map<String, dynamic> json) =>
      _$MediaGalleryEntriesFromJson(json);

  Map<String, dynamic> toJson() => _$MediaGalleryEntriesToJson(this);
}

@JsonSerializable()
class CustomAttributes {
  CustomAttributes({
    this.attributeCode,
    this.value,
  });

  @JsonKey(name: 'attribute_code')
  String? attributeCode;
  dynamic value;

  factory CustomAttributes.fromJson(Map<String, dynamic> json) =>
      _$CustomAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$CustomAttributesToJson(this);
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

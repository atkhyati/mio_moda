// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchCriteria: json['search_criteria'] == null
          ? null
          : SearchCriteria.fromJson(
              json['search_criteria'] as Map<String, dynamic>),
      totalCount: json['total_count'] as int?,
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
        ProductDetailsModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'search_criteria': instance.searchCriteria,
      'total_count': instance.totalCount,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      id: json['id'] as int?,
      sku: json['sku'] as String?,
      name: json['name'] as String?,
      attributeSetId: json['attribute_set_id'] as int?,
      price: json['price'],
      status: json['status'] as int?,
      visibility: json['visibility'] as int?,
      typeId: json['type_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      weight: json['weight'] as int?,
      extensionAttributes: json['extension_attributes'] == null
          ? null
          : ExtensionAttributes.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
      productLinks: json['product_links'] as List<dynamic>?,
      options: json['options'] as List<dynamic>?,
      mediaGalleryEntries: (json['media_gallery_entries'] as List<dynamic>?)
          ?.map((e) => MediaGalleryEntries.fromJson(e as Map<String, dynamic>))
          .toList(),
      tierPrices: json['tier_prices'] as List<dynamic>?,
      customAttributes: (json['custom_attributes'] as List<dynamic>?)
          ?.map((e) => CustomAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'name': instance.name,
      'attribute_set_id': instance.attributeSetId,
      'price': instance.price,
      'status': instance.status,
      'visibility': instance.visibility,
      'type_id': instance.typeId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'extension_attributes': instance.extensionAttributes,
      'product_links': instance.productLinks,
      'tier_prices': instance.tierPrices,
      'custom_attributes': instance.customAttributes,
      'weight': instance.weight,
      'options': instance.options,
      'media_gallery_entries': instance.mediaGalleryEntries,
    };

ExtensionAttributes _$ExtensionAttributesFromJson(Map<String, dynamic> json) =>
    ExtensionAttributes(
      websiteIds: (json['website_ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      categoryLinks: (json['category_links'] as List<dynamic>?)
          ?.map((e) => CategoryLinks.fromJson(e as Map<String, dynamic>))
          .toList(),
      configurableProductLinks:
          (json['configurable_product_links'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList(),
      configurableProductOptions: (json['configurable_product_options']
              as List<dynamic>?)
          ?.map((e) =>
              ConfigurableProductOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExtensionAttributesToJson(
        ExtensionAttributes instance) =>
    <String, dynamic>{
      'website_ids': instance.websiteIds,
      'category_links': instance.categoryLinks,
      'configurable_product_links': instance.configurableProductLinks,
      'configurable_product_options': instance.configurableProductOptions,
    };

CategoryLinks _$CategoryLinksFromJson(Map<String, dynamic> json) =>
    CategoryLinks(
      position: json['position'] as int?,
      categoryId: json['category_id'] as String?,
    );

Map<String, dynamic> _$CategoryLinksToJson(CategoryLinks instance) =>
    <String, dynamic>{
      'position': instance.position,
      'category_id': instance.categoryId,
    };

ConfigurableProductOptions _$ConfigurableProductOptionsFromJson(
        Map<String, dynamic> json) =>
    ConfigurableProductOptions(
      id: json['id'] as int?,
      attributeId: json['attribute_id'] as String?,
      label: json['label'] as String?,
      position: json['position'] as int?,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => Values.fromJson(e as Map<String, dynamic>))
          .toList(),
      productId: json['product_id'] as int?,
    );

Map<String, dynamic> _$ConfigurableProductOptionsToJson(
        ConfigurableProductOptions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attribute_id': instance.attributeId,
      'label': instance.label,
      'position': instance.position,
      'values': instance.values,
      'product_id': instance.productId,
    };

Values _$ValuesFromJson(Map<String, dynamic> json) => Values(
      valueIndex: json['value_index'] as int?,
    );

Map<String, dynamic> _$ValuesToJson(Values instance) => <String, dynamic>{
      'value_index': instance.valueIndex,
    };

MediaGalleryEntries _$MediaGalleryEntriesFromJson(Map<String, dynamic> json) =>
    MediaGalleryEntries(
      id: json['id'] as int?,
      mediaType: json['media_type'] as String?,
      label: json['label'],
      position: json['position'] as int?,
      disabled: json['disabled'] as bool?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      file: json['file'] as String?,
    );

Map<String, dynamic> _$MediaGalleryEntriesToJson(
        MediaGalleryEntries instance) =>
    <String, dynamic>{
      'id': instance.id,
      'media_type': instance.mediaType,
      'label': instance.label,
      'position': instance.position,
      'disabled': instance.disabled,
      'types': instance.types,
      'file': instance.file,
    };

CustomAttributes _$CustomAttributesFromJson(Map<String, dynamic> json) =>
    CustomAttributes(
      attributeCode: json['attribute_code'] as String?,
      value: json['value'],
    );

Map<String, dynamic> _$CustomAttributesToJson(CustomAttributes instance) =>
    <String, dynamic>{
      'attribute_code': instance.attributeCode,
      'value': instance.value,
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

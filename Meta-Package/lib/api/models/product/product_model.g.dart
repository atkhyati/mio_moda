// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchCriteria: json['search_criteria'] == null
          ? null
          : SearchCriteria.fromJson(
              json['search_criteria'] as Map<String, dynamic>),
      totalCount: json['total_count'] as int?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'search_criteria': instance.searchCriteria,
      'total_count': instance.totalCount,
    };

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      id: json['id'] as int?,
      sku: json['sku'] as String?,
      name: json['name'] as String?,
      attributeSetId: json['attribute_set_id'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      status: json['status'] as int?,
      visibility: json['visibility'] as int?,
      typeId: json['type_id'] as String?,
      createdAt:
          DateParseUtils.dateTimeFromJsonUTC(json['created_at'] as String?),
      updatedAt:
          DateParseUtils.dateTimeFromJsonUTC(json['updated_at'] as String?),
      extensionAttributes: json['extension_attributes'] == null
          ? null
          : ExtensionAttributesProduct.fromJson(
              json['extension_attributes'] as Map<String, dynamic>),
      productLinks: json['product_links'] as List<dynamic>?,
      tierPrices: json['tier_prices'] as List<dynamic>?,
      customAttributes: (json['custom_attributes'] as List<dynamic>?)
          ?.map((e) => CustomAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: (json['weight'] as num?)?.toDouble(),
      options: json['options'] as List<dynamic>?,
      mediaGalleryEntries: (json['media_gallery_entries'] as List<dynamic>?)
          ?.map((e) => MediaGalleryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'name': instance.name,
      'attribute_set_id': instance.attributeSetId,
      'price': instance.price,
      'status': instance.status,
      'visibility': instance.visibility,
      'type_id': instance.typeId,
      'created_at': DateParseUtils.dateTimeToJsonUTC(instance.createdAt),
      'updated_at': DateParseUtils.dateTimeToJsonUTC(instance.updatedAt),
      'extension_attributes': instance.extensionAttributes,
      'product_links': instance.productLinks,
      'tier_prices': instance.tierPrices,
      'custom_attributes': instance.customAttributes,
      'weight': instance.weight,
      'options': instance.options,
      'media_gallery_entries': instance.mediaGalleryEntries,
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

ExtensionAttributesProduct _$ExtensionAttributesProductFromJson(
        Map<String, dynamic> json) =>
    ExtensionAttributesProduct(
      websiteIds: (json['website_ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      categoryLinks: (json['category_links'] as List<dynamic>?)
          ?.map((e) => CategoryLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      configurableProductLinks:
          (json['configurable_product_links'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList(),
      configurableProductOptions:
          (json['configurable_product_options'] as List<dynamic>?)
              ?.map((e) =>
                  ConfigurableProductOption.fromJson(e as Map<String, dynamic>))
              .toList(),
      convertedRegularPrice: json['converted_regular_price'] as String?,
      convertedRegularOldPrice: json['converted_regular_old_price'] as String?,
      stockItem: json['stock_items'] == null
          ? null
          : StockItem.fromJson(json['stock_items'] as Map<String, dynamic>),
      stockStatus: json['stock_status'] as String?,
    );

Map<String, dynamic> _$ExtensionAttributesProductToJson(
        ExtensionAttributesProduct instance) =>
    <String, dynamic>{
      'website_ids': instance.websiteIds,
      'category_links': instance.categoryLinks,
      'configurable_product_links': instance.configurableProductLinks,
      'configurable_product_options': instance.configurableProductOptions,
      'converted_regular_price': instance.convertedRegularPrice,
      'converted_regular_old_price': instance.convertedRegularOldPrice,
      'stock_items': instance.stockItem,
      'stock_status': instance.stockStatus,
    };

StockItem _$StockItemFromJson(Map<String, dynamic> json) => StockItem(
      itemId: json['item_id'] as int?,
      productId: json['product_id'] as int?,
      stockId: json['stock_id'] as int?,
      qty: json['qty'] as int?,
      isInStock: json['is_in_stock'] as bool?,
      isQtyDecimal: json['is_qty_decimal'] as bool?,
      showDefaultNotificationMessage:
          json['show_default_notification_message'] as bool?,
      useConfigMinQty: json['use_config_min_qty'] as bool?,
      minQty: json['min_qty'] as int?,
      useConfigMinSaleQty: json['use_config_min_sale_qty'] as int?,
      minSaleQty: json['min_sale_qty'] as int?,
      useConfigMaxSaleQty: json['use_config_max_sale_qty'] as bool?,
      maxSaleQty: json['max_sale_qty'] as int?,
      useConfigBackorders: json['use_config_backorders'] as bool?,
      backorders: json['backorders'] as int?,
      useConfigNotifyStockQty: json['use_config_notify_stock_qty'] as bool?,
      notifyStockQty: json['notify_stock_qty'] as int?,
      useConfigQtyIncrements: json['use_config_qty_increments'] as bool?,
      qtyIncrements: json['qty_increments'] as int?,
      useConfigEnableQtyInc: json['use_config_enable_qty_inc'] as bool?,
      enableQtyIncrements: json['enable_qty_increments'] as bool?,
      useConfigManageStock: json['use_config_manage_stock'] as bool?,
      manageStock: json['manage_stock'] as bool?,
      lowStockDate: json['low_stock_date'],
      isDecimalDivided: json['is_decimal_divided'] as bool?,
      stockStatusChangedAuto: json['stock_status_changed_auto'] as int?,
    );

Map<String, dynamic> _$StockItemToJson(StockItem instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'product_id': instance.productId,
      'stock_id': instance.stockId,
      'qty': instance.qty,
      'is_in_stock': instance.isInStock,
      'is_qty_decimal': instance.isQtyDecimal,
      'show_default_notification_message':
          instance.showDefaultNotificationMessage,
      'use_config_min_qty': instance.useConfigMinQty,
      'min_qty': instance.minQty,
      'use_config_min_sale_qty': instance.useConfigMinSaleQty,
      'min_sale_qty': instance.minSaleQty,
      'use_config_max_sale_qty': instance.useConfigMaxSaleQty,
      'max_sale_qty': instance.maxSaleQty,
      'use_config_backorders': instance.useConfigBackorders,
      'backorders': instance.backorders,
      'use_config_notify_stock_qty': instance.useConfigNotifyStockQty,
      'notify_stock_qty': instance.notifyStockQty,
      'use_config_qty_increments': instance.useConfigQtyIncrements,
      'qty_increments': instance.qtyIncrements,
      'use_config_enable_qty_inc': instance.useConfigEnableQtyInc,
      'enable_qty_increments': instance.enableQtyIncrements,
      'use_config_manage_stock': instance.useConfigManageStock,
      'manage_stock': instance.manageStock,
      'low_stock_date': instance.lowStockDate,
      'is_decimal_divided': instance.isDecimalDivided,
      'stock_status_changed_auto': instance.stockStatusChangedAuto,
    };

ConfigurableProductOption _$ConfigurableProductOptionFromJson(
        Map<String, dynamic> json) =>
    ConfigurableProductOption(
      id: json['id'] as int?,
      attributeId: json['attribute_id'] as String?,
      label: json['label'] as String?,
      position: json['position'] as int?,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => Values.fromJson(e as Map<String, dynamic>))
          .toList(),
      productId: json['product_id'] as int?,
    );

Map<String, dynamic> _$ConfigurableProductOptionToJson(
        ConfigurableProductOption instance) =>
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

CategoryLink _$CategoryLinkFromJson(Map<String, dynamic> json) => CategoryLink(
      position: json['position'] as int?,
      categoryId: json['category_id'] as String?,
    );

Map<String, dynamic> _$CategoryLinkToJson(CategoryLink instance) =>
    <String, dynamic>{
      'position': instance.position,
      'category_id': instance.categoryId,
    };

SearchCriteria _$SearchCriteriaFromJson(Map<String, dynamic> json) =>
    SearchCriteria(
      filterGroups: (json['filter_groups'] as List<dynamic>?)
          ?.map((e) => FilterGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestName: json['request_name'] as String?,
    );

Map<String, dynamic> _$SearchCriteriaToJson(SearchCriteria instance) =>
    <String, dynamic>{
      'filter_groups': instance.filterGroups,
      'request_name': instance.requestName,
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

MediaGalleryEntry _$MediaGalleryEntryFromJson(Map<String, dynamic> json) =>
    MediaGalleryEntry(
      id: json['id'] as int?,
      mediaType: json['media_type'] as String?,
      label: json['label'],
      position: json['position'],
      disabled: json['disabled'],
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      file: json['file'] as String?,
    );

Map<String, dynamic> _$MediaGalleryEntryToJson(MediaGalleryEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'media_type': instance.mediaType,
      'label': instance.label,
      'position': instance.position,
      'disabled': instance.disabled,
      'types': instance.types,
      'file': instance.file,
    };

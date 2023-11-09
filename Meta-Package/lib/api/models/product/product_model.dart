// To parse this JSON data, do
//     final productModel = productModelFromJson(jsonString);

import 'dart:math';

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/utils/date_utils.dart';
import 'package:meta_package/utils/global_singlton.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel({
    this.items,
    this.searchCriteria,
    this.totalCount,
  });

  List<ProductItem>? items;
  @JsonKey(name: 'search_criteria')
  SearchCriteria? searchCriteria;
  @JsonKey(name: 'total_count')
  int? totalCount;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductItem {
  ProductItem(
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
      this.extensionAttributes,
      this.productLinks,
      this.tierPrices,
      this.customAttributes,
      this.weight,
      this.options,
      this.mediaGalleryEntries});

  int? id;
  String? sku;
  String? name;
  @JsonKey(name: 'attribute_set_id')
  int? attributeSetId;
  double? price;
  int? status;
  int? visibility;
  @JsonKey(name: 'type_id')
  String? typeId;
  @JsonKey(
      name: 'created_at',
      fromJson: DateParseUtils.dateTimeFromJsonUTC,
      toJson: DateParseUtils.dateTimeToJsonUTC)
  DateTime? createdAt;
  @JsonKey(
      name: 'updated_at',
      fromJson: DateParseUtils.dateTimeFromJsonUTC,
      toJson: DateParseUtils.dateTimeToJsonUTC)
  DateTime? updatedAt;
  @JsonKey(name: 'extension_attributes')
  ExtensionAttributesProduct? extensionAttributes;
  @JsonKey(name: 'product_links')
  List<dynamic>? productLinks;
  @JsonKey(name: 'tier_prices')
  List<dynamic>? tierPrices;
  @JsonKey(name: 'custom_attributes')
  List<CustomAttributes>? customAttributes;
  @JsonKey(name: 'weight')
  double? weight;
  List<dynamic>? options;
  @JsonKey(name: 'media_gallery_entries')
  List<MediaGalleryEntry>? mediaGalleryEntries;

  @JsonKey(ignore: true)
  RxBool isWishList = false.obs;

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);

  // List<CustomAttribute> getProductImage() {
  //   List<CustomAttribute> customAttribute = customAttributes!.where (
  //       (element) => element.attributeCode == "image",
  //       /*orElse: () => CustomAttribute(attributeCode: "")*/
  //   ).toList();
  //   if (customAttribute[0].attributeCode!.isEmpty) return [];
  //   if (customAttributes == null) return [];
  //   debugPrint('customAttribute ==> $customAttribute');
  //   return customAttribute;
  // }

  String getProductImage() {
    CustomAttributes customAttribute = customAttributes!.firstWhere(
        (element) => element.attributeCode == "image",
        orElse: () => CustomAttributes(attributeCode: ""));
    if (customAttribute.attributeCode!.isEmpty) return "";
    if (customAttributes == null) return "";
    return (customAttribute.value ?? '').toString();
  }

  String getProductDescription() {
    if (customAttributes != null) {
      CustomAttributes customAttribute = customAttributes!.firstWhere(
          (element) => element.attributeCode == "description",
          orElse: () => CustomAttributes(attributeCode: ""));
      if (customAttribute.attributeCode!.isEmpty) return "";
      if (customAttributes == null) return "";
      return (customAttribute.value ?? '').toString();
    } else {
      return "";
    }
  }

  String getSizeChart() {
    CustomAttributes customAttribute = customAttributes!.firstWhere(
        (element) => element.attributeCode == "size_chart_url",
        orElse: () => CustomAttributes(attributeCode: ""));
    if (customAttribute.attributeCode!.isEmpty) return "";
    if (customAttributes == null) return "";
    return (customAttribute.value ?? '').toString();
  }

  String getComposition() {
    if (customAttributes != null) {
      CustomAttributes? customAttribute =
          customAttributes!.firstWhere((element) {
        return element.attributeCode == "composition";
      }, orElse: () => CustomAttributes(attributeCode: ""));
      if (customAttribute.attributeCode!.isEmpty) return "";
      if (customAttributes == null) return "";
      return (customAttribute.value ?? '').toString();
    } else {
      return "";
    }
  }

  String getColor() {
    if (customAttributes != null) {
      CustomAttributes customAttribute = customAttributes!.firstWhere(
          (element) => element.attributeCode == "color",
          orElse: () => CustomAttributes(attributeCode: ""));
      if (customAttribute.attributeCode!.isEmpty) return "";
      if (customAttributes == null) return "";
      return (customAttribute.value ?? '').toString();
    } else {
      return "";
    }
  }

  String getBrandName() {
    if (customAttributes != null && customAttributes!.isNotEmpty) {
      // debugPrint('customAttributes ==> ${customAttributes!.length}');
      CustomAttributes customAttribute = CustomAttributes();
      for (int i = 0; i < (customAttributes?.length ?? 0); i++) {
        if ((customAttributes?[i].attributeCode ?? '') == "brands") {
          customAttribute = customAttributes?[i] ?? CustomAttributes();
        } else {
          customAttribute = CustomAttributes();
        }
        final getData = GlobalSingleton()
            .optionList
            .where((element) => element['value'] == customAttribute.value)
            .toList();
        if (getData.isNotEmpty) {
          return (getData[0]['label'] ?? '').toString();
        } else {
          return "";
        }
      }
    } else {
      return "";
    }
    return "";

    ///replace this code
    /*  for (int i = 0; i < GlobalSingleton().optionList.length; i++) {
      if (customAttributes == null) {
        return "";
      }
      if (customAttribute.value == GlobalSingleton().optionList[i]['value']) {
        debugPrint("ProductName -> ${customAttribute.value}");
        return GlobalSingleton().optionList[i]['label'];
      }
    }  */
  }

  double getPriceFromConfigurableProduct(
      List<ProductItem>? itemList, ProductItem? item) {
    List<double> priceList = [];
    if (item!.extensionAttributes!.configurableProductLinks!.isNotEmpty) {
      for (int i = 0;
          i < item.extensionAttributes!.configurableProductLinks!.length;
          i++) {
        for (int j = 0; j < itemList!.length; j++) {
          int configureItemId =
              item.extensionAttributes!.configurableProductLinks![i];
          if (itemList[j].id == configureItemId) {
            priceList.add(itemList[j].price!);
          }
        }
      }
      if (item.visibility == 4) {
        item.price = priceList.reduce(min);
      }
    }
    return item.price ?? 0.0;
  }

  String getConvertRegularPriceFromConfigurableProduct() {
    return extensionAttributes?.convertedRegularPrice ?? '';
  }

  static double? _intToDouble(int? weight) {
    return weight != null ? double.tryParse("$weight") : 0.0;
  }
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
class ExtensionAttributesProduct {
  ExtensionAttributesProduct({
    this.websiteIds,
    this.categoryLinks,
    this.configurableProductLinks,
    this.configurableProductOptions,
    this.convertedRegularPrice,
    this.convertedRegularOldPrice,
    this.stockItem,
    this.stockStatus
  });

  @JsonKey(name: 'website_ids')
  List<int>? websiteIds;
  @JsonKey(name: 'category_links')
  List<CategoryLink>? categoryLinks;
  @JsonKey(name: 'configurable_product_links')
  List<int>? configurableProductLinks;
  @JsonKey(name: 'configurable_product_options')
  List<ConfigurableProductOption>? configurableProductOptions;
  @JsonKey(name: 'converted_regular_price')
  String? convertedRegularPrice;
  @JsonKey(name: 'converted_regular_old_price')
  String? convertedRegularOldPrice;
  @JsonKey(name: 'stock_items')
  StockItem? stockItem;
  @JsonKey(name: 'stock_status')
  String? stockStatus;

  factory ExtensionAttributesProduct.fromJson(Map<String, dynamic> json) =>
      _$ExtensionAttributesProductFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionAttributesProductToJson(this);
}

@JsonSerializable()
class StockItem {
  StockItem({
    this.itemId,
    this.productId,
    this.stockId,
    this.qty,
    this.isInStock,
    this.isQtyDecimal,
    this.showDefaultNotificationMessage,
    this.useConfigMinQty,
    this.minQty,
    this.useConfigMinSaleQty,
    this.minSaleQty,
    this.useConfigMaxSaleQty,
    this.maxSaleQty,
    this.useConfigBackorders,
    this.backorders,
    this.useConfigNotifyStockQty,
    this.notifyStockQty,
    this.useConfigQtyIncrements,
    this.qtyIncrements,
    this.useConfigEnableQtyInc,
    this.enableQtyIncrements,
    this.useConfigManageStock,
    this.manageStock,
    this.lowStockDate,
    this.isDecimalDivided,
    this.stockStatusChangedAuto,
  });

  @JsonKey(name: 'item_id')
  int? itemId;
  @JsonKey(name: 'product_id')
  int? productId;
  @JsonKey(name: 'stock_id')
  int? stockId;
  int? qty;
  @JsonKey(name: 'is_in_stock')
  bool? isInStock;
  @JsonKey(name: 'is_qty_decimal')
  bool? isQtyDecimal;
  @JsonKey(name: 'show_default_notification_message')
  bool? showDefaultNotificationMessage;
  @JsonKey(name: 'use_config_min_qty')
  bool? useConfigMinQty;
  @JsonKey(name: 'min_qty')
  int? minQty;
  @JsonKey(name: 'use_config_min_sale_qty')
  int? useConfigMinSaleQty;
  @JsonKey(name: 'min_sale_qty')
  int? minSaleQty;
  @JsonKey(name: 'use_config_max_sale_qty')
  bool? useConfigMaxSaleQty;
  @JsonKey(name: 'max_sale_qty')
  int? maxSaleQty;
  @JsonKey(name: 'use_config_backorders')
  bool? useConfigBackorders;
  int? backorders;
  @JsonKey(name: 'use_config_notify_stock_qty')
  bool? useConfigNotifyStockQty;
  @JsonKey(name: 'notify_stock_qty')
  int? notifyStockQty;
  @JsonKey(name: 'use_config_qty_increments')
  bool? useConfigQtyIncrements;
  @JsonKey(name: 'qty_increments')
  int? qtyIncrements;
  @JsonKey(name: 'use_config_enable_qty_inc')
  bool? useConfigEnableQtyInc;
  @JsonKey(name: 'enable_qty_increments')
  bool? enableQtyIncrements;
  @JsonKey(name: 'use_config_manage_stock')
  bool? useConfigManageStock;
  @JsonKey(name: 'manage_stock')
  bool? manageStock;
  @JsonKey(name: 'low_stock_date')
  dynamic lowStockDate;
  @JsonKey(name: 'is_decimal_divided')
  bool? isDecimalDivided;
  @JsonKey(name: 'stock_status_changed_auto')
  int? stockStatusChangedAuto;

  factory StockItem.fromJson(Map<String, dynamic> json) =>
      _$StockItemFromJson(json);

  Map<String, dynamic> toJson() => _$StockItemToJson(this);
}

@JsonSerializable()
class ConfigurableProductOption {
  ConfigurableProductOption({
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

  factory ConfigurableProductOption.fromJson(Map<String, dynamic> json) =>
      _$ConfigurableProductOptionFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurableProductOptionToJson(this);
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
class CategoryLink {
  CategoryLink({
    this.position,
    this.categoryId,
  });

  int? position;
  @JsonKey(name: 'category_id')
  String? categoryId;

  factory CategoryLink.fromJson(Map<String, dynamic> json) =>
      _$CategoryLinkFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryLinkToJson(this);
}

@JsonSerializable()
class SearchCriteria {
  SearchCriteria({
    this.filterGroups,
    this.requestName,
  });

  @JsonKey(name: 'filter_groups')
  List<FilterGroup>? filterGroups;
  @JsonKey(name: 'request_name')
  final String? requestName;

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

@JsonSerializable()
class MediaGalleryEntry {
  MediaGalleryEntry({
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
  dynamic position;
  dynamic disabled;
  List<String>? types;
  String? file;

  factory MediaGalleryEntry.fromJson(Map<String, dynamic> json) =>
      _$MediaGalleryEntryFromJson(json);

  Map<String, dynamic> toJson() => _$MediaGalleryEntryToJson(this);
}

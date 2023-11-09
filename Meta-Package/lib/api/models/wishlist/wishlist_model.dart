import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/utils/date_utils.dart';

part 'wishlist_model.g.dart';

@JsonSerializable()
class WishListProductModel {
  WishListProductModel({
    this.itemsCount,
    this.items,
  });

  @JsonKey(name: 'items_count')
  int? itemsCount;
  List<ItemProduct>? items;

  factory WishListProductModel.fromJson(Map<String, dynamic> json) =>
      _$WishListProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$WishListProductModelToJson(this);
}

@JsonSerializable()
class ItemProduct {
  ItemProduct({
    this.id,
    this.product,
  });

  int? id;
  WishlistItem? product;

  factory ItemProduct.fromJson(Map<String, dynamic> json) =>
      _$ItemProductFromJson(json);

  Map<String, dynamic> toJson() => _$ItemProductToJson(this);
}

@JsonSerializable()
class WishlistItem {
  WishlistItem(
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
  int? weight;
  List<dynamic>? options;
  @JsonKey(name: 'media_gallery_entries')
  List<MediaGalleryEntry>? mediaGalleryEntries;

  @JsonKey(ignore: true)
  TextEditingController? countController = TextEditingController(text: "1");

  @JsonKey(ignore: true)
  Rx<SizeModel>? selectSizeValue = SizeModel().obs;

  List<SizeModel>? sizeList = [];

  factory WishlistItem.fromJson(Map<String, dynamic> json) =>
      _$WishlistItemFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistItemToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'recommended_products_model.g.dart';

@JsonSerializable()
class RecommendedProductModel {
  RecommendedProductModel({
    this.productId,
    this.sku,
    this.typeId,
    this.name,
    this.productUrl,
    this.imageUrl,
    this.brandName,
    this.price,
    this.status,
    this.message,
    this.storeId,
  });

  @JsonKey(name: 'product_id')
  String? productId;
  String? sku;
  @JsonKey(name: 'type_id')
  String? typeId;
  String? name;
  @JsonKey(name: 'product_url')
  String? productUrl;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'brand_name')
  String? brandName;
  String? price;
  String? status;
  String? message;
  @JsonKey(name: 'store_id')
  int? storeId;

  factory RecommendedProductModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendedProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedProductModelToJson(this);
}

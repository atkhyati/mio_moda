import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_modal.g.dart';

@JsonSerializable()
class AddToCartModal {
  AddToCartModal({
    this.itemId,
    this.sku,
    this.qty,
    this.name,
    this.price,
    this.productType,
    this.quoteId,
  });

  @JsonKey(name: 'item_id')
  int? itemId;
  String? sku;
  int? qty;
  String? name;
  double? price;
  @JsonKey(name: 'product_type')
  String? productType;
  @JsonKey(name: 'quote_id')
  String? quoteId;

  factory AddToCartModal.fromJson(Map<String, dynamic> json) =>
      _$AddToCartModalFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartModalToJson(this);
}

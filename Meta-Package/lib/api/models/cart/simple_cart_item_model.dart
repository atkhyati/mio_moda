import 'package:json_annotation/json_annotation.dart';

part 'simple_cart_item_model.g.dart';

@JsonSerializable()
class SimpleCartItemModel {
  SimpleCartItemModel(this.sku, this.qty, this.quoteId);

  final String sku;
  final int qty;
  @JsonKey(name: 'quote_id')
  final String quoteId;

  factory SimpleCartItemModel.fromJson(Map<String, dynamic> json) =>
      _$SimpleCartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleCartItemModelToJson(this);
}

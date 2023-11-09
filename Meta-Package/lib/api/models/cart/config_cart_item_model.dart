import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';

import 'package:meta_package/constants/key_value_constants.dart';

part 'config_cart_item_model.g.dart';

@JsonSerializable()
class ConfigurableCartItemModel {
  ConfigurableCartItemModel(
      this.sku, this.qty, this.quoteId, this.productOption);

  final String sku;
  final int qty;
  @JsonKey(name: 'product_type')
  final String productType = kCartItemModelConfigurableProductTypeKey;

  @JsonKey(name: 'quote_id')
  final String quoteId;
  @JsonKey(name: 'product_option')
  final ProductOption productOption;

  factory ConfigurableCartItemModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigurableCartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurableCartItemModelToJson(this);
}

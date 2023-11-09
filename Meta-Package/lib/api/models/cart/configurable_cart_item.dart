import 'package:json_annotation/json_annotation.dart';

import 'config_cart_item_model.dart';

part 'configurable_cart_item.g.dart';

@JsonSerializable()
class ConfigurableCartItem {
  ConfigurableCartItem(this.cartItem);

  final ConfigurableCartItemModel cartItem;

  factory ConfigurableCartItem.fromJson(Map<String, dynamic> json) =>
      _$ConfigurableCartItemFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurableCartItemToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/api/models/cart/simple_cart_item_model.dart';

part 'simple_cart_item.g.dart';

@JsonSerializable()
class SimpleCartItem {
  SimpleCartItem(this.cartItem);

  final SimpleCartItemModel cartItem;

  factory SimpleCartItem.fromJson(Map<String, dynamic> json) =>
      _$SimpleCartItemFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleCartItemToJson(this);
}

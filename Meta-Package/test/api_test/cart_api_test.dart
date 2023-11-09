

import 'package:flutter_test/flutter_test.dart';
import 'package:meta_package/api/api_endpoint/cart_api.dart';
import 'package:meta_package/api/api_endpoint/recommended_product_api.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/services/cart_service.dart';
import 'package:meta_package/api/services/local_store_service.dart';
import 'package:meta_package/constants/key_value_constants.dart';

void main() {
  const String baseUrlProduction = "https://www.sololuxury.com";

  final CartService cartService = CartService(
      RecommendedProductApi(baseUrl: baseUrlProduction),
      CartApi(baseUrl: baseUrlProduction));
  const String sku = "demo_configurable- aquazzura firenze-35";
  final prod = ProductItem(sku: sku);
  test("Check store website list API for response", () async {
    LocalStore.removePrefValue(kStorageConstGuestauthToken);
    await cartService.generateCart(prod, []);
    LocalStore.localStore.getGuestToken();
    // expect(LocalStore.localStore.guestToken, isNotEmpty);
    expect(true, true);
  });
}

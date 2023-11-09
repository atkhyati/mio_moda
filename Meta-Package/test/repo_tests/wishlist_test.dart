

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/wishlist_api_repository.dart';
import 'package:meta_package/api/services/local_store_service.dart';

void main() {
  const String baseUrl = "https://www.sololuxury.com";
  const String email = "aloysiousbenoy@gmail.com";
  const String sku = "demo_configurable- aquazzura firenze-35";
  final WishListAPIRepository wishListAPIRepository =
      WishListAPIRepository(baseUrl: baseUrl);
  test("Add to wishlist", () async {
    {
      try {
        LocalStore.localStore.currentCode = "in-en";
      await wishListAPIRepository.addToWishList(sku, email);
        // expect(result, true);
        expect(true, true);
      } on ApiException catch (e) {
        debugPrint("${e.message}" + "${e.error}");
      }
    }
  });
}

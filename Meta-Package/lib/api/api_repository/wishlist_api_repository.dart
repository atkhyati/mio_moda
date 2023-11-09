import 'dart:convert';

import 'package:meta_package/api/api_endpoint/wishlist_api.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';

class WishListAPIRepository {
  String baseUrl;

  WishListAPIRepository({required this.baseUrl});

  late WishListApi baseApi = WishListApi(baseUrl: baseUrl);

  Future<WishListProductModel> getWishListApiResponse(String token) async {
    return await baseApi.getWishListResponseProvider();
  }

  Future<bool> deleteWishList(String getId, String email) async {
    return await baseApi.deleteWishListProvider(
        body: json.encode(
          {"email": email},
        ),
        sku: getId);
  }

  Future<bool> addToWishList(String getId, String email) async {
    return await baseApi.putAddToWishListProductProvider(
        body: json.encode(
          {"email": email},
        ),
        sku: getId);
  }
}

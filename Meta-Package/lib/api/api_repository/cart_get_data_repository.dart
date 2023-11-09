import 'package:meta_package/api/api_endpoint/cart_api.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';
import 'package:meta_package/api/models/cart/donation_modal.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart';
import 'package:meta_package/api/services/cart_service.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class CartGetDataAPIRepository {
  String baseUrl;

  CartGetDataAPIRepository({
    required this.baseUrl,
    required this.cartService,
  });

  late CartApi baseApi = CartApi(baseUrl: baseUrl);

  final CartService cartService;

  Future<CartModel> getCartGetDataApiResponse(
      {required String currentCurrency}) async {
    return await cartService.getCart(currentCurrency);
  }

  Future<CouponCode> getCoupons() async {
    return await baseApi.getCouponCodeAPIResponse();
  }

  Future<String> addCouponsToCart(String couponID) async {
    LocalStore.localStore.checkGuest();
    return await baseApi.addCouponCodeToCartResponse(couponID);
  }

  Future<Totals> getTotals() async {
    LocalStore.localStore.checkGuest();
    return await baseApi.getTotalsAPIResponse();
  }

  Future<String> deleteAppliedCoupons() async {
    LocalStore.localStore.checkGuest();
    return await baseApi.deleteAppliedCouponsList();
  }

  Future<String> deleteCartCartQTYDataApiResponse(
      String itemId, String apiEndPoint) async {
    return await baseApi.deleteCartQtyDataResponseProvider(
        endPoint: apiEndPoint + itemId);
  }

  Future<String> deleteCartProductDataApiResponse(
      String itemId, String apiEndPoint) async {
    return await baseApi.deleteCartProductDataResponseProvider(
        endPoint: apiEndPoint + itemId);
  }

  Future<DonationModal> getDonationListData() async {
    return await baseApi.donationGetDataResponseProvider();
  }
}

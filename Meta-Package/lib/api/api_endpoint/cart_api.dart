import 'dart:async';

import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';
import 'package:meta_package/api/models/cart/donation_modal.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/api/models/checkout_order/shipping_information_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class CartApi<T> extends CartApiInterface {
  static const String couponsCode =
      "/rest/V1/coupons/search?searchCriteria[filter_groups][0][filters][0][field]=type&searchCriteria[filter_groups][0][filters][0][value]=0&searchCriteria[filter_groups][0][filters][0][condition_type]=equal";
  static const String addGuestCouponsCodeToCart = "/V1/guest-carts/";
  static const String addCouponsCodeToCart = "/V1/carts/mine/coupons/";
  static const String cartGetData = "/V1/carts/mine";
  static const String guestCreateCart = "/V1/guest-carts";
  static const String getTotals = "/V1/carts/mine/totals";
  static const String guestGetTotals = "/V1/guest-carts/";
  static const String deleteGuestCoupons = "/V1/guest-carts/";
  static const String deleteCoupons = "/V1/carts/mine/coupons";
  static const String deleteCartProductData = "/V1/carts/mine/items/";
  static const String donationGetData = "/rest/V1/donation/list";

  String baseUrl;
  late DioClient client;

  CartApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<CartModel> cartUserGetDataProvider(
      {required String currentCurrency}) async {
    var endPoint = LocalStore.getUrlWithCode() + CartApi.cartGetData;
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET",
          baseUrl +
              (currentCurrency != ""
                  ? '$endPoint?currency=$currentCurrency'
                  : endPoint),
          token: true);

      return response.one((json) => CartModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<CartModel> cartGuestGetDataProvider(
      {required String currentCurrency}) async {
    var endPoint =
        "${LocalStore.getUrlWithCode() + CartApi.guestCreateCart}/${LocalStore.localStore.guestToken}";
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET",
          baseUrl +
              (currentCurrency != ""
                  ? '$endPoint?currency=$currentCurrency'
                  : endPoint),
          token: true);

      return response.one((json) => CartModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<CouponCode> getCouponCodeAPIResponse() async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET", baseUrl + couponsCode);

      return response.one((json) => CouponCode.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<Totals> getTotalsAPIResponse() async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET",
          baseUrl +
              LocalStore.getUrlWithCode() +
              (LocalStore.localStore.isGuest
                  ? '$guestGetTotals${LocalStore.localStore.guestToken}/totals'
                  : getTotals),
          token: LocalStore.localStore.customerToken.isNotEmpty);
      return response.one((json) => Totals.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<String> addCouponCodeToCartResponse(
    String couponId,
  ) async {
    try {
      final response = await client.getClient<String>(
          "PUT",
          baseUrl +
              LocalStore.getUrlWithCode() +
              (LocalStore.localStore.isGuest
                  ? '$addGuestCouponsCodeToCart${LocalStore.localStore.guestToken}/coupons/'
                  : addCouponsCodeToCart) +
              couponId,
          token: LocalStore.localStore.customerToken.isNotEmpty);
      return response.data!;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<String> deleteAppliedCouponsList() async {
    try {
      final response = await client.getClient<String>(
        "DELETE",
        baseUrl +
            LocalStore.getUrlWithCode() +
            (LocalStore.localStore.isGuest
                ? '$deleteGuestCoupons${LocalStore.localStore.guestToken}/coupons'
                : deleteCoupons),
        token: true,
      );
      return response.data ?? '';
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  // todo confirm guest token in header
  @override
  Future<String> deleteCartQtyDataResponseProvider(
      {required String endPoint}) async {
    try {
      final response = await client.getClient<String>(
        "DELETE",
        baseUrl + endPoint,
        token: LocalStore.localStore.customerToken.isNotEmpty,
      );
      return response.data ?? '';
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<DonationModal> donationGetDataResponseProvider() async {
    try {
      final response = await client.getClient<List<dynamic>>(
          "GET", baseUrl + donationGetData,
          token: false);
      return response.many((json) => DonationModal.fromJson(json)).first;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<String> deleteCartProductDataResponseProvider(
      {required String endPoint}) async {
    try {
      final response = await client.getClient<String>(
        "DELETE",
        baseUrl + endPoint,
        token: LocalStore.localStore.customerToken.isNotEmpty,
      );
      return response.data ?? '';
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class CartApiInterface<T> {
  Future<T?> cartGuestGetDataProvider({required String currentCurrency});

  Future<T?> cartUserGetDataProvider({required String currentCurrency});

  Future<T?> getCouponCodeAPIResponse();

  Future<T?> getTotalsAPIResponse();

  Future<T?> addCouponCodeToCartResponse(String couponId);

  Future<T?> deleteAppliedCouponsList();

  Future<T?> deleteCartQtyDataResponseProvider({required String endPoint});

  Future<T?> donationGetDataResponseProvider();
  Future<T?> deleteCartProductDataResponseProvider({required String endPoint});
}

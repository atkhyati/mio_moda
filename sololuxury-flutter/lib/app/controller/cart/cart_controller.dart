import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_endpoint/cart_api.dart';
import 'package:meta_package/api/api_endpoint/recommended_product_api.dart';
import 'package:meta_package/api/models/cart/cart_model.dart' as cart;
import 'package:meta_package/api/models/cart/donation_modal.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/services/cart_service.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/cart/widget/cart_coupon_applied_dialog.dart';

class CartController extends GetxController {
  Rx<cart.CartModel> cartModel = cart.CartModel().obs;
  final CartGetDataAPIRepository cartGetDataAPIRepository =
      CartGetDataAPIRepository(
          baseUrl: AppConstants.apiEndPointLogin,
          cartService: CartService(
              RecommendedProductApi(baseUrl: AppConstants.apiEndPointLogin),
              CartApi(
                baseUrl: AppConstants.apiEndPointLogin,
              )));
  final RecommendedProductsAPIRepository recommendedProductsAPIRepository =
      RecommendedProductsAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final WishListAPIRepository wishListAPIRepository =
      WishListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  CartController();

  RxBool isLoading = false.obs;
  RxBool isMainLoading = false.obs;
  RxBool showAppliedCoupons = false.obs;
  Rx<ProductItem> product = ProductItem().obs;
  RxString getCartToken = "".obs;
  Rx<Totals> getTotalsData = Totals().obs;

  MyAccountDetails userDetail = MyAccountDetails();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController promoCodeController = TextEditingController();

  Rx<CouponCode> couponCode = CouponCode().obs;
  bool isSubmitButtonPressed = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<DonationItems> donationList = <DonationItems>[].obs;

  @override
  void onInit() async {
    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    getGenerateCart();
    getDonationData();
    getCoupons();
    super.onInit();
  }

  ///
  void refreshCart() async {
    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    getGenerateCart();
    getDonationData();
    getCoupons();
  }

  Future<void> getCoupons() async {
    try {
      CouponCode data = await cartGetDataAPIRepository.getCoupons();
      couponCode.value = data;
      couponCode.value.items
          ?.removeWhere((element) => (element.code?.isEmpty ?? true));
      debugPrint("getCoupons List Is cart ${couponCode.value}");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("Error $e");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  Future<void> addCouponsToCartForField() async {
    isLoading.value = true;
    try {
      String data = await cartGetDataAPIRepository
          .addCouponsToCart(promoCodeController.text);
      if (data.isNotEmpty == true) {
        debugPrint("getCoupons List Is addCouponsToCart $data");
        await getTotals(showDialog: true);
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("Error $e");
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteAppliedCoupon() async {
    isLoading.value = true;
    try {
      String data = await cartGetDataAPIRepository.deleteAppliedCoupons();
      await getTotals();
      if (data.isNotEmpty == true) {
        showAppliedCoupons.value = false;
        promoCodeController.text = '';
        Validators.apiResponseMessage(
          // body: data,
          message: LanguageConstants.couponRemoved.tr,
          color: Colors.green,
        );
      } else {
        showAppliedCoupons.value = false;
        // appliedCouponName.value = [];
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("Error $e");
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getTotals({
    bool showDialog = false,
  }) async {
    try {
      isLoading.value = true;
      Totals data = await cartGetDataAPIRepository.getTotals();
      getTotalsData.value = data;
      if (getTotalsData.value.getDiscount() != null) {
        showAppliedCoupons.value = true;
        promoCodeController.text = (getTotalsData.value.getDiscountName() ?? '')
            .split('(')
            .last
            .split(')')
            .first;
      } else {
        showAppliedCoupons.value = false;
        promoCodeController.clear();
      }
      if (showDialog) {
        showAppliedCoupons.value = true;
        showDialogForSuccessfullyAppliedCoupons(
          promoCodeController.text,
          data.discountAmount?.abs().toString() ?? '0',
        );
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("Error $e");
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  void showDialogForSuccessfullyAppliedCoupons(
      String couponCode, String savedValue) {
    showDialog<dynamic>(
      context: Get.context!,
      builder: (context) {
        return CartCouponSuccessfullyApplied(
          couponCode: couponCode,
          savedValue: savedValue,
        );
      },
    );
  }

  void clickChatEvent({String? name, String? email}) {
    Livechat.beginChat(
        AppConstants.licenceId,
        '1',
        name ?? userDetail.firstname.toString().trim(),
        email ?? userDetail.email.toString().trim());
  }

  bool checkItemSkuEmptyData(ProductItem item) {
    return cartModel.value.items == null ||
        cartModel.value.items!
            .where((element) =>
                element.sku.toString().split('-').first ==
                item.sku.toString().split('-').first)
            .isEmpty;
  }

  Future<void> getDonationData() async {
    try {
      donationList.value = [];
      DonationModal data = await cartGetDataAPIRepository.getDonationListData();
      donationList.value = data.items ?? [];
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("Error $e");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> fetchCart() async {
    try {
      cartModel.value =
          await cartGetDataAPIRepository.getCartGetDataApiResponse(
              currentCurrency: LocalStore.localStore.currentCurrency);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("Error $e");
      ExceptionHandler.appCatchError(error: e);
    }
    await getTotals();
  }

  Future<void> getGenerateCart({bool? isShowLoading = true}) async {
    if (isShowLoading == true) {
      isMainLoading.value = true;
    }
    debugPrint("User Token Is ${localStore.customerToken}");

    try {
      if (localStore.customerToken.toString() != "") {
        String data =
            await recommendedProductsAPIRepository.getGenerateCartApiResponse();

        if (data.isNotEmpty == true) {
          getCartToken.value = data;
        }
        if (getCartToken.value.isNotEmpty) {
          await getFaqContent(1);
        }
      } else {
        localStore.getGuestToken();
        log(localStore.guestToken, name: "localStore.guestToken");

        if (localStore.guestToken.isNotEmpty) {
          await getFaqContent(2);
        } else {
          debugPrint("Guest");
          String data = await recommendedProductsAPIRepository
              .getGenerateCartApiResponse();
          getCartToken.value = data.replaceAll('"', '');
          await LocalStore.setPrefStringValue(
              kStorageConstGuestauthToken, getCartToken.value.toString());
          localStore.getGuestToken();
          if (getCartToken.value.isNotEmpty) {
            await getFaqContent(2);
          }
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } finally {
      isMainLoading.value = false;
      if (isShowLoading == false) {
        isLoading.value = false;
      }
    }
  }

  String getProductImage(int index) {
    if (cartModel.value.items?[index].extensionAttributesImage?.productImage !=
        null) {
      return cartModel
              .value.items?[index].extensionAttributesImage?.productImage ??
          '';
    } else {
      return "";
    }
  }

  Future<void> postAddToWishlistData(int index) async {
    try {
      isLoading.value = true;
      String sku = cartModel.value.items?[index].sku ?? '';

      debugPrint("Here Customer Post");
      bool addToWishData = await wishListAPIRepository.addToWishList(
          sku, localStore.userDetail.email ?? '');
      debugPrint("Add To Cart Data $addToWishData");
      if (addToWishData) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
              content: CommonTextPoppins(
                  LanguageConstants.productAddedTowishList.tr)),
        );
        if (localStore.customerToken.toString() != "") {
          await deleteCartProductContent(index, 1);
        } else {
          await deleteCartProductContent(index, 2);
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getFaqContent(int getValue) async {
    cart.CartModel cartData;
    try {
      if (getValue == 1) {
        cartData = await cartGetDataAPIRepository.getCartGetDataApiResponse(
            currentCurrency: localStore.currentCurrency);
      } else {
        cartData = await cartGetDataAPIRepository.getCartGetDataApiResponse(
            currentCurrency: localStore.currentCurrency);
      }
      cartModel.value = cartData;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("Error $e");
      ExceptionHandler.appCatchError(error: e);
    }
    await getTotals();
  }

  Future<void> deleteCartProductContent(int index, int getValue) async {
    try {
      isLoading.value = true;
      String? deleteProductId =
          cartModel.value.items?[index].itemId?.toString();
      if (deleteProductId != null) {
        if (getValue == 1) {
          await cartGetDataAPIRepository.deleteCartCartQTYDataApiResponse(
              deleteProductId,
              AppConstants.getUrlWithCode() + CartApi.deleteCartProductData);
        } else {
          await cartGetDataAPIRepository.deleteCartCartQTYDataApiResponse(
              deleteProductId,
              "${AppConstants.getUrlWithCode() + CartApi.guestCreateCart}/${localStore.guestToken.toString()}/items/");
        }
      }
      await getFaqContent(getValue);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  //Add TO Cart Api Calling
  Future<void> increaseProductQty(int index) async {
    try {
      isLoading.value = true;
      cart.Items? cartItem = cartModel.value.items?[index];
      String sku = cartItem?.sku ?? '';
      String quoteId = cartItem?.quoteId ?? '';
      int itemId = cartItem?.itemId ?? 0;
      int qty = (cartItem?.qty ?? 0) + 1;
      Map<String, dynamic> passedAddToCart = {
        "cartItem": {
          "sku": sku,
          "qty": "$qty",
          "quote_id": localStore.guestToken.toString()
        }
      };
      Map<String, dynamic> passedAddToCart2 = {
        "cartItem": {"sku": sku, "qty": "$qty", "quote_id": quoteId}
      };
      cart.Items addToCartData;
      if (localStore.customerToken.toString() != "") {
        debugPrint("Customer Here Post");
        addToCartData = await recommendedProductsAPIRepository.updateProductQty(
            passedAddToCart2, itemId.toString());
      } else {
        debugPrint("Guest Here Post");
        addToCartData =
            await recommendedProductsAPIRepository.guestUpdateProductQty(
          passedAddToCart,
          itemId.toString(),
        );
      }
      getGenerateCart(isShowLoading: false);
      debugPrint("Add To Cart Data $addToCartData");
      cartModel.value.items?[index] = addToCartData;
    } on ApiException catch (e) {
      isLoading.value = false;
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {}
  }

  Future<void> postRemoveFromCartData(int index) async {
    try {
      isLoading.value = true;
      cart.Items? cartItem = cartModel.value.items?[index];
      String sku = cartItem?.sku ?? '';
      String quoteId = cartItem?.quoteId ?? '';
      int itemId = cartItem?.itemId ?? 0;
      int qty = (cartItem?.qty ?? 0) - 1;
      Map<String, dynamic> passedAddToCart = {
        "cartItem": {
          "sku": sku,
          "qty": "$qty",
          "quote_id": localStore.guestToken.toString()
        }
      };
      Map<String, dynamic> passedAddToCart2 = {
        "cartItem": {"sku": sku, "qty": "$qty", "quote_id": quoteId}
      };
      cart.Items addToCartData;
      if (localStore.customerToken.toString() != "") {
        debugPrint("Customer Here Post");
        addToCartData = await recommendedProductsAPIRepository.updateProductQty(
            passedAddToCart2, itemId.toString());
      } else {
        debugPrint("Guest Here Post");
        addToCartData = await recommendedProductsAPIRepository
            .guestUpdateProductQty(passedAddToCart, itemId.toString());
      }
      getGenerateCart(isShowLoading: false);
      debugPrint("Remove To Cart Data $addToCartData");
      cartModel.value.items?[index] = addToCartData;
    } on ApiException catch (e) {
      isLoading.value = false;
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    }
  }

  String firstCapitalize(String name) {
    if (name != "") {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    } else {
      return "";
    }
  }

  String getProductName(int index) {
    return firstCapitalize(
        cartModel.value.items?[index].name?.toString() ?? '');
  }

  Future<void> deleteCartProduct(int index, int getValue) async {
    try {
      isLoading.value = true;
      String? deleteProductId =
          cartModel.value.items?[index].itemId?.toString();
      if (deleteProductId != null) {
        if (getValue == 1) {
          await cartGetDataAPIRepository.deleteCartProductDataApiResponse(
              deleteProductId,
              AppConstants.getUrlWithCode() + CartApi.deleteCartProductData);
        } else {
          await cartGetDataAPIRepository.deleteCartProductDataApiResponse(
              deleteProductId,
              "${AppConstants.getUrlWithCode() + CartApi.guestCreateCart}/${localStore.guestToken.toString()}/items/");
        }
      }
      await getFaqContent(getValue);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}

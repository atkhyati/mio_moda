import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:meta_package/api/models/country/local_store_language_currency/local_store_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:meta_package/constants/key_value_constants.dart';

class LocalStore {
  static final LocalStore _singleton = LocalStore._internal();

  factory LocalStore() {
    return _singleton;
  }

  LocalStore._internal();

  String currentCode = "";
  String currentCurrency = "";
  String customerToken = "";
  String websiteId = "";
  String guestToken = "";
  bool isGuest = false;
  String storeGroupId = "";
  String defaultGroupId = "";
  String name = "";

  String changeCurrency = "";
  String changeCurrencyCode = "";

  String deviceInfo = "";
  String packageInfo = "";

  static List<ProductItem> wishListData = <ProductItem>[];

  MyAccountDetails userDetail = MyAccountDetails();

  Future<bool> getStore() async {
    String data = LocalStore.getPrefStringValue(kLocalStoreModelKey);
    if (data.isNotEmpty) {
      LocalStoreModel localStoreModel =
          LocalStoreModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
      currentCode = localStoreModel.currentCode ?? '';
      currentCurrency = localStoreModel.currentCurrency ?? '';
      name = localStoreModel.name ?? '';
      websiteId =
          localStoreModel.getStore(currentCode)?.websiteId.toString() ?? '';
      storeGroupId =
          localStoreModel.getStore(currentCode)?.storeGroupId.toString() ?? '';
      defaultGroupId = storeGroupId;
      // TODO implement this in the
      // Get.updateLocale(Locale(localStoreModel.currentCode!.split("-")[1]));
      return true;
    }
    return false;
  }

  Future<bool> getToken() async {
    String data = LocalStore.getPrefStringValue(kStorageConstAuthToken);
    if (data.isNotEmpty) {
      customerToken = "Bearer $data";
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getUserDetail() async {
    String data = LocalStore.getPrefStringValue(kStorageConstUserDetail);
    if (data.isNotEmpty) {
      userDetail =
          MyAccountDetails.fromJson(jsonDecode(data) as Map<String, dynamic>);
      return true;
    } else {
      return false;
    }
  }

  bool getGuestToken() {
    String data = LocalStore.getPrefStringValue(kStorageConstGuestauthToken);
    if (data.isNotEmpty) {
      guestToken = data;
      return true;
    } else {
      return false;
    }
  }

  Future<WishListProductModel> getWishListData() async {
    String data = LocalStore.getPrefStringValue(kStorageConstWishListData);
    WishListProductModel jsonData = WishListProductModel();
    if (data.isNotEmpty) {
      jsonData = WishListProductModel.fromJson(
          jsonDecode(data) as Map<String, dynamic>);
    }
    return jsonData;
  }

  String getRegularPriceWithCurrency(
      String price, String regularPrice, int qty) {
    var subtotal = (qty * num.parse(price)).toString();
    if (currentCurrency == 'EUR') {
      return "€$subtotal";
    }
    return subtotal;
  }

  String getPriceWithSymbol(String price) {
    if (currentCurrency == 'EUR') {
      return "€$price";
    }
    return "$currentCurrency $price";
  }

  Future<bool> getDeviceInfo() async {
    String data = LocalStore.getPrefStringValue(kStorageConstDeviceInfo);
    if (data.isNotEmpty) {
      deviceInfo = data;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getPackageInfo() async {
    String data = LocalStore.getPrefStringValue(kStorageConstPackageInfo);
    if (data.isNotEmpty) {
      packageInfo = data;
      return true;
    } else {
      return false;
    }
  }

  String setItemPriceWithSymbol(String price, String basePriceInclTax) {
    if (currentCurrency == 'EUR') {
      return "€$basePriceInclTax";
    }
    return "$currentCurrency $price";
  }

  void checkGuest() {
    if (customerToken.isNotEmpty) {
      isGuest = false;
    } else {
      isGuest = true;
    }
  }

  static String getPrefStringValue(String key) {
    return GetStorage().read(key) ?? "";
  }

  static Future<void> setPrefStringValue(String key, value) async {
    await GetStorage().write(key, value);
  }

  static Future<void> removePrefValue(String key) async {
    await GetStorage().remove(key);
  }

  static String getSavedGuestAddress() {
    return GetStorage().read(kLocalStoreGuesAddressKey) ?? "";
  }

  static Future<void> setSavedGuestAddress(String value) async {
    await GetStorage().write(kLocalStoreGuesAddressKey, value);
  }

  static LocalStore get localStore => _singleton;

  static String getUrlWithCode() {
    return localStore.currentCode.isEmpty
        ? "/rest"
        : "/${localStore.currentCode}/rest";
  }

  static String getUrlWithOrdersCode() {
    return localStore.currentCode.isEmpty
        ? "/rest/default"
        : "/${localStore.currentCode}/rest/${localStore.currentCode}";
  }
}

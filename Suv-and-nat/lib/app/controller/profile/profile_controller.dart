import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/const/constants.dart';
import 'package:meta_package/api/models/country/local_store_language_currency/local_store_model.dart';

class ProfileController extends GetxController {
  RxString countryCurrency = "".obs;

  @override
  void onInit() {
    super.onInit();
    debugPrint("ProfileController -> $runtimeType");
    getCountryData();
  }

  Future<void> getCountryData() async {
    String data = LocalStore.getPrefStringValue(kLocalStoreModelKey);
    if (data.isNotEmpty) {
      LocalStoreModel localStoreModel =
          LocalStoreModel.fromJson(jsonDecode(data) as Map<String, dynamic>);
      debugPrint("Get LocalMap -> ${jsonEncode(localStoreModel)}");
      countryCurrency.value =
          "${localStoreModel.name} (${localStoreModel.currentCurrency})";
      update();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/local_store_language_currency/local_store_model.dart';
import 'package:meta_package/api/models/country/store_config_model.dart';
import 'package:meta_package/api/models/country/store_websites_model.dart';

class CountryHelper {
  CountryHelper();

  Map<String, dynamic>? formMapData(
      StoreWebSitesModel item, List<StoreConfigModel> storeConfigsList) {
    List<dynamic> languageList = [];
    List<dynamic> currencyList = [];
    List<dynamic> storeViewModelList = [];
    List<dynamic> storeLanguageCurrencyModelList = [];

    Map<String, dynamic>? mapData = {
      "id": item.websiteId,
      "name": item.name,
    };
    List<StoreListModel>? storeList = item.storeList;
    if (storeList?.isNotEmpty == true) {
      for (int i = 0; i < storeList!.length; i++) {
        StoreListModel store = storeList[i];

        // langSelected.value = store.name!;
        languageList.add(store.name!);
        if (mapData["current_code"] == null) {
          mapData["current_code"] = store.code;
          // country!.value = store.code.toString().split("-").first.toUpperCase();
          // debugPrint(country!.value);
        }
        storeViewModelList.add(LocalStoreViewModel(
                name: store.name, code: store.code, websiteId: item.websiteId)
            .toJson());

      }
    }

    for (int j = 0; j < storeConfigsList.length; j++) {
      if (item.websiteId == storeConfigsList[j].websiteId) {
        // currencySelected.value =
        //     storeConfigsList[j].defaultDisplayCurrencyCode!;
        if (mapData["current_currency"] == null) {
          mapData["current_currency"] = storeConfigsList[j].baseCurrencyCode;
        }
        LocalStoreLanguageCurrencyModel storeModel =
            LocalStoreLanguageCurrencyModel(
                id: storeConfigsList[j].id,
                locale: storeConfigsList[j].locale,
                baseCurrencyCode: storeConfigsList[j].baseCurrencyCode,
                defaultDisplayCurrencyCode:
                    storeConfigsList[j].defaultDisplayCurrencyCode);
        storeLanguageCurrencyModelList.add(storeModel.toJson());
        if(storeConfigsList[j].defaultDisplayCurrencyCode!=storeConfigsList[j].baseCurrencyCode && currencyList.isNotEmpty) {
          currencyList.add(storeModel.defaultDisplayCurrencyCode!);
        }
        debugPrint("currencyList -> ${currencyList.length}");
      }


    }
    if(currencyList.isEmpty)
      {
        if(item.defaultDisplayCurrencyCode!="EUR")
          {
            currencyList.add("EUR");
          }
        currencyList.add(item.defaultDisplayCurrencyCode!);
      }

    mapData.addAll({
      "language_list": languageList,
      "currency_list": currencyList,
      "store_view_model": storeViewModelList,
      "store_language_currency_model": (storeLanguageCurrencyModelList)
    });
    return mapData;
  }

  showSelectionDialog({Widget? child, Color color = Colors.transparent}) {
    Future.delayed(const Duration(milliseconds: 10), () async {
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(10),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      color: color,
                      padding: const EdgeInsets.all(20.0),
                      child: child),
                ],
              ));
        },
      );
    });
  }
}

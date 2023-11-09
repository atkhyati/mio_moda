import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/store_websites_model.dart';
import 'package:veralusso/app/controller/cart/cart_controller.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/controller/my_account/my_account_controller.dart';
import 'package:veralusso/app/core/const/storage_constant.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/data/local_data/local_store.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogContent extends GetView<CountryController> {
  final StoreWebSitesModel item;
  DialogContent(this.item, {Key? key}) : super(key: key);
  final MyAccountController myAccountController =
      Get.find<MyAccountController>();
  final CartController cartController = Get.find<CartController>();

  @override
  final CountryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextMontserrat(
            LanguageConstants.selectLangCurrText.tr,
            fontSize: 15.sp,
            textAlign: TextAlign.center,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 15.0),
          CommonTextMontserrat(
            LanguageConstants.selectLangCurrDescText.tr,
            fontSize: 13.sp,
            textAlign: TextAlign.center,
            color: Colors.black,
            height: 1.5,
          ),
          const SizedBox(height: 15.0),
          Container(
            width: Get.width,
            height: 20.0,
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextMontserrat(
                  "${LanguageConstants.languageText.tr} : ",
                  fontSize: 13.sp,
                  textAlign: TextAlign.center,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 30.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.rxLanguageList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.isChangeLanguage.value = true;
                            controller.languageSelectIndex.value = index;
                            controller.setLanguageSelected(
                                controller.rxLanguageList[index].toString());
                          },
                          child: Obx(() => CommonTextMontserrat(
                                controller.rxLanguageList.length - 1 != index
                                    ? "${controller.rxLanguageList[index].toString().toUpperCase()} / "
                                    : controller.rxLanguageList[index]
                                        .toString()
                                        .toUpperCase(),
                                fontSize: 13.sp,
                                textAlign: TextAlign.center,
                                color: controller.languageSelectIndex.value ==
                                        index
                                    ? Colors.black
                                    : grey,
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            width: Get.width,
            height: 20.0,
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextMontserrat(
                  "${LanguageConstants.currencyText.tr} : ",
                  fontSize: 13.sp,
                  textAlign: TextAlign.center,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 30.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.rxCurrencyList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.isChangeCurrency.value = true;
                            controller.currencySelectIndex.value = index;
                            controller.setCurrencySelected(
                                controller.rxCurrencyList[index].toString());
                          },
                          child: Obx(() => CommonTextMontserrat(
                                controller.rxCurrencyList.length - 1 != index
                                    ? "${controller.rxCurrencyList[index].toString().toUpperCase()} / "
                                    : controller.rxCurrencyList[index]
                                        .toString()
                                        .toUpperCase(),
                                fontSize: 13.sp,
                                textAlign: TextAlign.center,
                                color: controller.currencySelectIndex.value ==
                                        index
                                    ? Colors.black
                                    : grey,
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: CommonThemeButton(
                  onTap: () async {
                    if (!controller.isChangeLanguage.value &&
                        controller.rxLanguageList.isNotEmpty) {
                      controller.langSelected.value =
                          controller.rxLanguageList.first.toString();
                    }
                    if (!controller.isChangeCurrency.value &&
                        controller.rxCurrencyList.isNotEmpty) {
                      controller.currencySelected.value =
                          controller.rxCurrencyList.first.toString();
                    }
                    await controller.changeName(item.name);
                    await controller.changeLanguage();
                    await controller.changeCurrency();
                    await controller.getCurrentLanguageCurrency();
                    if (myAccountController.countryCurrency.value !=
                        "${controller.localStoreModel?.name} (${controller.localStoreModel?.currentCurrency})") {
                      await LocalStore.removePrefValue(kStorageConstAuthToken);
                      await LocalStore.removePrefValue(
                          localStore.customerToken);
                      await LocalStore.removePrefValue(kStorageConstUserDetail);
                      localStore.customerToken = "";
                      LocalStore().checkGuest();
                      cartController.getGenerateCart();
                    }
                    if (controller.localStoreModel?.currentCurrency != null) {
                      myAccountController.countryCurrency.value =
                          "${controller.localStoreModel?.name} (${controller.localStoreModel?.currentCurrency})";
                    } else {
                      controller.localStoreModel?.currentCurrency = controller
                          .localStoreModel?.currencyList?.first
                          .toString();
                      myAccountController.countryCurrency.value =
                          "${controller.localStoreModel?.name} (${controller.localStoreModel?.currentCurrency})";
                    }

                    controller.languageSelectIndex.value = 0;
                    controller.currencySelectIndex.value = 0;
                    Get.back();
                  },
                  title: LanguageConstants.saveText.tr,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                child: CommonThemeButton(
                  onTap: () async {
                    controller.languageSelectIndex.value = 0;
                    controller.currencySelectIndex.value = 0;
                    controller.isChangeLanguage.value = false;
                    controller.isChangeCurrency.value = false;
                    Get.back();
                  },
                  title: LanguageConstants.cancelText.tr,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

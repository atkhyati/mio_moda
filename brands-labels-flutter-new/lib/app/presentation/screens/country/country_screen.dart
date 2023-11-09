import 'package:brandslabels/app/controller/cart_controller.dart';
import 'package:brandslabels/app/controller/country_controller.dart';
import 'package:brandslabels/app/controller/my_account_controller.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/store_websites_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';
import 'package:meta_package/constants/key_value_constants.dart';

class CountryScreen extends StatelessWidget {
  CountryScreen({Key? key}) : super(key: key);

  final MyAccountController myAccountController =
      Get.find<MyAccountController>();
  final CountryController controller = Get.find<CountryController>();
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: controller.scaffoldkey,
        appBar:
            commonAppbar(title: LanguageConstants.changeLanguageAndCurrency.tr),
        backgroundColor: Colors.white,
        body: SizedBox(
          width: Get.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.w),
                    child: TextFormFieldWidget(
                      controller: controller.searchController,
                      keyboardType: TextInputType.name,
                      hintText: LanguageConstants.searchCountry.tr,
                      hintStyle: AppTextStyle.textStyleUtils400(size: 15),
                      onChanged: (value) {
                        controller.countryOnChanged(value);
                      },
                      maxLength: 15,
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                    child: controller.searchCountryList.isNotEmpty
                        ? ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            itemCount: controller.searchCountryList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  await controller.setLanguageAndCurrency(
                                      controller.searchCountryList[index],
                                      false);
                                  showDialog(
                                    context: Get.context!,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                          backgroundColor: Colors.transparent,
                                          insetPadding:
                                              const EdgeInsets.all(10),
                                          child: Container(
                                              width: double.infinity,
                                              color: Colors.white,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 15.0, 20.0, 15.0),
                                              child: dialogContent(controller
                                                  .searchCountryList[index])));
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CommonTextPoppins(
                                    controller.searchCountryList[index].name ??
                                        "",
                                    fontSize: 18.0,
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Column(
                            children: [
                              SizedBox(
                                height: 120.h,
                              ),
                              CommonTextPoppins(
                                  LanguageConstants.noCountryMatches.tr),
                              SizedBox(
                                height: 30.h,
                              ),
                              CommonThemeButton(
                                  onTap: () {
                                    Get.back();
                                  },
                                  title: LanguageConstants.continueShopping.tr)
                            ],
                          )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dialogContent(StoreWebSitesModel item) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextPoppins(
            LanguageConstants.selectLangCurrText.tr,
            fontSize: 15,
            textAlign: TextAlign.center,
            color: darkBlue,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 15.0),
          CommonTextPoppins(
            LanguageConstants.selectLangCurrDescText.tr,
            fontSize: 11,
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
                CommonTextPoppins(
                  "${LanguageConstants.languageText.tr} : ",
                  fontSize: 12,
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
                          child: Obx(() => CommonTextPoppins(
                                controller.rxLanguageList.length - 1 != index
                                    ? "${controller.rxLanguageList[index].toString().toUpperCase()} / "
                                    : controller.rxLanguageList[index]
                                        .toString()
                                        .toUpperCase(),
                                fontSize: 12,
                                textAlign: TextAlign.center,
                                color: controller.languageSelectIndex.value ==
                                        index
                                    ? darkBlue
                                    : Colors.black,
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
                CommonTextPoppins(
                  "${LanguageConstants.currencyText.tr} : ",
                  fontSize: 12,
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
                          child: Obx(() => CommonTextPoppins(
                                controller.rxCurrencyList.length - 1 != index
                                    ? "${controller.rxCurrencyList[index].toString().toUpperCase()} / "
                                    : controller.rxCurrencyList[index]
                                        .toString()
                                        .toUpperCase(),
                                fontSize: 12,
                                textAlign: TextAlign.center,
                                color: controller.currencySelectIndex.value ==
                                        index
                                    ? darkBlue
                                    : Colors.black,
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
              CommonThemeButton(
                onTap: () async {
                  debugPrint(
                      "Language -> ${controller.isChangeLanguage.value}");
                  debugPrint(
                      "Currency -> ${controller.isChangeCurrency.value}");
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
                    await LocalStore.removePrefValue(localStore.customerToken);
                    await LocalStore.removePrefValue(kStorageConstUserDetail);
                    localStore.customerToken = "";
                    LocalStore().checkGuest();
                    cartController.getGenerateCart();
                  }
                  myAccountController.countryCurrency.value =
                      "${controller.localStoreModel?.name} (${controller.localStoreModel?.currentCurrency})";
                  controller.languageSelectIndex.value = 0;
                  controller.currencySelectIndex.value = 0;
                  Get.back();
                },
                title: LanguageConstants.saveText.tr,
              ),
              const SizedBox(
                width: 10.0,
              ),
              CommonThemeButton(
                onTap: () async {
                  controller.languageSelectIndex.value = 0;
                  controller.currencySelectIndex.value = 0;
                  controller.isChangeLanguage.value = false;
                  controller.isChangeCurrency.value = false;
                  Get.back();
                },
                title: LanguageConstants.cancelText.tr,
              ),
            ],
          )
        ],
      ),
    );
  }
}

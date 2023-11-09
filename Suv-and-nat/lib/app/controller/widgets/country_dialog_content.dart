import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/store_websites_model.dart';
import 'package:meta_package/translations/translations.dart';

import '../../presentation/common_widget/common_button.dart';
import '../../presentation/common_widget/common_text_poppins.dart';
import '../country/country_controller.dart';

class DialogContent extends GetView<CountryController> {
  final StoreWebSitesModel item;
  const DialogContent(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            color: Colors.black,
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
                                    ? Colors.black
                                    : Colors.grey,
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
                                    ? Colors.black
                                    : Colors.grey,
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
                height: 35.0,
                child: CommonButton(
                  buttonType: ButtonType.ElevatedButton,
                  onPressed: () async {
                    await controller.dialogSaveOnClick(item);
                  },
                  elevation: 0.0,
                  color: Colors.black,
                  borderRadius: 25.0,
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: CommonTextPoppins(
                      LanguageConstants.saveText.tr,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                height: 35.0,
                child: CommonButton(
                  buttonType: ButtonType.ElevatedButton,
                  onPressed: () async {
                    controller.languageSelectIndex.value = 0;
                    controller.currencySelectIndex.value = 0;
                    controller.isChangeLanguage.value = false;
                    controller.isChangeCurrency.value = false;
                    Get.back();
                  },
                  elevation: 0.0,
                  color: Colors.black,
                  borderRadius: 25.0,
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: CommonTextPoppins(
                      LanguageConstants.cancelText.tr,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

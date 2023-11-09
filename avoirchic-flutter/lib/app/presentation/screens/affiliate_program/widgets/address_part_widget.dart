import 'package:avoirchic/app/controller/affiliate_program_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/common_widgets/headline_body_one_base_widget.dart';
import 'package:avoirchic/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';

class AddressPartWidget extends GetView<AffiliateProgramController> {
  const AddressPartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CommonTextPoppins(
            LanguageConstants.addressText.tr,
            fontSize: 16.sp,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Obx(
              () => Expanded(
                child: Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: borderGrey,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        onChanged: (String? value) {
                          controller.selectedVisitorValue.value =
                              value.toString();
                        },
                        icon: Image.asset(AppAsset.downArrow,
                            height: 16, width: 16.0),
                        value: controller.selectedVisitorValue.value,
                        items: <String>[
                          LanguageConstants.visitorMonthHintText.tr,
                          LanguageConstants.lessThen500Text.tr,
                          LanguageConstants.fiveHundredToThousandText.tr,
                          LanguageConstants.over500Text.tr,
                        ]
                            .map(
                              (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: HeadlineBodyOneBaseWidget(
                                  title: value,
                                  fontSize: 14,
                                  titleColor: grey636363,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Obx(() => Expanded(
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: borderGrey,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          onChanged: (String? value) {
                            controller.selectedViewsValue.value =
                                value.toString();
                          },
                          icon: Image.asset(AppAsset.downArrow,
                              height: 16, width: 16.0),
                          value: controller.selectedViewsValue.value,
                          items: <String>[
                            LanguageConstants.viewsMonthHintText.tr,
                            LanguageConstants.lessThen500Text.tr,
                            LanguageConstants.fiveHundredToThousandText.tr,
                            LanguageConstants.over500Text.tr,
                          ]
                              .map(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: HeadlineBodyOneBaseWidget(
                                    title: value,
                                    fontSize: 14,
                                    titleColor: grey636363,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                child: TextFormFieldWidget(
                  controller: controller.addressOneController.value,
                  focusNode: controller.addressOneFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintText: controller.addressOneController.value.text == "" &&
                          controller.isValidation
                      ? LanguageConstants.enterAddress1.tr
                      : LanguageConstants.addressOneText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                child: TextFormFieldWidget(
                  controller: controller.addressTwoController.value,
                  focusNode: controller.addressTwoFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintText: controller.addressTwoController.value.text == "" &&
                          controller.isValidation
                      ? LanguageConstants.enterAddress2.tr
                      : LanguageConstants.addressTwoText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                child: TextFormFieldWidget(
                  controller: controller.cityController.value,
                  focusNode: controller.cityFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintText: controller.isValidation &&
                          controller.cityController.value.text == ""
                      ? LanguageConstants.enterCity.tr
                      : LanguageConstants.city.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ),
            Container()
          ],
        ),
        const SizedBox(height: 10.0),
        Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                  color: appColor,
                ))
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: borderGrey))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CountryListModel>(
                      items: controller.getcountryList
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value.fullNameEnglish.toString(),
                                  style: AppTextStyle.textStyleUtils400(),
                                ),
                              ))
                          .toList(),
                      isExpanded: true,
                      hint: controller.selectedCoutry.value.fullNameEnglish
                                  .toString() ==
                              "null"
                          ? Text(
                              LanguageConstants.countryText.tr,
                              style: AppTextStyle.textStyleUtils400(
                                color: grey636363,
                              ),
                            )
                          : Text(
                              controller.selectedCoutry.value.fullNameEnglish
                                  .toString(),
                              style: AppTextStyle.textStyleUtils400(),
                            ),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: const Color(0xff367587).withOpacity(0.8),
                      ),
                      onChanged: (value) {
                        controller.selectedCoutry.value = value!;
                        // });
                      },
                    ),
                  ),
                ),
        ),
        // const SizedBox(height: 10.0),

        const SizedBox(height: 10.0),
        SizedBox(
          child: TextFormFieldWidget(
            controller: controller.postCodeController.value,
            focusNode: controller.postCodeFocusNode.value,
            keyboardType: TextInputType.streetAddress,
            hintText: controller.postCodeController.value.text == "" &&
                    controller.isValidation
                ? LanguageConstants.enterZipOrProvince.tr
                : LanguageConstants.postCodeText.tr,
            hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
            validator: (value) {
              return null;
            },
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

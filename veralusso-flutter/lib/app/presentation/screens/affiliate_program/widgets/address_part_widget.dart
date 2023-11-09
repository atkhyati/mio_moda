import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/controller/affiliate_program/affiliate_program_controller.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:veralusso/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:veralusso/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class AddressPartWidget extends GetView<AffiliateProgramController> {
  @override
  final AffiliateProgramController controller = Get.find();

  AddressPartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
          title: LanguageConstants.addressText.tr,
          titleColor: Colors.black,
          titleTextAlign: TextAlign.center,
          fontSize: 16.sp,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                child: TextFormFieldWidget(
                  controller: controller.addressOneController.value,
                  focusNode: controller.addressOneFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintText: controller.isValid &&
                          controller.addressOneController.value.text == ""
                      ? LanguageConstants.enterAddress1.tr
                      : LanguageConstants.addressOneText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(),
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
                  hintText: controller.isValid &&
                          controller.addressTwoController.value.text == ""
                      ? LanguageConstants.enterAddress2.tr
                      : LanguageConstants.addressTwoText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(),
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                      color: textFieldBoarderColor, width: 2))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: DropdownButtonHideUnderline(
              child: Obx(() => controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                      color: blackColor,
                    ))
                  : DropdownButton<CountryListModel>(
                      onChanged: (CountryListModel? value) {
                        controller.selectedCoutry.value = value!;
                      },
                      alignment: AlignmentDirectional.centerStart,
                      icon: Image.asset(AppAsset.downArrow,
                          height: 16.w, width: 16.w),
                      value: controller.selectedCoutry.value,
                      items: controller.getcountryList
                          .map(
                            (CountryListModel value) =>
                                DropdownMenuItem<CountryListModel>(
                              value: value,
                              child: HeadlineBodyOneBaseWidget(
                                title: value.fullNameEnglish,
                                fontSize: 14.sp,
                                textOverflow: TextOverflow.ellipsis,
                                titleColor: blackColor,
                              ),
                            ),
                          )
                          .toList(),
                      style: AppStyle.commonTextStyle400(size: 14.sp)
                          .copyWith(overflow: TextOverflow.ellipsis),
                    )),
            ),
          ),
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
                  hintText: controller.isValid &&
                          controller.cityController.value.text == ""
                      ? LanguageConstants.enterCity.tr
                      : LanguageConstants.city.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(),
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                child: TextFormFieldWidget(
                  controller: controller.postCodeController.value,
                  focusNode: controller.postCodeFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintStyle: AppTextStyle.textStyleUtils400(
                      size: controller.isValid &&
                              controller.postCodeController.value.text == ""
                          ? 13
                          : 14),
                  hintText: controller.isValid &&
                          controller.postCodeController.value.text == ""
                      ? LanguageConstants.enterZipPostalCode.tr
                      : LanguageConstants.postCodeText.tr,
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

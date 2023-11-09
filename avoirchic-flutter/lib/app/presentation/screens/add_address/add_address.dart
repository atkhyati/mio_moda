import 'package:avoirchic/app/controller/add_address_controller.dart';
import 'package:avoirchic/app/controller/country_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_text_phone_field.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_field.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/screen_loading.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/utils/validator.dart';

class AddAddressScreen extends GetView<AddAddressController> {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
            controller.isFromAddAddress
                ? LanguageConstants.addAddressText.tr
                : LanguageConstants.updateAddress.tr,
            style: AppTextStyle.textStyleUtils400()),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: avoirChickTheme,
                ),
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.all(24.w),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CommonTextField(
                            controller: controller.firstNameController,
                            hintText: LanguageConstants.firstNameText.tr,
                            validator: (value) =>
                                Validators.validateName(value),
                          ),
                          SizedBox(height: 16.h),
                          CommonTextField(
                            controller: controller.lastNameController,
                            hintText: LanguageConstants.lastNameText.tr,
                            validator: (value) =>
                                Validators.validateName(value),
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            child: CommonTextPhoneField(
                              textController: controller.phoneNumberController,
                              country:
                                  Get.find<CountryController>().country!.value,
                              cursorColor: blackColor,
                              dropdownIconColor: Colors.black,
                              borderColor: borderGrey,
                              focusedColor: Colors.black26,
                              dropdownTextStyle:
                                  AppTextStyle.textStyleUtils400(),
                              fontStyle:
                                  AppTextStyle.textStyleUtils400(size: 14.sp),
                              hintStyle: AppTextStyle.textStyleUtils400(
                                color: grey636363,
                              ),
                              errorBorderColor: Colors.red,
                              hintText: LanguageConstants.phoneNumberText.tr,
                              onCountryChanged: (country) {
                                controller.countryCodenumber = country.dialCode;
                              },
                              validator: (value) => Validators.validateMobile(
                                value?.number ?? '',
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          CommonTextField(
                            controller: controller.address1Controller,
                            hintText: LanguageConstants.streetAddressText.tr,
                            validator: (value) => Validators.validateAddress(
                                value?.trim() ?? '',
                                LanguageConstants.enterAddress1.tr),
                          ),
                          SizedBox(height: 16.h),
                          CommonTextField(
                            controller: controller.address2Controller,
                            hintText: LanguageConstants.streetAddressText.tr,
                            validator: (value) => Validators.validateAddress(
                                value?.trim() ?? '',
                                LanguageConstants.enterAddress2.tr),
                          ),
                          SizedBox(height: 16.h),
                          CommonTextField(
                            controller: controller.address3Controller,
                            hintText: LanguageConstants.streetAddressText.tr,
                            validator: (value) => Validators.validateAddress(
                                value?.trim() ?? '',
                                LanguageConstants.enterAddress3.tr),
                          ),
                          SizedBox(height: 16.h),
                          CommonTextField(
                            controller: controller.cityController,
                            hintText: LanguageConstants.cityText.tr,
                            validator: (value) => Validators.validateAddress(
                                value?.trim() ?? '',
                                LanguageConstants.enterCity.tr),
                          ),
                          SizedBox(height: 16.h),
                          CommonTextField(
                            controller: controller.zipPovinceController,
                            hintText: LanguageConstants.zipCodeText.tr,
                            validator: (value) => Validators.validateAddress(
                                value?.trim() ?? '',
                                LanguageConstants.enterZipOrProvince.tr),
                          ),
                          SizedBox(height: 16.h),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: borderGrey, width: 2),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<CountryListModel>(
                                items: controller.getcountryList
                                    .map((value) => DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value.fullNameEnglish.toString(),
                                            style: AppTextStyle
                                                .textStyleUtils400(),
                                          ),
                                        ))
                                    .toList(),
                                isExpanded: true,
                                hint: controller.selectedCoutry.value
                                            .fullNameEnglish
                                            .toString() ==
                                        "null"
                                    ? Text(
                                        LanguageConstants.countryText.tr,
                                        style: hintStyle(),
                                      )
                                    : Text(
                                        controller.selectedCoutry.value
                                            .fullNameEnglish
                                            .toString(),
                                        style: AppTextStyle.textStyleUtils400(),
                                      ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color:
                                      const Color(0xff367587).withOpacity(0.8),
                                ),
                                onChanged: (value) {
                                  controller.selectedCoutry.value = value!;
                                  // });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          controller.selectedCoutry.value.availableRegions
                                      .toString() ==
                                  "null"
                              ? Container()
                              : controller.selectedCoutry.value.availableRegions
                                          .toString() ==
                                      "[]"
                                  ? Container()
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: borderGrey, width: 2),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<AvailableRegion>(
                                          items: controller.selectedCoutry.value
                                              .availableRegions!
                                              .map((value) => DropdownMenuItem<
                                                      AvailableRegion>(
                                                    value: value,
                                                    child: Text(
                                                        value.name.toString()),
                                                  ))
                                              .toList(),
                                          isExpanded: true,
                                          hint: Text(
                                            controller.selectedOrHintText(),
                                            style: AppTextStyle
                                                .textStyleUtils400(),
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: const Color(0xff367587)
                                                .withOpacity(0.8),
                                          ),
                                          onChanged: (value) {
                                            controller.selectedState.value =
                                                value!;
                                          },
                                        ),
                                      ),
                                    ),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: CommonThemeButton(
                                onTap: () async {
                                  controller.isValidation.value = true;
                                  if (controller.isFromAddAddress) {
                                    controller.addAddress(
                                        context,
                                        controller.formKey,
                                        controller.selectedCoutry.value
                                                    .availableRegions
                                                    .toString() ==
                                                "null" ||
                                            controller.selectedCoutry.value
                                                    .availableRegions
                                                    .toString() ==
                                                "[]");
                                  } else {
                                    controller.updateAddress(
                                      context,
                                      controller.formKey,
                                    );
                                  }
                                },
                                title: controller.buttonText()),
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                  controller.isScreenLoading.value
                      ? const ScreenLoading()
                      : const SizedBox.shrink()
                ],
              ),
      ),
    );
  }

  TextStyle hintStyle() {
    return AppTextStyle.textStyleUtils400(
      color: grey636363,
    );
  }

  TextStyle labelStyle() {
    return AppTextStyle.textStyleUtils400(
      color: Colors.grey,
    );
  }
}

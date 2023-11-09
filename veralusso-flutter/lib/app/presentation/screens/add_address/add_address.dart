import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:veralusso/app/controller/add_address/add_address_controller.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/common_text_phone_field.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class AddAddressScreen extends GetView<AddAddressController> {
  @override
  final AddAddressController controller = Get.find();

  AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: controller.scaffoldKey,
      appBar: commonAppbar(title: LanguageConstants.saveAdressText.tr),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: blackColor,
                ),
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              controller: controller.firstNameController,
                              decoration: getInputDecoration(
                                  LanguageConstants.firstNameText.tr),
                              validator: (value) =>
                                  Validators.validateName(value),
                            ),
                          ),
                          controller.getFirstName.value == true
                              ? const SizedBox(height: 6.0)
                              : Container(),
                          controller.getFirstName.value == true
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        LanguageConstants.enterName.tr,
                                        style:
                                            AppTextStyle.textStyleUtils400_12(
                                                color: Colors.red),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              controller: controller.lastNameController,
                              decoration: getInputDecoration(
                                  LanguageConstants.surNameTextveralusso.tr),
                              validator: (value) => Validators.validateName(
                                value?.trim(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: SizedBox(
                              child: CommonTextPhoneField(
                                textController:
                                    controller.phoneNumberController,
                                textColor: darkGrey,
                                country: Get.find<CountryController>()
                                    .country!
                                    .value
                                    .toString(),
                                cursorColor: blue,
                                dropdownIconColor: darkGrey,
                                borderColor: textFieldBoarderColor,
                                focusedColor: blackColor,
                                errorBorderColor: red,
                                dropdownTextStyle:
                                    AppTextStyle.textStyleUtils400(
                                        color: darkGrey),
                                fontStyle: AppTextStyle.textStyleUtils400(
                                    color: darkGrey),
                                hintStyle: AppTextStyle.textStyleUtils400(
                                    color: regularGrey),
                                hintText: LanguageConstants.contactNoText.tr,
                                hintColor: appColor,
                                onCountryChanged: (country) {
                                  controller.countryCode = country.dialCode;
                                },
                                validator: (value) => Validators.validateMobile(
                                  value?.number ?? '',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              controller: controller.address1Controller,
                              decoration: getInputDecoration(
                                  LanguageConstants.streetAdd1Text.tr),
                              validator: (value) => Validators.validateAddress(
                                  value?.trim() ?? '',
                                  LanguageConstants.enterStreetAddress1.tr),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              controller: controller.address2Controller,
                              decoration: getInputDecoration(
                                  LanguageConstants.streetAdd2Text.tr),
                              validator: (value) => Validators.validateAddress(
                                  value?.trim() ?? '',
                                  LanguageConstants.enterStreetAdress2.tr),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              controller: controller.address3Controller,
                              decoration: getInputDecoration(
                                  LanguageConstants.streetAdd3Text.tr),
                              validator: (value) => Validators.validateAddress(
                                  value?.trim() ?? '',
                                  LanguageConstants.enterStreetAddress3.tr),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              controller: controller.cityController,
                              decoration: getInputDecoration(
                                  LanguageConstants.cityText.tr),
                              validator: (value) => Validators.validateAddress(
                                  value?.trim() ?? '',
                                  LanguageConstants.enterCity.tr),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              controller: controller.zipPovinceController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: true),
                              decoration: getInputDecoration(
                                  LanguageConstants.zipCodeText.tr),
                              validator: (value) => Validators.validateZip(
                                  value?.trim() ?? '',
                                  LanguageConstants.enterZip.tr),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: textFieldBoarderColor, width: 2),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<CountryListModel>(
                                  items: controller.getcountryList
                                      .map((value) =>
                                          DropdownMenuItem<CountryListModel>(
                                            value: value,
                                            child: Text(value.fullNameEnglish
                                                .toString()),
                                          ))
                                      .toList(),
                                  isExpanded: true,
                                  hint: controller.selectedCoutry.value
                                              .fullNameEnglish
                                              .toString() ==
                                          "null"
                                      ? Text(
                                          LanguageConstants.country.tr,
                                          style:
                                              AppTextStyle.textStyleUtils400(),
                                        )
                                      : Text(
                                          controller.selectedCoutry.value
                                              .fullNameEnglish
                                              .toString(),
                                          style:
                                              AppTextStyle.textStyleUtils400(),
                                        ),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 22,
                                    color: Colors.black45,
                                  ),
                                  onChanged: (value) {
                                    controller.selectedCoutry.value = value!;
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          controller.selectedCoutry.value.availableRegions ==
                                  null
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: textFieldBoarderColor,
                                          width: 2),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<AvailableRegion>(
                                        items: controller.selectedCoutry.value
                                            .availableRegions!
                                            .map((value) => DropdownMenuItem<
                                                    AvailableRegion>(
                                                  value: value,
                                                  child: Text(
                                                    value.name.toString(),
                                                    style: AppTextStyle
                                                        .textStyleUtils400(
                                                            color: blackColor),
                                                  ),
                                                ))
                                            .toList(),
                                        isExpanded: true,
                                        hint: controller
                                                    .selectedState.value.name
                                                    .toString() ==
                                                "null"
                                            ? Text(
                                                LanguageConstants
                                                    .selectStateOrProvince.tr,
                                                style: AppTextStyle
                                                    .textStyleUtils400(),
                                              )
                                            : Text(
                                                controller
                                                    .selectedState.value.name
                                                    .toString(),
                                                style: AppTextStyle
                                                    .textStyleUtils400(),
                                              ),
                                        icon:  const Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 22,
                                          color: Colors.black45,
                                        ),
                                        iconEnabledColor: Colors.transparent,
                                        onChanged: (value) {
                                          controller.selectedState.value =
                                              value!;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(height: 30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonThemeButton(
                                onTap: () {
                                  controller.isValidation.value = true;
                                  if (controller.isFromAddAddress) {
                                    controller.addAddress(context);
                                  } else {
                                    controller.updateAddress(context);
                                  }
                                },
                                title: controller.isFromAddAddress
                                    ? LanguageConstants.saveAdressText.tr
                                    : LanguageConstants.updateAdressText.tr,
                              ),
                            ],
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

  InputDecoration getInputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.only(bottom: 12, top: 12, left: 10),
      hintText: hint,
      hintStyle: AppTextStyle.textStyleUtils400(),
      labelStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: textFieldBoarderColor, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: textFieldBoarderColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: textFieldBoarderColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: textFieldBoarderColor, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: textFieldBoarderColor, width: 2),
      ),
    );
  }
}

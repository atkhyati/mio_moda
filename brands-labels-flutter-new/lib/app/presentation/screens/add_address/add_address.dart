import 'package:brandslabels/app/controller/add_address_controller.dart';
import 'package:brandslabels/app/controller/country_controller.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/screen_loading.dart';
import 'package:brandslabels/app/presentation/common_widgets/custom_phone_field/common_text_phone_field.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
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
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        title: Text(controller.isFromAddAddress
            ? LanguageConstants.addAddress.tr
            : LanguageConstants.updateAddress.tr),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(
                    0xff000080,
                  ),
                ),
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: GetBuilder<AddAddressController>(
                      id: "address",
                      builder: (controller) {
                        var outlineInputBorder = OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: borderGrey, width: 2));
                        return Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              // Container(
                              //     height: 34,
                              //     width: double.infinity,
                              //     alignment: Alignment.center,
                              //     decoration: const BoxDecoration(
                              //       color: Color(
                              //         0xff000080,
                              //       ),
                              //     ),
                              //     child: Text(
                              //       LanguageConstants.exploreText.tr,
                              //       style: AppTextStyle.textStyleUtils400(
                              //         color: Colors.white,
                              //       ),
                              //     )),
                              // Container(
                              //   padding: const EdgeInsets.symmetric(
                              //     horizontal: 10,
                              //     vertical: 10,
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.start,
                              //         children: [
                              //           const SizedBox(
                              //             width: 10,
                              //           ),
                              //           Image.asset(
                              //             AppAsset.brandsLabelsLogo,
                              //
                              //           ),
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              //   ],
                              // ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: TextFormField(
                                  controller: controller.firstNameController,
                                  decoration: InputDecoration(
                                      filled: false,
                                      hintText:
                                          LanguageConstants.firstNameText.tr,
                                      labelStyle:
                                          AppTextStyle.textStyleUtils400(
                                        color: Colors.black54,
                                      ),
                                      isDense: true,
                                      border: outlineInputBorder,
                                      focusedBorder: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      errorBorder: outlineInputBorder,
                                      disabledBorder: outlineInputBorder,
                                      focusedErrorBorder: outlineInputBorder),
                                  validator: (value) => Validators.validateName(
                                      value,
                                      message:
                                          LanguageConstants.firstNameText.tr),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: TextFormField(
                                  controller: controller.lastNameController,
                                  decoration: InputDecoration(
                                    hintText: LanguageConstants
                                        .surNameTextavoirchic.tr,
                                    labelStyle: AppTextStyle.textStyleUtils400(
                                      color: Colors.black54,
                                    ),
                                    border: outlineInputBorder,
                                    focusedBorder: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    errorBorder: outlineInputBorder,
                                    disabledBorder: outlineInputBorder,
                                    focusedErrorBorder: outlineInputBorder,
                                    isDense: true,
                                  ),
                                  validator: (value) => Validators.validateName(
                                      value,
                                      message: LanguageConstants
                                          .surNameTextavoirchic.tr),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: SizedBox(
                                  child: CommonTextPhoneField(
                                    textController:
                                        controller.phoneNumberController,
                                    cursorColor: blue,
                                    country: Get.find<CountryController>()
                                        .country
                                        .value,
                                    focusedColor: borderGrey,
                                    dropdownIconColor: borderGrey,
                                    errorBorderColor: Colors.transparent,
                                    borderColor: borderGrey,
                                    dropdownTextStyle:
                                        AppTextStyle.textStyleUtils400_16(
                                      color: Colors.black,
                                    ),
                                    fontStyle:
                                        AppTextStyle.textStyleUtils400_16(
                                      color: Colors.black,
                                    ),
                                    hintStyle:
                                        AppTextStyle.textStyleUtils400_16(
                                            color: Colors.black54),
                                    hintText: controller.isValidation &&
                                            controller.phoneNumberController
                                                    .value.text ==
                                                ""
                                        ? LanguageConstants.enterPhoneNumber.tr
                                        : LanguageConstants.phoneNumberText.tr,
                                    onCountryChanged: (country) {
                                      controller.countryCodeNumber =
                                          country.dialCode;
                                    },
                                    validator: (value) =>
                                        Validators.validateMobile(
                                            value?.number ?? ''),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: TextFormField(
                                  controller: controller.address1Controller,
                                  decoration: InputDecoration(
                                    border: outlineInputBorder,
                                    focusedBorder: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    errorBorder: outlineInputBorder,
                                    disabledBorder: outlineInputBorder,
                                    focusedErrorBorder: outlineInputBorder,
                                    hintText:
                                        LanguageConstants.addressOneText.tr,
                                    labelStyle: AppTextStyle.textStyleUtils400(
                                      color: Colors.black54,
                                    ),
                                    isDense: true,
                                  ),
                                  validator: (value) => Validators.validateAddress(
                                      value?.trim() ?? '',
                                      "${LanguageConstants.addressOneText.tr} ${LanguageConstants.requiredVal.tr}"),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: TextFormField(
                                  controller: controller.address2Controller,
                                  decoration: InputDecoration(
                                    border: outlineInputBorder,
                                    focusedBorder: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    errorBorder: outlineInputBorder,
                                    disabledBorder: outlineInputBorder,
                                    focusedErrorBorder: outlineInputBorder,
                                    hintText:
                                        LanguageConstants.addressTwoText.tr,
                                    labelStyle: AppTextStyle.textStyleUtils400(
                                      color: Colors.black54,
                                    ),
                                    isDense: true,
                                  ),
                                  validator: (value) => Validators.validateAddress(
                                      value?.trim() ?? '',
                                      "${LanguageConstants.streetAddress2.tr} ${LanguageConstants.requiredVal.tr}"),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: TextFormField(
                                  controller: controller.address3Controller,
                                  decoration: InputDecoration(
                                    border: outlineInputBorder,
                                    focusedBorder: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    errorBorder: outlineInputBorder,
                                    disabledBorder: outlineInputBorder,
                                    focusedErrorBorder: outlineInputBorder,
                                    hintText:
                                        LanguageConstants.addressThreeText.tr,
                                    labelStyle: AppTextStyle.textStyleUtils400(
                                      color: Colors.black54,
                                    ),
                                    isDense: true,
                                  ),
                                  validator: (value) => Validators.validateAddress(
                                      value?.trim() ?? '',
                                      "${LanguageConstants.streetAddress3.tr} ${LanguageConstants.requiredVal.tr}"),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: TextFormField(
                                  controller: controller.cityController,
                                  decoration: InputDecoration(
                                    border: outlineInputBorder,
                                    focusedBorder: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    errorBorder: outlineInputBorder,
                                    disabledBorder: outlineInputBorder,
                                    focusedErrorBorder: outlineInputBorder,
                                    hintText: LanguageConstants.cityText.tr,
                                    labelStyle: AppTextStyle.textStyleUtils400(
                                      color: Colors.black54,
                                    ),
                                    isDense: true,
                                  ),
                                  validator: (value) => Validators.validateAddress(
                                      value?.trim() ?? '',
                                      "${LanguageConstants.city.tr} ${LanguageConstants.requiredVal.tr}"),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: TextFormField(
                                  controller: controller.zipPovinceController,
                                  decoration: InputDecoration(
                                    border: outlineInputBorder,
                                    focusedBorder: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    errorBorder: outlineInputBorder,
                                    disabledBorder: outlineInputBorder,
                                    focusedErrorBorder: outlineInputBorder,
                                    hintText: LanguageConstants.postCodeText.tr,
                                    labelStyle: AppTextStyle.textStyleUtils400(
                                      color: Colors.black54,
                                    ),
                                    isDense: true,
                                  ),
                                  validator: (value) => Validators.validateZip(
                                      value?.trim() ?? '',
                                      LanguageConstants.enterZipOrProvince.tr),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Obx(() => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: borderGrey, width: 1),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<CountryListModel>(
                                          items: controller.getcountryList
                                              .map((value) => DropdownMenuItem<
                                                      CountryListModel>(
                                                    value: value,
                                                    child: Text(
                                                      value.fullNameEnglish
                                                          .toString(),
                                                    ),
                                                  ))
                                              .toList(),
                                          isExpanded: true,
                                          hint: controller.selectedCoutry.value
                                                      .fullNameEnglish
                                                      .toString() ==
                                                  "null"
                                              ? Text(
                                                  LanguageConstants
                                                      .stateAndProvienText.tr,
                                                )
                                              : Text(
                                                  controller.selectedCoutry
                                                      .value.fullNameEnglish
                                                      .toString(),
                                                  style: AppTextStyle
                                                      .textStyleUtils400(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 22,
                                            color: Colors.black45,
                                          ),
                                          onChanged: (value) {
                                            controller.selectedCoutry.value =
                                                value!;
                                          },
                                        ),
                                      ),
                                    ),
                                  )),
                              const SizedBox(height: 10),
                              Obx(() => controller.selectedCoutry.value
                                          .availableRegions ==
                                      null
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: borderGrey,
                                            width: 1,
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child:
                                              DropdownButton<AvailableRegion>(
                                            items: controller.selectedCoutry
                                                .value.availableRegions!
                                                .map((value) =>
                                                    DropdownMenuItem<
                                                        AvailableRegion>(
                                                      value: value,
                                                      child: Text(
                                                        value.name.toString(),
                                                        style: AppTextStyle
                                                            .textStyleUtils400(),
                                                      ),
                                                    ))
                                                .toList(),
                                            isExpanded: true,
                                            hint: controller.selectedState.value
                                                        .name
                                                        .toString() ==
                                                    "null"
                                                ? Text(
                                                    LanguageConstants
                                                        .stateProvince.tr,
                                                  )
                                                : Text(
                                                    controller.selectedState
                                                        .value.name
                                                        .toString(),
                                                    style: AppTextStyle
                                                        .textStyleUtils400(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 22,
                                              color: Colors.black45,
                                            ),
                                            iconEnabledColor:
                                                Colors.transparent,
                                            onChanged: (value) {
                                              controller.selectedState.value =
                                                  value!;
                                            },
                                          ),
                                        ),
                                      ),
                                    )),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height:48,
                                    child: CommonThemeButton(
                                      onTap: () async {
                                        await controller
                                            .saveOrUpdateAddress(context);
                                      },
                                      title: LanguageConstants.saveAddressText.tr,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  controller.isScreenLoading.value
                      ? const ScreenLoading()
                      : const SizedBox.shrink(),
                ],
              ),
      ),
    );
  }
}

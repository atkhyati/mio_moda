import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

import '../../../controller/country/country_controller.dart';
import '../../../controller/product_detail/product_detail_controller.dart';
import '../../../theme/colors.dart';
import '../../common_widget/custom_phone_field/intl_phone_field.dart';

class CreateTicketForBestPriceMatchDialog extends StatelessWidget {
  CreateTicketForBestPriceMatchDialog({
    Key? key,
    required this.onTap,
    required this.phoneNumberController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.urlOfImageController,
    required this.remarksController,
    required this.keywordController,
    required this.isProductAvailableController,
    required this.priceController,
    required this.productNameController,
    required this.linkCheaperProductController,
    required this.styleController,
    required this.urlOfWebsiteController,
  }) : super(key: key);
  final Function() onTap;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController urlOfImageController;
  final TextEditingController remarksController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController productNameController;
  final TextEditingController styleController;
  final TextEditingController keywordController;
  final TextEditingController urlOfWebsiteController;
  final TextEditingController linkCheaperProductController;
  final TextEditingController priceController;
  final TextEditingController isProductAvailableController;

  final ProductDetailController productDetailController = Get.find();

  String countryCode = '1';

  @override
  Widget build(BuildContext context) {
    var country = Get.find<CountryController>().country?.value.toString();

    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      radius: 30,
      contentWidget: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Center(
                    child: Text(
                      LanguageConstants.priceMatchTicket.tr,
                      style: AppTextStyle.textStyleUtils400_18(),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.close,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        cursorColor: regularE8E8E8,
                        controller: firstNameController,
                        keyboardType: TextInputType.text,
                        decoration: getInputDecoration(
                            LanguageConstants.firstNameText.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterFirstName.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: appColor,
                        controller: lastNameController,
                        keyboardType: TextInputType.text,
                        // readOnly: true,
                        decoration: getInputDecoration(
                            LanguageConstants.lastNameText.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterLastName.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        cursorColor: appColor,
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        // readOnly: true,
                        decoration: getInputDecoration(
                            LanguageConstants.emailAddressText.tr),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Flexible(
                  child: IntlPhoneField(
                      controller: phoneNumberController,
                      flagsButtonMargin: const EdgeInsets.only(left: 5.0),
                      style: AppTextStyle.textStyleUtils400_16(color: darkGrey),
                      cursorColor: appColor,
                      dropdownTextStyle:
                          AppTextStyle.textStyleUtils400_16(color: darkGrey),
                      dropdownIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: darkGrey,
                      ),
                      disableLengthCheck: true,
                      onCountryChanged: (country) {
                        countryCode = country.dialCode;
                      },
                      initialCountryCode:
                          (country?.isEmpty ?? false) || country == null
                              ? 'IN'
                              : country.toString(),
                      decoration: getBlackInputDecoration(
                          LanguageConstants.phoneNumberText.tr)),

                  //     CommonTextPhoneField(
                  //   textController: phoneNumberController,
                  //   textColor: darkGrey,
                  //   cursorColor: appColor,
                  //   dropdownIconColor: darkGrey,
                  //   borderColor: darkGrey,
                  //   focusedColor: darkGrey,
                  //   errorBorderColor: red,
                  //   dropdownTextStyle:
                  //       AppTextStyle.textStyleUtils400_16(color: darkGrey),
                  //   fontStyle:
                  //       AppTextStyle.textStyleUtils400_16(color: darkGrey),
                  //   hintStyle:
                  //       AppTextStyle.textStyleUtils400_16(color: darkGrey),
                  //   hintText: LanguageConstants.phoneNumberText.tr,
                  //   hintColor: appColor,
                  //   onCountryChanged: (country) {
                  //     countryCode = country.dialCode;
                  //   },
                  // ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        cursorColor: appColor,
                        controller: productNameController,
                        keyboardType: TextInputType.text,
                        decoration: getInputDecoration(
                            LanguageConstants.productName.tr),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: appColor,
                        controller: styleController,
                        keyboardType: TextInputType.text,
                        decoration:
                            getInputDecoration(LanguageConstants.enterStyle.tr),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        cursorColor: appColor,
                        controller: keywordController,
                        keyboardType: TextInputType.text,
                        decoration: getBlackInputDecoration(
                            LanguageConstants.enterKeyword.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterURLOfImage.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: appColor,
                        controller: urlOfImageController,
                        keyboardType: TextInputType.text,
                        decoration: getBlackInputDecoration(
                            LanguageConstants.enterURLOfImage.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterURLOfImage.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        cursorColor: appColor,
                        controller: urlOfWebsiteController,
                        keyboardType: TextInputType.text,
                        decoration: getBlackInputDecoration(
                            LanguageConstants.websiteUrlForItemCheaper.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterUrlText.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextFormField(
                        cursorColor: appColor,
                        controller: linkCheaperProductController,
                        keyboardType: TextInputType.text,
                        decoration: getBlackInputDecoration(
                            LanguageConstants.linkForItemCheaper.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterLink.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        cursorColor: appColor,
                        controller: priceController,
                        keyboardType: TextInputType.text,
                        decoration: getBlackInputDecoration(
                            LanguageConstants.priceIncludingDutiesAndTaxes.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterPriceText.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        LanguageConstants.countryWhereYouShipped.tr,
                        style: AppTextStyle.textStyleUtils400_12(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        cursorColor: appColor,
                        controller: isProductAvailableController,
                        keyboardType: TextInputType.text,
                        decoration: getBlackInputDecoration(
                            LanguageConstants.isProductAvailableInWebsite.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterYesOrNo.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: regularE8E8E8,
                          borderRadius: BorderRadius.circular(0.0),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<CountryListModel>(
                            dropdownColor: regularE8E8E8,
                            items: productDetailController.getCountryListData
                                .map((value) =>
                                    DropdownMenuItem<CountryListModel>(
                                      value: value,
                                      child: Text(
                                          value.fullNameEnglish.toString()),
                                    ))
                                .toList(),
                            isExpanded: true,
                            hint: productDetailController
                                        .selectedCountry.value.fullNameEnglish
                                        .toString() ==
                                    "null"
                                ? Text(
                                    LanguageConstants.countryText.tr,
                                    style: AppTextStyle.textStyleUtils400(
                                        color: Colors.black54),
                                  )
                                : Text(
                                    productDetailController
                                        .selectedCountry.value.fullNameEnglish
                                        .toString(),
                                    style: AppTextStyle.textStyleUtils400(),
                                  ),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 28,
                              color: Colors.black,
                            ),
                            onChanged: (value) {
                              debugPrint("value Is $value");
                              productDetailController.selectedCountry.value =
                                  value!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  cursorColor: appColor,
                  controller: remarksController,
                  keyboardType: TextInputType.text,
                  decoration: getBlackInputDecoration(
                      LanguageConstants.enterRemarks.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return LanguageConstants.enterURLOfImage.tr;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 7.0),
                        decoration: BoxDecoration(
                            color: regularE8E8E8,
                            borderRadius: BorderRadius.circular(40)),
                        child: Text(
                          LanguageConstants.createTicket.tr,
                          style: AppTextStyle.textStyleUtils500_16(),
                        ),
                      ),
                    ),
                    /* const SizedBox(
                      width: 50,
                    ), */
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 7.0),
                        decoration: BoxDecoration(
                            color: regularE8E8E8,
                            borderRadius: BorderRadius.circular(40)),
                        child: Text(
                          LanguageConstants.cancel.tr,
                          style: AppTextStyle.textStyleUtils500_16(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration getInputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: regularE8E8E8,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      hintText: hint,
      labelStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 1.0,
        ),
      ),
    );
  }

  InputDecoration getBlackInputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: regularE8E8E8,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      hintText: hint,
      labelStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
      errorStyle: AppTextStyle.textStyleUtils400(color: Colors.red),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: appColor,
        ),
        borderRadius: BorderRadius.circular(0.0),
      ),
    );
  }
}

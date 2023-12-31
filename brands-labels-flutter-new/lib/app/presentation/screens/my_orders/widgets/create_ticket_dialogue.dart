import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../controller/country_controller.dart';
import '../../../../core/consts/app_constants.dart';
import '../../../common_widgets/alert_dialog/common_alert_dialog.dart';
import '../../../common_widgets/common_widget/common_theme_button.dart';
import '../../../common_widgets/custom_phone_field/common_text_phone_field.dart';

class CreateTicketDialog extends StatelessWidget {
  CreateTicketDialog({
    Key? key,
    required this.onTap,
    this.fromItem = false,
    this.fromReturn = false,
    required this.phoneNumberController,
    required this.firstNameController,
    required this.lastNameController,
    required this.skuController,
    required this.orderCancelController,
    required this.emailController,
    required this.orderController,
    required this.imageUrlController,
    required this.remarksController,
  }) : super(key: key);
  final GestureTapCallback? onTap;
  final TextEditingController phoneNumberController;
  final TextEditingController firstNameController;
  final bool fromItem;
  final bool fromReturn;

  final TextEditingController lastNameController;
  final TextEditingController skuController;
  final TextEditingController orderCancelController;
  final TextEditingController emailController;
  final TextEditingController orderController;
  final TextEditingController imageUrlController;
  final TextEditingController remarksController;
  final String countryCode = '1';
  final RxString phoneErrorMsg = "".obs;

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // titlePadding: EdgeInsets.zero,
      // backgroundColor: homeBackground,
      radius: 30,
      contentWidget: SingleChildScrollView(
        padding: EdgeInsets.all(17.w),
        child: SizedBox(
          width: double.maxFinite,
          child: Form(
            key: key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.close,
                          size: 22,
                          color: appColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 5.0,
                  ),
                  child: Text(
                    '${LanguageConstants.orderNotEligible.tr} ${fromReturn ? LanguageConstants.returnText.tr : LanguageConstants.cancelText.tr}. ${LanguageConstants.createSupportTicketAssistance.tr}',
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(fontFamily: AppConstants.fontOpenSans),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          child: TextFormField(
                            cursorColor: appColor,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppConstants.fontOpenSans),
                            controller: firstNameController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: LanguageConstants.firstNameText.tr,
                              hintStyle: const TextStyle(
                                  fontFamily: AppConstants.fontOpenSans,
                                  fontSize: 14),
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: SizedBox(
                          child: TextFormField(
                            cursorColor: appColor,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppConstants.fontOpenSans),
                            controller: orderController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: LanguageConstants.orderIdText.tr,
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          child: TextFormField(
                            cursorColor: appColor,
                            controller: lastNameController,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppConstants.fontOpenSans),
                            keyboardType: TextInputType.number,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: LanguageConstants.firstNameText.tr,
                              hintStyle: const TextStyle(
                                  fontFamily: AppConstants.fontOpenSans,
                                  fontSize: 14),
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: SizedBox(
                          child: TextFormField(
                            cursorColor: appColor,
                            controller: skuController,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppConstants.fontOpenSans),
                            keyboardType: TextInputType.number,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: LanguageConstants.sku.tr,
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          child: TextFormField(
                            cursorColor: appColor,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppConstants.fontOpenSans),
                            controller: emailController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: LanguageConstants.yourEmail1Text.tr,
                              hintStyle: const TextStyle(
                                  fontFamily: AppConstants.fontOpenSans,
                                  fontSize: 14),
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: SizedBox(
                          child: TextFormField(
                            cursorColor: appColor,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppConstants.fontOpenSans),
                            controller: orderCancelController,
                            keyboardType: TextInputType.number,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: LanguageConstants.orderCancelRequest.tr,
                              hintStyle: const TextStyle(
                                  fontFamily: AppConstants.fontOpenSans,
                                  fontSize: 14),
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          child: TextFormField(
                            cursorColor: appColor,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppConstants.fontOpenSans),
                            controller: imageUrlController,
                            keyboardType: TextInputType.text,
                            readOnly: fromItem,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: LanguageConstants.urlOfImage.tr,
                              hintStyle: const TextStyle(
                                  fontFamily: AppConstants.fontOpenSans,
                                  fontSize: 14),
                              labelStyle:
                                  const TextStyle(color: Colors.black54),
                              errorStyle: const TextStyle(color: Colors.red),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: grey636363,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            validator: (value) {
                              if (value == null || value == '') {
                                return LanguageConstants.enterURLOfImage.tr;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          child: CommonTextPhoneField(
                            filled: true,
                            fillColor: Colors.white,
                            textController: phoneNumberController,
                            fontStyle: const TextStyle(
                                fontSize: 14,
                                fontFamily: AppConstants.fontOpenSans),
                            hintStyle: const TextStyle(
                                fontFamily: AppConstants.fontOpenSans,
                                fontSize: 14),
                            cursorColor: blue,
                            dropdownTextStyle: const TextStyle(
                                fontSize: 16, color: blackColor),
                            focusedColor: grey636363,
                            errorBorderColor: Colors.red,
                            country:
                                Get.find<CountryController>().country.value,
                            hintText: LanguageConstants.phoneNumberText.tr,
                            onCountryChanged: (country) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                    child: TextFormField(
                      cursorColor: appColor,
                      controller: remarksController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: const EdgeInsets.only(
                          bottom: 10,
                          top: 10,
                          left: 10,
                        ),
                        hintText: LanguageConstants.enterRemarks.tr,
                        hintStyle: const TextStyle(
                            fontFamily: AppConstants.fontOpenSans,
                            fontSize: 14),
                        labelStyle: const TextStyle(color: Colors.black54),
                        errorStyle: const TextStyle(color: Colors.red),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: grey636363,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: grey636363,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: grey636363,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: grey636363,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterRemarks.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 18.0),
                CommonThemeButton(
                  onTap: () {
                    onTap?.call();
                  },
                  title: LanguageConstants.createTicket.tr,
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

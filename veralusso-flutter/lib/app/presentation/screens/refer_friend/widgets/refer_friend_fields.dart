import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/controller/refer_friend/refer_friend_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/common_text_phone_field.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_field.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'package:meta_package/translations/translations.dart';

class NameTextField extends GetView<ReferFriendController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      hintText: controller.isValid &&
              controller.yourFirstNameController.value.text == ""
          ? LanguageConstants.enterFirstName.tr
          : LanguageConstants.firstNameText.tr,
      controller: controller.yourFirstNameController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      hintFontWeight: FontWeight.w400,
      hintTextColor: grey636363,
    );
  }
}

class EmailTextField extends GetView<ReferFriendController> {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      hintText:
          controller.isValid && controller.yourEmailController.value.text == ""
              ? LanguageConstants.enterEmailAddress.tr
              : LanguageConstants.emailAddress.tr,
      controller: controller.yourEmailController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      hintFontWeight: FontWeight.w400,
      hintTextColor: grey636363,
    );
  }
}

class PhoneTextField extends GetView<ReferFriendController> {
  const PhoneTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonTextPhoneField(
        textController: controller.yourPhoneController,
        textColor: blackColor,
        cursorColor: blackColor,
        country: Get.find<CountryController>().country?.value.toString(),
        dropdownIconColor: blackColor,
        borderColor: blackColor,
        dropdownTextStyle: AppTextStyle.textStyleUtils400(),
        fontStyle: AppTextStyle.textStyleUtils400(),
        hintStyle:
            AppTextStyle.textStyleUtils400(size: 12.sp, color: grey636363),
        hintText: controller.isValid &&
                controller.yourPhoneController.value.text == ""
            ? LanguageConstants.enterPhoneNumber.tr
            : LanguageConstants.phoneNumberText.tr,
        hintColor: blackColor,
        onCountryChanged: (country) {
          controller.countryCode = country.dialCode;
        },
        validator: (value) => Validators.validateMobile(value?.number ?? ''),
      ),
    );
  }
}

class FriendFirstNameTextField extends GetView<ReferFriendController> {
  const FriendFirstNameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      controller: controller.refFirstNameController,
      hintText: controller.isValid &&
              controller.refFirstNameController.value.text == ""
          ? LanguageConstants.enterFriendFirstName.tr
          : LanguageConstants.friendFirstName.tr,
      textAlign: TextAlign.start,
      hintFontWeight: FontWeight.w400,
      keyboardType: TextInputType.name,
      hintTextColor: grey636363,
    ,
    );
  }
}

class FriendEmailTextField extends GetView<ReferFriendController> {
  const FriendEmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      controller: controller.refEmailController,
      keyboardType: TextInputType.emailAddress,
      hintText:
          controller.isValid && controller.refEmailController.value.text == ""
              ? LanguageConstants.enterFriendEmailAddress.tr
              : LanguageConstants.friendEmailAddress.tr,
      textAlign: TextAlign.start,
      hintFontWeight: FontWeight.w400,
      hintTextColor: grey636363,
    );
  }
}

class FriendPhoneTextField extends GetView<ReferFriendController> {
  const FriendPhoneTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonTextPhoneField(
        textController: controller.refPhoneController,
        textColor: blackColor,
        cursorColor: blackColor,
        dropdownIconColor: blackColor,
        borderColor: blackColor,
        focusedColor: blackColor,
        country: Get.find<CountryController>().country?.value.toString(),
        errorBorderColor: blackColor,
        dropdownTextStyle: AppTextStyle.textStyleUtils400(),
        fontStyle: AppTextStyle.textStyleUtils400(),
        hintStyle:
            AppTextStyle.textStyleUtils400(size: 12.sp, color: grey636363),
        hintText:
            controller.isValid && controller.refPhoneController.value.text == ""
                ? LanguageConstants.enterFriendPhoneNumber.tr
                : LanguageConstants.friendPhoneNumber.tr,
        hintColor: blackColor,
        onCountryChanged: (country) {
          controller.countryCode = country.dialCode;
        },
      ),
    );
  }
}

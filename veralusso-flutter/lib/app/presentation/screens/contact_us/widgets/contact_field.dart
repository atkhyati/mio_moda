import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:veralusso/app/controller/contact_us/contact_us_controller.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/common_text_phone_field.dart';
import 'package:veralusso/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class NameTextField extends GetView<ContactUsController> {
  @override
  final ContactUsController controller = Get.find();

  NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormFieldWidget(
        controller: controller.nameController,
        hintText:
            controller.isValid.value && controller.nameController.text == ""
                ? LanguageConstants.enterName.tr
                : LanguageConstants.firstNameText.tr,
        hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
        validator: (value) => Validators.validateName(value),
      ),
    );
  }
}

class SurNameTextField extends GetView<ContactUsController> {
  @override
  final ContactUsController controller = Get.find();

  SurNameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormFieldWidget(
        controller: controller.surnameController,
        hintText:
            controller.isValid.value && controller.surnameController.text == ""
                ? LanguageConstants.enterSurName.tr
                : LanguageConstants.surNameTextveralusso.tr,
        hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
        validator: (value) => Validators.validateName(value),
      ),
    );
  }
}

class EmailTextField extends GetView<ContactUsController> {
  @override
  final ContactUsController controller = Get.find();

  EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: EmailWidget(
        controller: controller.emailController,
        hintText:
            controller.isValid.value && controller.emailController.text == ""
                ? LanguageConstants.enterEmailAddress.tr
                : LanguageConstants.emailText.tr,
        hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
        validator: (value) => Validators.validateEmail(value),
      ),
    );
  }
}

class PhoneTextField extends GetView<ContactUsController> {
  @override
  final ContactUsController controller = Get.find();

  PhoneTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonTextPhoneField(
        textController: controller.phoneController,
        textColor: darkGrey,
        cursorColor: Colors.black,
        dropdownIconColor: Colors.black,
        focusedColor: Colors.black,
        country: Get.find<CountryController>().country?.value.toString(),
        errorBorderColor: Colors.black,
        dropdownTextStyle: AppTextStyle.textStyleUtils400(color: darkGrey),
        fontStyle: AppTextStyle.textStyleUtils400(color: darkGrey),
        hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
        hintText:
            controller.isValid.value && controller.phoneController.text == ""
                ? LanguageConstants.enterPhoneNumber.tr
                : LanguageConstants.phoneNumberText.tr,
        hintColor: appColor,
        onCountryChanged: (country) {
          controller.countryCode = country.dialCode;
        },
        validator: (value) => Validators.validateMobile(value?.number ?? ''),
      ),
    );
  }
}

class SubjectTextField extends GetView<ContactUsController> {
  @override
  final ContactUsController controller = Get.find();

  SubjectTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormFieldWidget(
        controller: controller.subjectController,
        hintText:
            controller.isValid.value && controller.subjectController.text == ""
                ? LanguageConstants.enterSubject.tr
                : LanguageConstants.subjectTextveralusso.tr,
        hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
        validator: (value) => Validators.validateRequired(
            value ?? '', LanguageConstants.enterSubject.tr),
      ),
    );
  }
}

class WhatsOnYourMindTextField extends GetView<ContactUsController> {
  @override
  final ContactUsController controller = Get.find();

  WhatsOnYourMindTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller.onyourmindController,
      maxLines: 5,
      hintText:
          controller.isValid.value && controller.onyourmindController.text == ""
              ? LanguageConstants.enterWhatsOnMind.tr
              : LanguageConstants.whatsonyourmindText.tr,
      hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
      validator: (value) => Validators.validateRequired(
          value ?? '', LanguageConstants.enterWhatsOnMind.tr),
    );
  }
}

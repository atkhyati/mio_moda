// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:suvandnat/app/controller/signup/signup_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class FirstNameTextFormFields extends GetView<SignUpController> {
  const FirstNameTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                padding: const EdgeInsets.all(1),
                child: DropdownButton<String>(
                  isExpanded: false,
                  style: AppTextStyle.textStyleUtils400(color: Colors.grey),
                  value: controller.selectedStatus.value,
                  iconSize: 15,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: controller.status.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: AppTextStyle.textStyleUtils300_12(
                            color: Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? val) {
                    controller.selectedStatus.value = val!;
                  },
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: controller.firstNameTextController,
                focusNode: controller.firstNameFocusNode,
                keyboardType: TextInputType.name,
                style: AppTextStyle.textStyleUtils300_12(color: Colors.black),
                decoration: InputDecoration(
                    hintText: LanguageConstants.firstNameText.tr,
                    hintStyle:
                        AppTextStyle.textStyleUtils300_12(color: Colors.grey),
                    border: InputBorder.none),
                validator: (value) => Validators.validateName(
                  value?.trim(),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(64),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LastNameTextFormFields extends GetView<SignUpController> {
  const LastNameTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormFieldWidget(
        controller: controller.lastNameTextController,
        focusNode: controller.lastNameFocusNode,
        keyboardType: TextInputType.name,
        hintText: LanguageConstants.lastNameText.tr,
        hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
        validator: (value) => Validators.validateName(
          value?.trim(),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(64),
        ],
      ),
    );
  }
}

class EmailTextFormFields extends GetView<SignUpController> {
  const EmailTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: EmailWidget(
        controller: controller.emailTextController,
        focusNode: controller.emailFocusNode,
        hintText: LanguageConstants.emailAddressText.tr,
        keyboardType: TextInputType.emailAddress,
        hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
        validator: (value) => Validators.validateEmail(
          value?.trim(),
        ),
      ),
    );
  }
}

class ConfirmEmailTextFormFields extends GetView<SignUpController> {
  const ConfirmEmailTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: EmailWidget(
      controller: controller.confirmEmailTextController,
      focusNode: controller.confirmEmailFocusNode,
      hintText: LanguageConstants.confirmEmailAddressText.tr,
      hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
      validator: (value) => Validators.validateConfirmEmail(
          value?.trim(), controller.emailTextController.text),
    ));
  }
}

class PasswordTextFormFields extends GetView<SignUpController> {
  const PasswordTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PasswordWidget(
        controller: controller.passwordTextController,
        focusNode: controller.passwordFocusNode,
        hintText: LanguageConstants.passwordText.tr,
        hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
        maxLength: 8,
        validator: (value) => Validators.validatePassword(value),
      ),
    );
  }
}

class ConfirmPasswordTextFormFields extends GetView<SignUpController> {
  const ConfirmPasswordTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PasswordWidget(
          controller: controller.confirmPasswordTextController,
          focusNode: controller.confirmPasswordFocusNode,
          hintText: LanguageConstants.confirmPasswordText.tr,
          hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
          maxLength: 8,
          validator: (value) => Validators.validateConfirmPassword(
              value, controller.passwordTextController.text)),
    );
  }
}

class DateOfBirthTextFormFields extends GetView<SignUpController> {
  const DateOfBirthTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return SizedBox(
      child: TextFormFieldWidget(
        controller: controller.dobTextController,
        focusNode: controller.dobFocusNode,
        hintText: controller.isValid && controller.dobTextController.text == ""
            ? LanguageConstants.enterDateOfBirth.tr
            : LanguageConstants.dateOfBirthText.tr,
        hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
        keyboardType: TextInputType.datetime,
        onTap: () async {
          DateTime? pickedDate;
          showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return Container(
                  height: 350.h,
                  color: backGroundColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (value) {
                            pickedDate = value;
                            print(pickedDate);
                          },
                          initialDateTime: DateTime(2010),
                          minimumDate: DateTime(1900),
                          maximumDate: DateTime.now(),
                        ),
                      ),
                      CommonThemeButton(
                          onTap: () {
                            if (pickedDate != null &&
                                pickedDate != selectedDate) {
                              debugPrint('hello $pickedDate');
                              selectedDate = pickedDate!;
                              controller.dobTextController.text =
                                  DateFormat("yyyy-MM-dd").format(selectedDate);
                              Get.back();
                            }
                          },
                          title: LanguageConstants.submitText.tr),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                );
              });
        },
        validator: (value) {
          debugPrint('date:: ${selectedDate.toString()}');
          return null;
        },
        // suffixIcon: Image.asset("assets/images/calendar.png", cacheHeight: 16),
      ),
    );
  }
}

// class MarriageAnniversaryTextFormFields extends GetView<SignUpController> {
//   const MarriageAnniversaryTextFormFields({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     DateTime selectedDate = DateTime.now();
//     return SizedBox(
//       child: TextFormFieldWidget(
//         controller: controller.domTextController,
//         focusNode: controller.domFocusNode,
//         keyboardType: TextInputType.name,
//         hintText: controller.isValid && controller.domTextController.text == ""
//             ? LanguageConstants.enterDateOfMarriage.tr
//             : LanguageConstants.marriageAnniversaryText.tr,
//         hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
//         onTap: () async {
//           final DateTime? pickedDate = await showDatePicker(
//             context: context,
//             initialDate: selectedDate,
//             firstDate: DateTime(1900),
//             lastDate: DateTime(2100),
//           );
//           controller.domTextController.text =
//               DateFormat.yMMMd().format(selectedDate);

//           if (pickedDate != null && pickedDate != selectedDate) {
//             debugPrint('hello $pickedDate');
//             selectedDate = pickedDate;
//           }
//         },
//         validator: (value) {
//           return null;
//         },
//       ),
//     );
//   }
// }

class Agreement extends GetView<SignUpController> {
  const Agreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(children: [
        Row(
          children: [
            Checkbox(
                activeColor: controller.checkBoxFillColor.value,
                value: controller.isChecked.value,
                onChanged: (value) {
                  controller.isChecked.value = !controller.isChecked.value;
                }),
            Expanded(
              child: HeadlineBodyOneBaseWidget(
                title: LanguageConstants.marketingPurposeTextSuvNat.tr,
                fontSize: 13,
                titleColor: blackColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Checkbox(
                activeColor: controller.checkBoxFillColor.value,
                checkColor: whiteColor,
                value: controller.isSelected.value,
                onChanged: (value) {
                  controller.isSelected.value = !controller.isSelected.value;
                }),
            Expanded(
              child: HeadlineBodyOneBaseWidget(
                title: LanguageConstants.marketingPurposeTextSuvNat.tr,
                fontSize: 13,
                titleColor: blackColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ]),
    );
  }
}

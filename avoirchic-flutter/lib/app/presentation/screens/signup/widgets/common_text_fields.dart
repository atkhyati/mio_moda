import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:meta_package/utils/validator.dart';

import '../../../../controller/signup_controller.dart';
import '../../../common_widgets/input_text_field_widget.dart';

class FirstNameTextFormFields extends GetView<SignUpController> {
  const FirstNameTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          child: TextFormFieldWidget(
            controller: controller.firstNameTextController.value,
            focusNode: controller.firstNameFocusNode.value,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: LanguageConstants.firstNameText.tr,
            hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
            validator: (value) => Validators.validateName(value,
                message: LanguageConstants.firstNameText.tr),
          ),
        ));
  }
}

class LastNameTextFormFields extends GetView<SignUpController> {
  const LastNameTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          child: TextFormFieldWidget(
            controller: controller.lastNameTextController.value,
            focusNode: controller.lastNameFocusNode.value,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            hintText: LanguageConstants.lastNameText.tr,
            hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
            validator: (value) => Validators.validateName(value,
                message: LanguageConstants.lastNameText.tr),
          ),
        ));
  }
}

class EmailTextFormFields extends GetView<SignUpController> {
  const EmailTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          child: EmailWidget(
            controller: controller.emailTextController.value,
            focusNode: controller.emailFocusNode.value,
            hintText: LanguageConstants.emailAddressTextavoirchic.tr,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
            validator: (value) => Validators.validateEmail(value),
          ),
        ));
  }
}

class ConfirmEmailTextFormFields extends GetView<SignUpController> {
  const ConfirmEmailTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
            child: EmailWidget(
          controller: controller.confirmEmailTextController.value,
          focusNode: controller.confirmEmailFocusNode.value,
          textInputAction: TextInputAction.next,
          hintText: LanguageConstants.confirmEmailAddressTextavoirchic.tr,
          hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
          validator: (value) => Validators.validateConfirmEmail(
              value, controller.emailTextController.value.text),
        )));
  }
}

class PasswordTextFormFields extends GetView<SignUpController> {
  const PasswordTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          child: PasswordWidget(
            controller: controller.passwordTextController.value,
            focusNode: controller.passwordFocusNode.value,
            textInputAction: TextInputAction.next,
            hintText: LanguageConstants.passwordText.tr,
            hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
            maxLength: 8,
            validator: (value) => Validators.validatePassword(value),
          ),
        ));
  }
}

class ConfirmPasswordTextFormFields extends GetView<SignUpController> {
  const ConfirmPasswordTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          child: PasswordWidget(
              controller: controller.confirmPasswordTextController.value,
              focusNode: controller.confirmPasswordFocusNode.value,
              textInputAction: TextInputAction.done,
              hintText: LanguageConstants.confirmPasswordText.tr,
              hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
              maxLength: 8,
              validator: (value) => Validators.validateConfirmPassword(
                  value?.trim() ?? '',
                  controller.passwordTextController.value.text)),
        ));
  }
}

class DateOfBirthTextFormFields extends GetView<SignUpController> {
  const DateOfBirthTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return Obx(() => SizedBox(
          child: TextFormFieldWidget(
            controller: controller.dobTextController.value,
            focusNode: controller.dobFocusNode.value,
            textStyle: AppTextStyle.textStyleUtils400(),
            hintText: controller.isValidation.value == true &&
                    controller.dobTextController.value.text == ""
                ? LanguageConstants.enterDateOfBirth.tr
                : LanguageConstants.dateOfBirthText.tr,
            hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = DateTime(2010);
              showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 350.h,
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (value) {
                                pickedDate = value;
                                debugPrint(pickedDate.toString());
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
                                  controller.dobTextController.value.text =
                                      DateFormat("yyyy-MM-dd")
                                          .format(selectedDate);
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
          ),
        ));
  }
}

// class MarriageAnniversaryTextFormFields extends GetView<SignUpController> {
//   const MarriageAnniversaryTextFormFields({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     DateTime selectedDate = DateTime.now();
//     return Obx(() => SizedBox(
//           child: TextFormFieldWidget(
//             controller: controller.domTextController.value,
//             focusNode: controller.domFocusNode.value,
//             keyboardType: TextInputType.name,
//             textStyle: AppTextStyle.textStyleUtils400(),
//             hintText: controller.isValidation.value == true &&
//                     controller.domTextController.value.text == ""
//                 ? LanguageConstants.enterDateOfMarriage.tr
//                 : LanguageConstants.marriageAnniversaryText.tr,
//             hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
//             readOnly: true,
//             onTap: () async {
//               final DateTime? pickedDate = await showDatePicker(
//                 context: context,
//                 initialDate: selectedDate,
//                 firstDate: DateTime(1900),
//                 lastDate: DateTime(2100),
//               );
//               controller.domTextController.value.text =
//                   DateFormat.yMMMd().format(pickedDate!);

//               if (pickedDate != selectedDate) {
//                 debugPrint('hello $pickedDate');
//                 selectedDate = pickedDate;
//               }
//             },
//             validator: (value) {
//               return null;
//             },
//           ),
//         ));
//   }
// }

class Agreement extends GetView<SignUpController> {
  const Agreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Row(
              children: [
                Checkbox(
                    activeColor: controller.checkBoxFillColor.value,
                    value: controller.isChecked.value,
                    onChanged: (value) {
                      controller.isChecked.value = !controller.isChecked.value;
                    }),
                Expanded(
                  child: CommonTextPoppins(
                    LanguageConstants.marketingPurposeTextAvoirChic.tr,
                    fontSize: 13,
                    color: primary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: controller.checkBoxFillColor.value,
                    checkColor: whiteColor,
                    value: controller.isSelected.value,
                    onChanged: (value) {
                      controller.isSelected.value =
                          !controller.isSelected.value;
                    }),
                Expanded(
                  child: CommonTextPoppins(
                    LanguageConstants.shoppingHabitTextAvoirChic.tr,
                    fontSize: 13,
                    color: primary,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class CreateAnAccountButton extends GetView<SignUpController> {
  const CreateAnAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonThemeButton(
        onTap: () async {
          if (controller.isRegister.value) {
            controller.onSave(context);
          } else {
            await controller.signUpUser();
          }
        },
        title: controller.isRegister.value
            ? LanguageConstants.save.tr
            : LanguageConstants.createAccountText.tr,
      ),
    );
  }
}

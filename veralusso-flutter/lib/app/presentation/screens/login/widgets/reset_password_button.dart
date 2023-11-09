import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/forgot_password/forget_password_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';

class ResetPasswordButton extends GetView<ForgetPasswordMenuController> {
  @override
  final ForgetPasswordMenuController controller = Get.find();
  ResetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonThemeButton(
      onTap: () {
        controller.isValidation.value = true;
        if (controller.formKey.currentState?.validate() ?? false) {
          controller.getForgetPasswordResponse(
              email: controller.emailController.value.text);
        }
      },
      title: LanguageConstants.submitText.tr,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:suvandnat/app/controller/login/forget_password_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class ForgotPasswordScreen extends GetView<ForgetPasswordMenuController> {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final ForgetPasswordMenuController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(
          title: LanguageConstants.forgetPassword.tr,
        ),
        body: Form(
          key: controller.formKey.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height / 4),
                  forgotPasswordTextField(),
                  const SizedBox(height: 20),
                  resetPasswordButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget forgotPasswordTextField() {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderGrey, width: 2.0),
      ),
      child: TextFormField(
        controller: controller.emailController.value,
        validator: (value) => Validators.validateEmail(value),
        decoration: InputDecoration(
          hintText: LanguageConstants.enterEmail.tr,
          hintStyle:
              AppTextStyle.textStyleUtils400_16(color: const Color(0xff535353)),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.all(8.0),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(64),
        ],
      ),
    );
  }

  Widget resetPasswordButton(BuildContext context) {
    return CommonThemeButton(
      onTap: () {
        if (controller.formKey.value.currentState?.validate() ?? false) {
          controller.getForgetPasswordResponse(
              email: controller.emailController.value.text);
        }
      },
      title: LanguageConstants.resetPassword.tr,
    );
  }
}

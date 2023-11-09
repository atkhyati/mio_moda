import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:veralusso/app/controller/login/login_controller.dart';
import 'package:veralusso/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

class LoginTextFormFields extends GetView<LoginController> {
  @override
  final LoginController controller = Get.find();

  LoginTextFormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          SizedBox(
            child: EmailWidget(
                controller: controller.emailTextController,
                focusNode: controller.emailFocusNode,
                hintText: LanguageConstants.emailText.tr,
                keyboardType: TextInputType.emailAddress,
                hintStyle: AppTextStyle.textStyleUtils400(),
                validator: (value) => Validators.validateEmail(value)),
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            child: PasswordWidget(
                controller: controller.passwordTextController,
                focusNode: controller.passwordFocusNode,
                hintText: LanguageConstants.passwordText.tr,
                hintStyle: AppTextStyle.textStyleUtils400(),
                maxLength: 8,
                validator: (value) => Validators.validatePassword(value)),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

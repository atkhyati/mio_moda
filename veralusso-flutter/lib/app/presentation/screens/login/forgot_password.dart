import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:veralusso/app/controller/forgot_password/forget_password_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/screens/login/widgets/reset_password_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../../common_widget/input_text_field_widget.dart';

class ForgotPasswordScreen extends GetView<ForgetPasswordMenuController> {
  @override
  final ForgetPasswordMenuController controller = Get.find();

  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: commonAppbar(
            title: LanguageConstants.forgetPassword.tr,
          ),
          backgroundColor: whiteColor,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Text(
                        LanguageConstants.forgotYourPasswordDescriptionText.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400_16(),
                      ),
                      const SizedBox(height: 20),
                      Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: EmailWidget(
                              controller: controller.emailController,
                              hintText: LanguageConstants.enterYourEmailText.tr,
                              keyboardType: TextInputType.emailAddress,
                              hintStyle: AppTextStyle.textStyleUtils400_16(
                                  color: emailaddressColor),
                              validator: (value) =>
                                  Validators.validateEmail(value))),
                      const SizedBox(height: 20),
                      ResetPasswordButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: blackColor,
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}

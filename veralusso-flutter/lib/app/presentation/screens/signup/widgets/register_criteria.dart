import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/signup/signup_controller.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';

class RegisterCriteria extends GetView<SignUpController> {
  @override
  final SignUpController controller = Get.find();

  RegisterCriteria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 50.h,
            width: 327.w,
            child: CommonThemeButton(
              title: controller.isRegister.value
                  ? LanguageConstants.save.tr
                  : LanguageConstants.createAccountText.tr,
              onTap: () {
                if (controller.isRegister.value) {
                  controller.onSave(context);
                } else {
                  controller.signUpUser();
                }
              },
            )),
        const SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}

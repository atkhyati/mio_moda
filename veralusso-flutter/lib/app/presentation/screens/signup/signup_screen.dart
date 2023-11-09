import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:veralusso/app/controller/signup/signup_controller.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../../../core/utils/lang_directory/language_constant.dart';
import 'widgets/agreement_widget.dart';
import 'widgets/register_criteria.dart';
import 'widgets/signup_text_fields.dart';

class SignUpScreen extends GetView<SignUpController> {
  @override
  final SignUpController controller = Get.find();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            backgroundColor: whiteColor,
            body: Column(
              children: [
                // commonAppbar(title: LanguageConstant.signUpText.tr),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.0),
                      child: GetBuilder<SignUpController>(
                        id: "SigUp",
                        builder: (controller) {
                          return Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      LanguageConstants.signUpText.tr,
                                      style: AppTextStyle.textStyleUtils600(
                                          size: 30.sp),
                                    )),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                EmailTextFormFields(),
                                SizedBox(
                                  height: 15.h,
                                ),
                                if (!controller.isRegister.value)
                                  ConfirmEmailTextFormFields(),
                                if (!controller.isRegister.value)
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                if (!controller.isRegister.value)
                                  PasswordTextFormFields(),
                                if (!controller.isRegister.value)
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                if (!controller.isRegister.value)
                                  ConfirmPasswordTextFormFields(),
                                if (!controller.isRegister.value)
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                FirstNameTextFormFields(),
                                SizedBox(
                                  height: 15.h,
                                ),
                                LastNameTextFormFields(),
                                SizedBox(
                                  height: 15.h,
                                ),
                                if (!controller.isRegister.value)
                                  DateOfBirthTextFormFields(),
                                // SizedBox(
                                //   height: 15.h,
                                // ),
                                // DateOfMarriageTextFormFields(),

                                SizedBox(
                                  height: 30.h,
                                ),
                                if (!controller.isRegister.value)
                                  AgreementWidget(),
                                RegisterCriteria(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          controller.isLoading.value
              ? const ScreenLoading()
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

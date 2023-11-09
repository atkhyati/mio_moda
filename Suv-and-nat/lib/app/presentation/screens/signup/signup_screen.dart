// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/signup/signup_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/screens/signup/widgets/common_text_fields.dart';

///
/// [SignUpScreen]
///
class SignUpScreen extends GetView<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(appBarColor: Colors.transparent),
        body: Stack(
          children: [
            GetBuilder<SignUpController>(
              id: "SignIn",
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30.w,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                    controller.isRegister.value
                                      ? LanguageConstants.editUser.tr
                                      : LanguageConstants.signUpText.tr,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 30.w,
                              ),
                              const EmailTextFormFields(),
                              SizedBox(
                                height: 15.h,
                              ),
                              if (!controller.isRegister.value)
                                const ConfirmEmailTextFormFields(),
                              if (!controller.isRegister.value)
                                SizedBox(
                                  height: 15.h,
                                ),
                              if (!controller.isRegister.value)
                                const PasswordTextFormFields(),
                              if (!controller.isRegister.value)
                                SizedBox(
                                  height: 15.h,
                                ),
                              if (!controller.isRegister.value)
                                const ConfirmPasswordTextFormFields(),
                              if (!controller.isRegister.value)
                                SizedBox(
                                  height: 15.h,
                                ),
                              const FirstNameTextFormFields(),
                              SizedBox(
                                height: 15.h,
                              ),
                              const LastNameTextFormFields(),
                              SizedBox(
                                height: 15.h,
                              ),
                              if (!controller.isRegister.value)
                                const DateOfBirthTextFormFields(),
                              if (!controller.isRegister.value)
                                SizedBox(
                                  height: 15.h,
                                ),
                              // SizedBox(
                              //   height: 40,
                              //   child: TextFormFieldWidget(
                              //     controller: controller.domTextController,
                              //     focusNode: controller.domFocusNode,
                              //     keyboardType: TextInputType.name,
                              //     hintText: controller.isValid &&
                              //             controller.domTextController.text ==
                              //                 ""
                              //         ? LanguageConstants.dateOfMarriage.tr
                              //         : LanguageConstants
                              //             .marriageAnniversaryText.tr,
                              //     hintStyle: AppTextStyle.textStyleUtils300_12(
                              //         color: Colors.grey),
                              //     onTap: () async {
                              //       final DateTime? pickedDate =
                              //           await showDatePicker(
                              //         context: context,
                              //         initialDate: selectedDate,
                              //         firstDate: DateTime(1900),
                              //         lastDate: DateTime(2100),
                              //       );
                              //       controller.domTextController.text =
                              //           DateFormat.yMMMd().format(selectedDate);

                              //       if (pickedDate != null &&
                              //           pickedDate != selectedDate) {
                              //         debugPrint('hello $pickedDate');
                              //         selectedDate = pickedDate;
                              //       }
                              //     },
                              //     validator: (value) {
                              //       return null;
                              //     },
                              //     suffixIcon: Image.asset(AppAsset.calendar,
                              //         cacheHeight: 16),
                              //   ),
                              // ),
                              if (!controller.isRegister.value)
                                const SizedBox(
                                  height: 5.0,
                                ),
                              if (!controller.isRegister.value)
                                const Agreement(),
                              const SizedBox(
                                height: 15.0,
                              ),
                              CommonThemeButton(
                                onTap: () {
                                  if (controller.isRegister.value) {
                                    controller.onSave(context);
                                  } else {
                                    controller.signUpUser();
                                  }
                                },
                                title: controller.isRegister.value
                                    ? LanguageConstants.save.tr
                                    : LanguageConstants.createAccountText.tr,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Obx(
              () => controller.isSignUpApiCall.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xFF973133),
                      ),
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}

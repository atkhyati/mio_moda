import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:veralusso/app/controller/guest_returns/guest_returns_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_field.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class GuestReturnsScreen extends GetView<GuestReturnsController> {
  const GuestReturnsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: LanguageConstants.trackYourOrder.tr,
      ),
      body: ListView(
        padding: EdgeInsets.all(24.w),
        children: [
          SizedBox(height: 20.h),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CommonTextPoppins(
                    LanguageConstants.guestUser.tr,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h),
                CommonTextField(
                  controller: controller.orderIdController,
                  hintText: LanguageConstants.orderIdText.tr,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: grey636363,
                  validator: (value) => Validators.validateRequired(
                      value?.trim() ?? '', LanguageConstants.orderIdText.tr),
                ),
                SizedBox(height: 20.w),
                CommonTextField(
                  controller: controller.billingLastnameController,
                  hintText: LanguageConstants.billingLastName.tr,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: grey636363,
                ),
                SizedBox(height: 40.w),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CommonTextPoppins(
                    LanguageConstants.findOrderby.tr,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 20.w),
                CommonTextField(
                  controller: controller.emailController,
                  hintText: LanguageConstants.email.tr,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: grey636363,
                  validator: (value) => Validators.validateEmail(
                    value?.trim(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.w),
          Obx(
            () => controller.isOrderLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: appColor,
                    ),
                  )
                : Center(
                    child: CommonThemeButton(
                        onTap: () {
                          if (controller.formKey.currentState?.validate() ??
                              false) {
                            controller.getGuestTrackYourOrder();
                          }
                        },
                        title: LanguageConstants.letsGoText.tr),
                  ),
          ),

          SizedBox(height: 40.w),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LanguageConstants.subsubcribeText.tr.toUpperCase(),
                style: AppTextStyle.textStyleUtils500(size: 14.sp),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    LanguageConstants.getAllTheLatestText.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400(size: 12.sp),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.w),
          Form(
            key: controller.formKey1,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.subscribeEmailController,
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: textFieldBoarderColor, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: textFieldBoarderColor, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: textFieldBoarderColor, width: 2)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: textFieldBoarderColor, width: 2)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: textFieldBoarderColor, width: 2)),
                          hintText: LanguageConstants.email.tr,
                          hintStyle: AppTextStyle.textStyleUtils400(
                              size: 12.sp, color: grey636363),
                        ),
                        validator: (value) => Validators.validateEmail(
                          value?.trim(),
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() => controller.isLoading.value
                    ? const Center(
                        child: SpinKitThreeBounce(
                        color: Colors.black,
                        // size: 50.0,
                      ))
                    : const SizedBox())
              ],
            ),
          ),
          SizedBox(height: 20.w),
          Align(
            alignment: Alignment.center,
            child: CommonThemeButton(
                onTap: () {
                  if (controller.formKey1.currentState?.validate() ?? false) {
                    controller.subscribeNewsLetter(
                        controller.subscribeEmailController.text);
                  }
                },
                title: LanguageConstants.specialSizeSubscribeText.tr),
          ),
          // const SizedBox(height: 14),
          // Container(height: 1.0, width: double.infinity, color: borderGrey),
          SizedBox(height: 40.w),
        ],
      ),
    );
  }
}

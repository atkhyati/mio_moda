import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:suvandnat/app/controller/guest_returns/guest_returns_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class GuestReturnsScreen extends GetView<GuestReturnsController> {
  const GuestReturnsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List<String> _addressList = [LanguageConstants.addressBook.tr];
    // final controller = Get.put(GuestReturnsController());

    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: CommonTextPoppins(
            LanguageConstants.trackOrderText.tr,
            color: blackColor,
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(24.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: 20.w),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CommonTextPoppins(
                    LanguageConstants.guestUser.tr,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.w),
                TextFormFieldWidget(
                  controller: controller.orderIdController,
                  hintText: LanguageConstants.orderIdText.tr,
                  validator: (value) => Validators.validateRequired(
                      value?.trim() ?? '', LanguageConstants.orderIdText.tr),
                ),
                SizedBox(height: 20.w),
                TextFormFieldWidget(
                  controller: controller.billingLastnameController,
                  hintText: LanguageConstants.billingLastName.tr,
                  validator: (value) => Validators.validateName(
                    value?.trim(),
                  ),
                ),
                SizedBox(height: 40.w),
                Align(
                    alignment: Alignment.centerLeft,
                    child: CommonTextPoppins(
                      LanguageConstants.findOrderby.tr,
                      fontSize: 14.sp,
                    )),
                SizedBox(height: 20.w),
                TextFormFieldWidget(
                  controller: controller.emailController,
                  hintText: LanguageConstants.email.tr,
                  validator: (value) => Validators.validateEmail(
                    value?.trim(),
                  ),
                ),
                SizedBox(height: 40.w),
                SizedBox(
                  child: Obx(
                    () => controller.isOrderLoading.value
                        ? const Center(
                            child: SpinKitThreeBounce(color: appColorPrimary),
                          )
                        : Center(
                            child: CommonThemeButton(
                                onTap: () {
                                  if (controller.formKey.currentState
                                          ?.validate() ??
                                      false) {
                                    controller.getGuestTrackYourOrder();
                                  }
                                },
                                title: LanguageConstants.letsGoText.tr),
                          ),
                  ),
                ),
                SizedBox(height: 40.w),
                Text(
                  LanguageConstants.subsubcribeText.tr,
                  style: AppTextStyle.textStyleUtils500(size: 14.sp),
                ),
                SizedBox(height: 20.w),
                Text(
                  LanguageConstants.getAllTheLatestText.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400(size: 12.sp),
                ),
                SizedBox(height: 40.w),
                Form(
                  key: controller.formKey1,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: TextFormFieldWidget(
                                hintText:
                                    LanguageConstants.enterEmailAddress.tr,
                                controller: controller.subscribeEmailController,
                                validator: (value) => Validators.validateEmail(
                                  value?.trim(),
                                ),
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
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  child: CommonThemeButton(
                      onTap: () {
                        if (controller.formKey1.currentState?.validate() ??
                            false) {
                          controller.subscribeNewsLetter(
                              controller.subscribeEmailController.text);
                        }
                      },
                      title: LanguageConstants.specialSizeSubscribeText.tr),
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

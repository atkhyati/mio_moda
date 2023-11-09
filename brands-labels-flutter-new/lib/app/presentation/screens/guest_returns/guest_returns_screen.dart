import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/guest_returns_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meta_package/utils/validator.dart';

class GuestReturnsScreen extends GetView<GuestReturnsController> {
  const GuestReturnsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: LanguageConstants.trackOrderText.tr,
      ),
      // bottomNavigationBar: ,
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
              Obx(
                () => controller.isOrderLoading.value
                    ? const Center(
                        child: SpinKitThreeBounce(
                        color: appBarPrimary,
                      ))
                    : Center(
                        child: SizedBox(
                          height: 40.w,
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
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(color: borderGrey),
                        borderRadius: BorderRadius.circular(12)),
                    child: Form(
                      key: controller.formKey1,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  // height: 40.w,
                                  child: TextFormField(
                                    controller:
                                        controller.subscribeEmailController,
                                    decoration: InputDecoration(
                                      filled: false,
                                      hintText: LanguageConstants
                                          .enterEmailAddress.tr,
                                      labelStyle:
                                          AppTextStyle.textStyleUtils400(
                                              color: Colors.black54),
                                      errorStyle:
                                          AppTextStyle.textStyleUtils400(),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none),
                                      isDense: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none),
                                    ),
                                    validator: (value) {
                                      if (Validators.validateEmail(
                                              value?.trim() ?? '') !=
                                          null) {
                                        controller.isInValid.value =
                                            false; //To update error message
                                        controller.isInValid.value = true;
                                      } else {
                                        controller.isInValid.value = false;
                                      }
                                      return null;
                                    },
                                    // validator: (value) =>
                                    //     Validators.validateEmail(
                                    //   value?.trim(),
                                    // ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.w,
                                child: CommonThemeButton(
                                    onTap: () {
                                      if ((controller.formKey1.currentState
                                                  ?.validate() ??
                                              false) &&
                                          controller.isInValid.value == false) {
                                        controller.isInValid.value == true;
                                        controller.subscribeNewsLetter();
                                      }
                                    },
                                    title: LanguageConstants
                                        .specialSizeSubscribeText.tr),
                              ),
                            ],
                          ),
                          Obx(() => controller.isLoading.value
                              ? const Center(
                                  child: SpinKitThreeBounce(
                                    color: appBarPrimary,
                                  ),
                                )
                              : const SizedBox()),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => controller.isInValid.value == true
                        ? _handleError(
                            context, controller.subscribeEmailController.text)
                        : Container(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _handleError(BuildContext context, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, top: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          Validators.validateEmail(value.trim()) ?? "",
          style: AppTextStyle.textStyleUtils400(size: 12.sp, color: Colors.red),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

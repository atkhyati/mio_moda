import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class ForgetPasswordMenuScreen extends StatelessWidget {
  const ForgetPasswordMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: () {
          Get.until((route) =>
                      route.settings.name == RoutesConstants.loginScreen);
        },
        icon: const Icon(Icons.arrow_back),
        ),
        
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // controller.getForgetPasswordResponse();
                },
                child: Text(
                  LanguageConstants.pleaseCheckYourInbox.tr,
                  style: AppTextStyle.textStyleUtils600(),
                ),
              ),
               SizedBox(height: 20.w),
              Text(
                LanguageConstants.forgetPasswordContain.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils400(size: 14.sp),
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageConstants.writeAt.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400(size:  14.sp),
                  ),
                  Text(
                    'care@veralusso.com',
                    style: AppTextStyle.textStyleUtilsUnderLine16(size: 14.sp),
                  ),
                ],
              ),
               SizedBox(height: 20.h),
              CommonThemeButton(
                isOutLined: true,
                buttonColor: whiteColor,
                textColor: blackColor,
                onTap: () {
                  Get.offAllNamed(RoutesConstants.dashboardScreen);
                },
                title:
                  LanguageConstants.continueShopping.tr,
                  
              ),
              const SizedBox(height: 10),
              CommonThemeButton(
                onTap: () {
                  Get.until((route) =>
                      route.settings.name == RoutesConstants.loginScreen);
                },
                title:
                  LanguageConstants.backToSignInScreen.tr,
                  
              ),
            ],
          ),
        ),
      ),
    );
  }
}

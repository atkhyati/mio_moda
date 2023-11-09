import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';

class ForgetPasswordMenuScreen extends StatelessWidget {
  const ForgetPasswordMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        appBar: commonAppbar(title: LanguageConstants.forgetPassword.tr),
        // key: controller.formKey.value,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 112,width: double.infinity,),
             
              const SizedBox(height: 15),
              Text(
                LanguageConstants.forgetPasswordContain.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils400(),
              ),
              const SizedBox(height: 30),
              CommonThemeButton(
                onTap: () async {
                  Get.offAllNamed(RoutesConstants.dashboardScreen);
                },
                
                  title: LanguageConstants.continueShopping.tr,
                 
              ),
              const SizedBox(height: 10),
              CommonThemeButton(
                onTap: () async {
                  Get.back();
                },
                
                  title: LanguageConstants.backToSignInScreen.tr,
                 
              ),
            ],
          ),
        ),
      ),
    );
  }
}

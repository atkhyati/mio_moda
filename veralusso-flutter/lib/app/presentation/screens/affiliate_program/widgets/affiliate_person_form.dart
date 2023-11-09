import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/affiliate_program/affiliate_program_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../core/utils/lang_directory/language_constant.dart';
import 'address_part_widget.dart';
import 'profile_part_widget.dart';

class AffiliatePersonForm extends StatelessWidget {
  const AffiliatePersonForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: GetBuilder<AffiliateProgramController>(
        id: "affi",
        builder: (controller) {
          return Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: controller.formKey.value,
            child: Column(
              children: [
                ProfilePartWidget(),
                const SizedBox(
                  height: 16.0,
                ),
                AddressPartWidget(),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  
                  child: CommonThemeButton(
                    onTap: () {
                      controller.onTap();
                    },
                    title:
                      LanguageConstants.submitText.tr,
                    
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

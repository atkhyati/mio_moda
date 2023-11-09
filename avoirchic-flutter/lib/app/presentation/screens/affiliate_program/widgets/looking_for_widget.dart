import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LookingForWidget extends StatelessWidget {
  const LookingForWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextPoppins(
            LanguageConstants.whoAreWeLookingTitleText.tr,
            fontSize: 16.sp,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              LanguageConstants.whoAreWeLookingDescriptionOneText.tr,
              style: AppTextStyle.textStyleUtils400(),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}

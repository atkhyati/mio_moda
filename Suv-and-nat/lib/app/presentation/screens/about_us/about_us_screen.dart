import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(title: LanguageConstants.aboutUsText.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Text(LanguageConstants.aboutUsTitlesuv.tr,
                    textAlign: TextAlign.center,
                    style:
                    AppTextStyle.textStyleUtilsUnderLine14(thickness: 1)),
                const SizedBox(height: 20),
                Text(LanguageConstants.aboutUsContain.tr,
                    textAlign: TextAlign.justify,
                    style: AppTextStyle.textStyleUtils300(size: 13)),
                const SizedBox(height: 18),
                Text(LanguageConstants.aboutUsContain1suv.tr,
                    textAlign: TextAlign.justify,
                    style: AppTextStyle.textStyleUtils300(size: 13)),
                const SizedBox(height: 18),
                Text(LanguageConstants.aboutUsContain2suv.tr,
                    textAlign: TextAlign.justify,
                    style: AppTextStyle.textStyleUtils300(size: 13)),
                const SizedBox(height: 18),
                Text(LanguageConstants.aboutUsContain3suv.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils300(size: 13)),
                const SizedBox(height: 18),
                Text(LanguageConstants.aboutUsContain4suv.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils300(size: 13)),
                const SizedBox(height: 18),
                Text(LanguageConstants.aboutUsContain5suv.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils300(size: 13)),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

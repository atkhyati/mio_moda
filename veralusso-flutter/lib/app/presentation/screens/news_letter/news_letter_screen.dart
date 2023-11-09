import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/news_letter/news_lettter_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import '../../common_widget/common_widget/common_appbar.dart';
import '../../common_widget/common_widget/common_theme_button.dart';
import 'widgets/check_box_container.dart';

class NewsLetterScreen extends GetView<NewsLetterController> {
  const NewsLetterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: commonAppbar(title: LanguageConstants.editNewsletter.tr),
      appBar: commonAppbar(title: ""),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              LanguageConstants.myAccountText.tr,
              style: AppTextStyle.textStyleUtils700(),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Text(
            LanguageConstants.communicationPreference.tr,
            style: AppTextStyle.textStyleUtilsUnderLine14(
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            LanguageConstants.subscribeToBeTheFirstText.tr,
            style: AppTextStyle.textStyleUtils400(size: 13.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            LanguageConstants.subscribeToNewsletters.tr,
            style: AppTextStyle.textStyleUtils400_12(
                color: Colors.black.withOpacity(0.7)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CheckBoxContainer(text: LanguageConstants.email.tr),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Obx(
            () => controller.isLoading.isTrue
                ? const Center(
                    child: SpinKitThreeBounce(
                    color: Colors.black,
                    // size: 50.0,
                  ))
                : SizedBox(
                    height: 35.w,
                    width: 150.w,
                    child: CommonThemeButton(
                      onTap: () {
                        controller.subscribeNewsLetter();
                      },
                      title: LanguageConstants.saveText.tr,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

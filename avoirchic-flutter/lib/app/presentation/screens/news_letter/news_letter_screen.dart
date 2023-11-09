import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/screens/news_letter/widgets/checkbox_container.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../controller/news_lettter_controller.dart';
import '../../../theme/colors.dart';

class NewsLetterScreen extends GetView<NewsLetterController> {
  const NewsLetterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                LanguageConstants.myAccountText.tr,
                style: AppTextStyle.textStyleUtils700(color: textDarkBlue),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Text(
              LanguageConstants.communicationPreference.tr,
              style:
                  AppTextStyle.textStyleUtils700(color: textDarkBlue).copyWith(
                decoration: TextDecoration.underline,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Text(
                LanguageConstants.subscribeOffersAndMore.tr,
                style: AppTextStyle.textStyleUtils400(
                  size: 14.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              LanguageConstants.subscribeNewsletters.tr,
              style: AppTextStyle.textStyleUtils400_12(
                color: Colors.black.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxContainer(
                    text: LanguageConstants.email.tr,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(() => controller.isLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                    color: Color(0xff367587),
                    // size: 50.0,
                  ))
                : CommonThemeButton(
                    onTap: () {
                      controller.subscribeNewsLetter();
                    },
                    title: LanguageConstants.save.tr,
                  ))
          ],
        ),
      ),
    );
  }
}

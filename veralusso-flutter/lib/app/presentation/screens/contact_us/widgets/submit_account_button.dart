import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/contact_us/contact_us_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';

class SubmitAccountButton extends GetView<ContactUsController> {
  @override
  final ContactUsController controller = Get.find();
  SubmitAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonThemeButton(
        onTap: () {
          controller.submitButton(context);
        },
        title:
          LanguageConstants.submitText.tr,
         
      ),
    );
  }
}

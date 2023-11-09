import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/special_request/special_request_controller.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';

import '../../../common_widget/common_widget/common_theme_button.dart';

class SubmitAccountButton extends GetView<SpecialRequestController> {
  @override
  final SpecialRequestController controller = Get.find();
  SubmitAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonThemeButton(
        onTap: () {
          controller.contactUsPost(
            context,
          );
        },
        title: LanguageConstants.submitText.tr,
      ),
    );
  }
}

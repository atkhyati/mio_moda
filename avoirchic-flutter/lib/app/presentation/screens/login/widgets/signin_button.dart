import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/login_controller.dart';

class SignInButtonWidget extends GetView<LoginController> {
  const SignInButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CommonThemeButton(
        onTap: () {
          controller.loginUser();
        },
       title:
          LanguageConstants.signInText.tr,
      ),
    );
  }
}

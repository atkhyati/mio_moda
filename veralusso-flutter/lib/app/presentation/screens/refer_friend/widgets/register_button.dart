import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/controller/refer_friend/refer_friend_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';

class RegisterButton extends GetView<ReferFriendController> {
  @override
  final ReferFriendController controller = Get.find();
  RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonThemeButton(
      onTap: () {
        FocusScope.of(Get.context!).requestFocus(FocusNode());
        controller.postData();
      },
      title:
        LanguageConstants.registerText.tr,
       
    );
  }
}

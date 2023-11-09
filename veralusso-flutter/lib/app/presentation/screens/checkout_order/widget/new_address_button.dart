import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';

class NewAddressButton extends GetView<CheckoutOrderController> {
  @override
  final CheckoutOrderController controller = Get.find();
  NewAddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CommonThemeButton(
        onTap: () {
          debugPrint("Aaa->");
          controller.showDialogAddress(context);
        },
       title:
          LanguageConstants.newAddressText.tr,
        
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/signup/signup_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veralusso/app/theme/theme_exports.dart';

class AgreementWidget extends GetView<SignUpController> {
  AgreementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Column(children: [
        Row(
          children: [
            Checkbox(
                activeColor: controller.checkBoxFillColor.value,
                value: controller.isChecked.value,
                onChanged: (value) {
                  controller.isChecked.value = !controller.isChecked.value;
                }),
            Expanded(
              child: HeadlineBodyOneBaseWidget(
                title: LanguageConstants.marketingPurposeText.tr,
                fontSize: 13.sp,
                titleColor: blackColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Checkbox(
                activeColor: controller.checkBoxFillColor.value,
                checkColor: whiteColor,
                value: controller.isSelected.value,
                onChanged: (value) {
                  controller.isSelected.value = !controller.isSelected.value;
                }),
            Expanded(
              child: HeadlineBodyOneBaseWidget(
                title: LanguageConstants.shoppingHabitText.tr,
                fontSize: 13.sp,
                titleColor: blackColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ]),
    );
  }
}

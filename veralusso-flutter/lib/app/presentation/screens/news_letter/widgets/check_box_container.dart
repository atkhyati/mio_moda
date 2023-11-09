import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../../../../controller/news_letter/news_lettter_controller.dart';

class CheckBoxContainer extends GetView<NewsLetterController> {
  final String text;

  const CheckBoxContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            // controller.isEmailSelected.value =
            //     !controller.isEmailSelected.value;//Email is mandatory
          },
          child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                border: Border.all(color: blackColor, width: 1.5),
              ),
              child: Obx(
                () => controller.isEmailSelected.value
                    ? const Icon(Icons.check, color: blackColor, size: 12)
                    : const SizedBox(),
              )),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: AppTextStyle.textStyleUtils500_12(),
        )
      ],
    );
  }
}

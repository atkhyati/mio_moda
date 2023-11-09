import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/returns_and_refunds/returns_and_refunds_controller.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class Contain extends GetView<ReturnsAndRefundsController> {
  final bool isSelected;

  final String? contain;

  const Contain({Key? key, required this.isSelected, required this.contain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Text(
              contain!,
              style: AppTextStyle.textStyleUtils400(),
            ),
          )
        : const SizedBox();
  }
}

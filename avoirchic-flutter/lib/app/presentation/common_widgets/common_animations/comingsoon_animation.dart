import 'package:avoirchic/app/core/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CommingsoonAnimationWidget extends StatelessWidget {
  const CommingsoonAnimationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160.w,
        width: double.infinity,
        child: Lottie.asset(ImageConstant.commingSoonAnimation,
            repeat: false, animate: true));
  }
}

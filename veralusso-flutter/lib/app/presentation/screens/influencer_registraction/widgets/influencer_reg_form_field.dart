// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class InfluencerRegFormField extends StatelessWidget {
  final String hintText;
  final bool? desableBorder;
  final double? height;
  final double? bottomPadding;
  final double? topPadding;
  final VoidCallback? validation;
  final TextEditingController? controller;
  final Color? color;
  final TextInputType? keyboardType;

  const InfluencerRegFormField(
      {Key? key,
      required this.hintText,
      this.height,
      this.desableBorder,
      this.bottomPadding,
      this.topPadding,
      this.validation,
      this.controller,
      this.color,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color ?? Colors.transparent,
          width: 2,
        ),
      ),
      child: TextFormField(
        controller: controller,
        // validator: validation,
        cursorColor: blackColor,
        style: AppStyle.textStyleUtils400(size: 14.sp),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: AppStyle.textStyleUtils400(size: 12.sp, color: grey636363),
        ),
        keyboardType: keyboardType ?? TextInputType.text,
      ),
    );
  }
}

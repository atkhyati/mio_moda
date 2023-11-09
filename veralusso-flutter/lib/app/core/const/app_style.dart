import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'app_constants.dart';

class AppStyle {
  static Size appBarSize = Size.fromHeight(60.h);

  static TextStyle commonTextStyle400({double? size, Color? color}) {
    return TextStyle(
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w400,
      color: color ?? blackColor,
      fontSize: size ?? 14.sp,
    );
  }

  static TextStyle commonTextStyle500({double? size, Color? color}) {
    return TextStyle(
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w500,
      color: color ?? blackColor,
      fontSize: size ?? 14.sp,
    );
  }

  static TextStyle subTextStyle500(
      {double? size, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: size ?? 14.sp,
      color: color ?? blackColor,
    );
  }

  static TextStyle subTextStyle400({double? size}) {
    return TextStyle(
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w400,
      fontSize: size ?? 14.sp,
      color: blackColor,
    );
  }

  static TextStyle subTextStyleUnderLine600(
      {double? size, FontWeight? fontWeight}) {
    return TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: blackColor,
      decorationThickness: 1,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: fontWeight ?? FontWeight.w600,
      fontSize: size ?? 12.sp,
      color: blackColor,
    );
  }

  static TextStyle commonTextStyle16400() {
    return  TextStyle(
      color: blackColor,
      fontSize: 16.sp,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle commonTextStyle20400({double? size}) {
    return TextStyle(
      color: blackColor,
      fontSize: size ?? 20,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle commonTextStyle20600({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 20,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle commonTextStyleOpen400({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 20,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle commonTextStyle16500() {
    return  TextStyle(
      color: blackColor,
      fontSize: 16.sp,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle commonTextStyle16() {
    return  TextStyle(
      color: blackColor,
      fontSize: 16.sp,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle commonTextStyleBold16() {
    return TextStyle(
      color: blackColor,
      fontSize: Get.width > 480 ? 16.sp : 14.sp,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle commonTextStyle300() {
    return  TextStyle(
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w300,
      fontSize: 16.sp,
      color: Colors.black,
    );
  }

  static TextStyle commonTextStyle600({double fontSize = 16}) {
    return TextStyle(
      fontFamily: AppConstants.fontMontserrat,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: Colors.black,
    );
  }

  static TextStyle headerTextStyle() {
    return TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: blackColor,
      decorationThickness: 1,
      fontFamily: AppConstants.fontMontserrat,
      color: blackColor,
      fontWeight: FontWeight.w400,
      fontSize: 18.sp,
    );
  }

  static TextStyle subTextStyle() {
    return  TextStyle(
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: grey636363,
    );
  }

  static TextStyle commonTextStyleUnderLine() {
    return  TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: blackColor,
      decorationThickness: 1,
      fontFamily: AppConstants.fontMontserrat,
      color: blackColor,
      fontWeight: FontWeight.w600,
      fontSize: 18.sp,
    );
  }

  static TextStyle linkTextStyleUtils600() {
    return  TextStyle(
      color: contentGrey,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
    );
  }

  static TextStyle textStyleUtils16() {
    return  TextStyle(
      color: blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 16.sp,
    );
  }

  static TextStyle textStyleUtilsUnderLine16() {
    return  TextStyle(
      color: blackColor,
      decoration: TextDecoration.underline,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 16.sp,
    );
  }

  static TextStyle textStyleUtils600(
      {double? size, Color color = blackColor, FontWeight? fontWeight}) {
    return TextStyle(
      color: color,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: size??14.sp,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils300({double? size}) {
    return TextStyle(
      color: blackColor,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: size??14.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtils400(
      {double size = 14.0, Color color = blackColor}) {
    return TextStyle(
      color: color,
      fontFamily: AppConstants.fontMontserrat,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle commonTextStyleUnderline500() {
    return  TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: blackColor,
      decorationThickness: 1,
      color: blackColor,
      fontSize: 18.sp,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w500,
    );
  }
}

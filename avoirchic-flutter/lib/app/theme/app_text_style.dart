import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static final normalSemiBold8 = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalRegular10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final normalSemiBold10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstants.fontPoppins,
    color: titleBlack,
  );

  static final normalSemiBold11 = TextStyle(
    fontSize: 11.sp,
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalRegular12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstants.fontPoppins,
    color: titleBlack,
  );

  static final normalSemiBold12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalRegular13 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstants.fontPoppins,
    color: titleBlack,
  );

  static final normalSemiBold13 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final regularBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: titleBlack,
    fontFamily: AppConstants.fontPoppins,
  );

  static final normalRegular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: titleBlack,
    fontFamily: AppConstants.fontPoppins,
  );

  static final normalRegular15 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: titleBlack,
    fontFamily: AppConstants.fontPoppins,
  );
  static final normalRegular18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstants.fontPoppins,
    color: titleBlack,
  );

  static final italicRegular15 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstants.fontPoppins,
    fontStyle: FontStyle.italic,
    color: titleBlack,
  );

  static final normalSemiBold15 = TextStyle(
    fontSize: 15.sp,
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalRegular16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final normalSemiBold16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalWhiteSemiBold16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w600,
    color: whiteColor,
  );
  static final normalBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: titleBlack,
  );
  static final normalSemiBold17 = TextStyle(
    fontSize: 17.sp,
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );
  static final normalRegular17 = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    color: titleBlack,
    fontFamily: AppConstants.fontPoppins,
  );
  static final normalSemiBold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstants.fontPoppins,
    color: titleBlack,
  );
  static final normalBold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppConstants.fontPoppins,
    color: titleBlack,
  );
  static final normalSemiBold20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstants.fontPoppins,
    color: titleBlack,
  );

  static final normalSemiBold22 = TextStyle(
    fontSize: 22.sp,
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );

  static final normalSemiBold26 = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w600,
    color: titleBlack,
    fontFamily: AppConstants.fontPoppins,
  );
  static final normalBold26 = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
    color: titleBlack,
    fontFamily: AppConstants.fontPoppins,
  );

  static final normalBold24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppConstants.fontPoppins,
    color: titleBlack,
  );

  static final normalSemiBold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppConstants.fontPoppins,
    color: titleBlack,
  );
  static final normalSemiBold30 = TextStyle(
    fontSize: 30.sp,
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w600,
    color: titleBlack,
  );
  static final normalRegular40 = TextStyle(
    fontSize: 40.sp,
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );

  static final normalRegular44 = TextStyle(
    fontSize: 44.sp,
    fontFamily: AppConstants.fontPoppins,
    fontWeight: FontWeight.w400,
    color: titleBlack,
  );
  static TextStyle textStyleUtils16() {
    return TextStyle(
      color: blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
    );
  }

  static TextStyle textStyleUtils700({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils700_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils700_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle textStyleUtils600({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils600_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils600_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyleUtils500({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils500_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils500_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyleUtils400({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils400_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils400_14({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils400_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleUtils300({double? size, Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: size ?? 14.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtils300_16({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtils300_12({Color? color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyleUtilsUnderline600({Color? color}) {
    return TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: blackColor,
      decorationThickness: 1.5,
      color: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontWeight: FontWeight.w600,
      fontSize: 20.sp,
    );
  }

  static TextStyle textStyleUtilsUnderLine20(
      {Color? color, FontWeight? fontWeight, double? thickness}) {
    return TextStyle(
      color: color ?? blackColor,
      decoration: TextDecoration.underline,
      decorationColor: color ?? blackColor,
      decorationThickness: thickness ?? 1.5,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 20.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle textStyleUtilsUnderLine18(
      {Color? color, FontWeight? fontWeight, double? thickness}) {
    return TextStyle(
      color: color ?? blackColor,
      decoration: TextDecoration.underline,
      decorationColor: color ?? blackColor,
      decorationThickness: thickness ?? 1.5,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 18.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle textStyleUtilsUnderLine16(
      {Color? color, FontWeight? fontWeight, double? thickness}) {
    return TextStyle(
      color: color ?? blackColor,
      decoration: TextDecoration.underline,
      decorationThickness: thickness ?? 1.5,
      decorationColor: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 16.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle textStyleUtilsUnderLine14(
      {Color? color, FontWeight? fontWeight, double? thickness}) {
    return TextStyle(
      color: color ?? blackColor,
      decoration: TextDecoration.underline,
      decorationThickness: thickness ?? 1.5,
      decorationColor: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle textStyleUtilsUnderLine(
      {Color? color, FontWeight? fontWeight, double? thickness, double? size}) {
    return TextStyle(
      color: color ?? blackColor,
      decoration: TextDecoration.underline,
      decorationThickness: thickness ?? 1.5,
      decorationColor: color ?? blackColor,
      fontFamily: AppConstants.fontPoppins,
      fontSize: size ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}

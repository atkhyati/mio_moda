import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_opensans.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'common_text_poppins.dart';

PreferredSizeWidget commonAppbar(
    {String title = "",
    List<Widget> actionWidget = const [],
    Color appBarColor = backGroundColor,
    Color titleColor = Colors.black,
    Color iconColor = Colors.black}) {
  return AppBar(
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Icons.arrow_back,
        size: 24.0,
        color: iconColor,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black),
    title: CommonTextPoppins(
      title,
      color: titleColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    actions: actionWidget,
  );
}

PreferredSizeWidget commonAppbarDialog(
    {String title = "", VoidCallback? onTapRefresh, Color? color}) {
  return AppBar(
    leading: InkWell(
      onTap: () {
        Get.back<dynamic>();
      },
      child: Icon(
        Icons.arrow_back_rounded,
        size: 24.sp,
        color: Colors.white,
      ),
    ),
    actions: [
      InkWell(
        onTap: onTapRefresh,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.refresh_sharp,
            size: 24.sp,
            color: Colors.white,
          ),
        ),
      ),
    ],
    elevation: 0,
    backgroundColor: color ?? Colors.white,
    iconTheme:  const IconThemeData(color: Colors.white),
    title: CommonTextOpenSans(
      title,
      color: Colors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ),
  );
}


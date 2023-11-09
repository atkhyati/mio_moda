import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';

PreferredSizeWidget commonAppbar(
    {String title = "", List<Widget> actionWidget = const []}) {
  return AppBar(
    
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    title: CommonTextMontserrat(
      title,
      color: Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    actions: actionWidget,
  );
}



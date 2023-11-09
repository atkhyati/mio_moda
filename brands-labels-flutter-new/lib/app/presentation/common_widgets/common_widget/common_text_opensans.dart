import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/consts/app_constants.dart';

class CommonTextOpenSans extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final double? height;

  const CommonTextOpenSans(this.text,
      {Key? key,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign,
      this.height,
      this.maxLine,
      this.decoration,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      toBeginningOfSentenceCase(text)!,
      overflow: overflow,
      style: TextStyle(
          fontFamily: AppConstants.fontPoppins,
          fontSize: fontSize,
          height: height,
          fontWeight: fontWeight,
          color: color,
          decoration: decoration),
      textAlign: textAlign,
      maxLines: maxLine,
    );
  }
}

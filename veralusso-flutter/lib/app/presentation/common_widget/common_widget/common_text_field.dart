import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CommonTextField extends StatelessWidget {
  double? width;
  String? hintText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  FocusNode? focusNode;
  TextInputAction? keyboardInputAction;
  FormFieldValidator<String>? validator;
  int? maxLines = 1;
  double? height = 0.0;
  EdgeInsets? contentPadding;
  bool? isValidationShow = true;
  TextAlign textAlign;
  FontWeight? hintFontWeight;
  Color? hintTextColor;

  CommonTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.width,
    this.keyboardType,
    this.focusNode,
    this.keyboardInputAction,
    this.validator,
    this.maxLines,
    this.height,
    this.contentPadding = EdgeInsets.zero,
    this.textAlign = TextAlign.left,
    this.hintFontWeight = FontWeight.w400,
    this.isValidationShow = true,
    this.hintTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      alignment: Alignment.centerLeft,
      child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          cursorColor: Colors.black,
          keyboardType: keyboardType,
          textInputAction: keyboardInputAction,
          textAlign: textAlign,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(
                r'(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])')),
            LengthLimitingTextInputFormatter(100), // for mobile
          ],
          maxLines: maxLines,
          validator: isValidationShow!
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return '*${LanguageConstants.requiredVal.tr}';
                  }
                  return null;
                }
              : null,
          style: const TextStyle(
            fontFamily: AppConstants.fontMontserrat,
            // fontSize:  12.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: textFieldBoarderColor, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: textFieldBoarderColor, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: textFieldBoarderColor, width: 2)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: textFieldBoarderColor, width: 2)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: textFieldBoarderColor, width: 2)),
              hintText: hintText ?? '',
              hintStyle: TextStyle(
                fontSize: 12.sp,
                fontFamily: AppConstants.fontMontserrat,
                color: hintTextColor ?? Colors.grey,
                fontWeight: hintFontWeight,
              ))),
    );
  }
}

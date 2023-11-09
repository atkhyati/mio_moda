// ignore_for_file: must_be_immutable

import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/lang_directory/language_constant.dart';

enum ButtonType {
  TextButton,
  ElevatedButton,
  OutlinedButton,
}

class CommonButton extends StatelessWidget {
  ButtonType? buttonType;

  /// Use either `child` or `lable` property
  Widget? child;
  Icon? iconn;

  /// Use `icon` property for icon button
  final IconData? icon;

  /// Use either `child` or `lable` property
  final String? lable;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final Color? shadowColor;
  final EdgeInsets? padding;
  final FocusNode? focusNode;
  final double? elevation; //not for flat button

  /// For text size, weight.
  /// Use color property for text color
  final TextStyle? textStyle;

  /// for button border of type BorderSide(color,width,style)
  final BorderSide? border;

  /// it apply circular border type
  double? borderRadius;

  /// if want to apply custome border shape, For circular border give only borderRadius property
  OutlinedBorder? shape;

  ButtonStyle? buttonStyle;

  CommonButton({
    Key? key,
    @required this.buttonType,
    required this.onPressed,
    this.lable,
    this.child,
    this.icon,
    this.color,
    this.textColor,
    this.shadowColor,
    this.border,
    this.borderRadius = 0.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.elevation,
    this.focusNode,
    this.shape,
    this.textStyle,
  }) : super(key: key);

  Widget myButton() {
    switch (buttonType) {
      case ButtonType.TextButton:
        buttonStyle = TextButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: color,
          elevation: elevation,
          padding: padding,
          shape: shape,
          side: border,
          shadowColor: Colors.transparent,
          textStyle: textStyle,
        );
        return textButton();

      case ButtonType.OutlinedButton:
        buttonStyle = OutlinedButton.styleFrom(
          foregroundColor: textColor,
          splashFactory: NoSplash.splashFactory,
          backgroundColor: color,
          elevation: elevation,
          padding: padding,
          shape: shape,
          side: border,
          shadowColor: Colors.transparent,
          textStyle: textStyle,
        );
        return outlinedButton();

      case ButtonType.ElevatedButton:
        buttonStyle = ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: color,
          elevation: elevation,
          padding: padding,
          shape: shape,
          side: border,
          shadowColor: Colors.transparent,
          textStyle: textStyle,
        );
        return elevatedButton();

      default:
        buttonStyle = TextButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: color,
          elevation: elevation,
          padding: padding,
          shape: shape,
          side: border,
          shadowColor: shadowColor,
          textStyle: textStyle,
        );
        return textButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    shape = const RoundedRectangleBorder(borderRadius: BorderRadius.zero);

    if (lable != null) {
      child = CommonTextPoppins(
        lable,
      );
    }

    if (icon != null) {
      iconn = Icon(
        icon,
      );
    }

    return myButton();
  }

  TextButton textButton() {
    if (icon != null) {
      return TextButton.icon(
        icon: iconn!,
        label: child!,
        onPressed: onPressed,
        style: buttonStyle,
        focusNode: focusNode,
      );
    }
    return TextButton(
      onPressed: onPressed,
      style: buttonStyle,
      focusNode: focusNode,
      child: child!,
    );
  }

  OutlinedButton outlinedButton() {
    if (icon != null) {
      return OutlinedButton.icon(
        icon: iconn!,
        label: child!,
        onPressed: onPressed,
        style: buttonStyle,
        focusNode: focusNode,
      );
    }
    return OutlinedButton(
      onPressed: onPressed,
      style: buttonStyle,
      focusNode: focusNode,
      child: child!,
    );
  }

  ElevatedButton elevatedButton() {
    if (icon != null) {
      return ElevatedButton.icon(
        icon: iconn!,
        label: child!,
        onPressed: onPressed,
        style: buttonStyle,
        focusNode: focusNode,
      );
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      focusNode: focusNode,
      child: child,
    );
  }
}

void errorToast(String error, {String? title}) {
  Get.snackbar(
    title ?? LanguageConstants.enterValidText.tr,
    error,
    duration: const Duration(seconds: 1),
    colorText: Colors.white,
    backgroundColor: appButtonColor,
  );
}

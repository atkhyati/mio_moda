import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';

import '../../core/utils/lang_directory/language_constant.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget(
      {Key? key,
      this.fieldKey,
      this.hintText,
      this.style,
      this.prefixIcon,
      required this.controller,
      this.textInputAction,
      this.keyboardType,
      this.enabled,
      this.focusNode,
      this.validator,
      this.hintStyle,
      this.textAlign,
      this.inputFormatters})
      : super(key: key);
  final Key? fieldKey;
  final String? hintText;
  final TextStyle? style;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final TextInputType? keyboardType;
  final FormFieldValidator<String?>? validator;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return textFormField(
        hintStyle: hintStyle,
        fieldKey: fieldKey,
        hintText: hintText,
        enabled: enabled,
        focusNode: focusNode,
        controller: controller,
        textInputAction: textInputAction,
        textAlign: textAlign,
        keyboardType: TextInputType.emailAddress,
        validator: validator ??
            (value) => Validators.validateEmail(
                  value?.trim(),
                ),
        inputFormatters: inputFormatters);
  }
}

class PasswordWidget extends StatefulWidget {
  final Key? fieldKey;
  final int? maxLength;
  final String? hintText;

  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;

  const PasswordWidget({
    Key? key,
    required this.controller,
    this.fieldKey,
    this.maxLength,
    this.hintText,
    this.validator,
    this.focusNode,
    this.textInputAction,
    this.hintStyle,
    this.textAlign,
  }) : super(key: key);

  @override
  PasswordWidgetState createState() => PasswordWidgetState();
}

class PasswordWidgetState extends State<PasswordWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return textFormField(
        fieldKey: widget.fieldKey,
        hintText: widget.hintText,
        obscureText: _obscureText,
        focusNode: widget.focusNode,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        maxLines: 1,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: contentGrey,
          ),
        ),
        textAlign: widget.textAlign,
        hintStyle: widget.hintStyle,
        validator: widget.validator ??
            (value) => Validators.validateRequired(
                value?.trim() ?? '', LanguageConstants.password.tr));
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.validator,
    this.prefixIcon,
    required this.controller,
    this.maxLength,
    this.focusNode,
    this.autofocus,
    this.style,
    this.textInputAction,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.keyboardType,
    this.fillColor,
  }) : super(key: key);

  final Key? fieldKey;
  final String? hintText;
  final List<TextInputFormatter?>? inputFormatters;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      keyboardType: keyboardType ?? TextInputType.number,
      fieldKey: fieldKey,
      hintText: hintText,
      focusNode: focusNode,
      controller: controller,
      style: style,
      prefixIcon: prefixIcon,
      filledColor: fillColor,
      validator: validator,
      textAlign: textAlign,
      maxLength: maxLength,
      textInputAction: textInputAction,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]'))],
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {Key? key,
      this.fieldKey,
      this.hintText,
      this.textStyle,
      this.hintStyle,
      this.validator,
      this.prefixIcon,
      required this.controller,
      this.focusNode,
      this.maxLines,
      this.maxLength,
      this.suffixIcon,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.textInputAction,
      this.keyboardType,
      this.isPaded,
      this.textAlign = TextAlign.left,
      this.inputFormatters})
      : super(key: key);

  final Key? fieldKey;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final double? isPaded;

  @override
  Widget build(BuildContext context) {
    return textFormField(
        isPaded: isPaded,
        fieldKey: fieldKey,
        focusNode: focusNode,
        hintText: hintText,
        controller: controller,
        keyboardType: TextInputType.text,
        validator: validator,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        maxLength: maxLength,
        maxLines: maxLines,
        textInputAction: textInputAction,
        textAlign: textAlign,
        onTap: onTap,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        textStyle: textStyle,
        hintStyle: hintStyle,
        inputFormatters: inputFormatters);
  }
}

class OutlineTextFormFieldWidget extends StatelessWidget {
  const OutlineTextFormFieldWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.textStyle,
    this.hintStyle,
    this.validator,
    this.prefixIcon,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  final Key? fieldKey;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      fieldKey: fieldKey,
      focusNode: focusNode,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      textAlign: textAlign,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      textStyle: textStyle,
      hintStyle: hintStyle,
    );
  }
}

class TextAreaWidget extends StatelessWidget {
  const TextAreaWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.validator,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.filledColor,
  }) : super(key: key);

  final Key? fieldKey;
  final int? maxLines;
  final int? maxLength;
  final String? hintText;
  final Color? filledColor;
  final FormFieldValidator<String?>? validator;

  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      keyboardType: TextInputType.text,
      focusNode: focusNode,
      fieldKey: fieldKey,
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      hintText: hintText,
      filledColor: filledColor,
    );
  }
}

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  final String? hintText;
  final Function(String?)? onFieldSubmit;
  final Function(String?)? onFieldChange;
  final Function()? onSubmit;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  TextEditingController? controller;

  SearchBar({
    Key? key,
    this.hintText,
    this.onFieldSubmit,
    this.onSubmit,
    this.onFieldChange,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller,
      onFieldSubmitted: onFieldSubmit,
      hintText: hintText ?? LanguageConstants.searchForPiesSushiTacos.tr,
      prefixIcon: prefixIcon ??
          IconButton(
            icon: const Icon(Icons.search),
            splashRadius: 5,
            onPressed: onSubmit,
          ),
      onChanged: onFieldChange,
      suffixIcon: IconButton(
        icon: Icon(
          suffixIcon ?? Icons.arrow_forward,
          color: hintGrey,
        ),
        onPressed: onSubmit,
      ),
    );
  }
}

TextFormField textFormField({
  final double? isPaded,
  final Key? fieldKey,
  final String? hintText,
  final String? labelText,
  final String? helperText,
  final String? initialValue,
  final int? errorMaxLines,
  final int? maxLines,
  final int? maxLength,
  final bool? enabled,
  final bool autofocus = false,
  final bool obscureText = false,
  final Color? filledColor,
  final Color? cursorColor,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final FocusNode? focusNode,
  final TextStyle? style,
  final TextStyle? textStyle,
  final TextStyle? hintStyle,
  final TextAlign? textAlign,
  final TextEditingController? controller,
  final List<TextInputFormatter>? inputFormatters,
  final TextInputAction? textInputAction,
  final TextInputType? keyboardType,
  final TextCapitalization textCapitalization = TextCapitalization.none,
  final GestureTapCallback? onTap,
  final FormFieldSetter<String?>? onSaved,
  final FormFieldValidator<String?>? validator,
  final ValueChanged<String?>? onChanged,
  final ValueChanged<String?>? onFieldSubmitted,
}) {
  return TextFormField(
    key: fieldKey,
    controller: controller,
    focusNode: focusNode,
    maxLines: maxLines,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    obscureText: obscureText,
    enabled: enabled,
    validator: validator,
    maxLength: maxLength ?? 35,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    onTap: onTap,
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    autocorrect: true,
    autofocus: autofocus,
    textAlign: textAlign ?? TextAlign.left,
    cursorColor: regularGrey,
    style: textStyle ?? AppTextStyle.normalRegular15,
    decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.only(left: 12, top: isPaded ?? 0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: textfieldBorderGrey, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: textfieldBorderGrey, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: textfieldBorderGrey, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(12)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: textfieldBorderGrey, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(12)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: textfieldBorderGrey, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(12)),
        errorMaxLines: 5,
        fillColor: offWhite,
        filled: false,
        hintStyle: hintStyle ??
            AppTextStyle.normalRegular14.copyWith(color: regularGrey),
        hintText: hintText,
        suffixIcon: suffixIcon,
        labelText: labelText,
        helperText: helperText,
        counterText: ''),
  );
}

TextFormField outlineTextField({
  final bool? isFilled = false,
  final Color? inputFormFilledColor,
  final Key? fieldKey,
  final String? hintText,
  final String? labelText,
  final String? helperText,
  final String? initialValue,
  final int? errorMaxLines,
  final int? maxLines,
  final int? maxLength,
  final bool? enabled,
  final bool autofocus = false,
  final bool obscureText = false,
  final Color? filledColor,
  final Color? cursorColor,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final FocusNode? focusNode,
  final TextStyle? style,
  final TextStyle? textStyle,
  final TextStyle? hintStyle,
  final TextAlign textAlign = TextAlign.left,
  final TextEditingController? controller,
  final List<TextInputFormatter>? inputFormatters,
  final TextInputAction? textInputAction,
  final TextInputType? keyboardType,
  final TextCapitalization textCapitalization = TextCapitalization.none,
  final GestureTapCallback? onTap,
  final FormFieldSetter<String?>? onSaved,
  final FormFieldValidator<String?>? validator,
  final ValueChanged<String?>? onChanged,
  final ValueChanged<String?>? onFieldSubmitted,
}) {
  return TextFormField(
    key: fieldKey,
    controller: controller,
    focusNode: focusNode,
    maxLines: maxLines,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    obscureText: obscureText,
    enabled: enabled,
    validator: validator,
    maxLength: maxLength,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    onTap: onTap,
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    autocorrect: true,
    autofocus: autofocus,
    textAlign: textAlign,
    cursorColor: regularGrey,
    cursorHeight: 20,
    style: textStyle ?? AppTextStyle.normalRegular15,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      border: outlineBorderDecoration,
      enabledBorder: outlineBorderDecoration,
      focusedBorder: outlineBorderDecoration,
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.zero,
      ),
      hintText: hintText,
      hintStyle:
          hintStyle ?? AppTextStyle.normalRegular15.copyWith(color: hintGrey),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelText: labelText,
      helperText: helperText,
    ),
  );
}

OutlineInputBorder outlineBorderDecoration = const OutlineInputBorder(
  borderSide: BorderSide(color: darkGreyBlue, width: 1.2),
  borderRadius: BorderRadius.zero,
);

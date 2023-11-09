import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/helper/error_handling_helper.dart';

import '../api/api_client/api_exception.dart';
import '../translations/translations.dart';

typedef ErrorCalling<T> = Widget Function(String value);

class Validators {
  static void apiResponseMessage(
      {String? body,
      success = false,
      dynamic message,
      isDecode = true,
      Color color = Colors.red}) {
    try {
      debugPrint("body['message'] -> $body && ${body.runtimeType} && $message");
      debugPrint("response['message'] -> $message");
      if (body?.isNotEmpty == true) {
        Map response = (body == null)
            ? {}
            : jsonDecode(body.toString()) as Map<String, dynamic>;
        if (response.isNotEmpty && response['message'] != null) {
          Get.snackbar(LanguageConstants.alert.tr, "${response['message']}",
              colorText: color);
        }
      } else {
        Get.snackbar(LanguageConstants.alert.tr, "$message", colorText: color);
      }
    } catch (e) {
      debugPrint('Debug error ---$e  === ${e is FormatException}');
      appCatchError(error: e);
    }
  }

  static void apiExceptionError(
      {required ApiException e,
      Color color = Colors.red,
      ValueChanged<String>? callBack,
      bool? showAlert,
      ErrorCalling? errorAlert,
      Function? unAuth}) async {
    debugPrint("Error ['message'] -> ${e.message}   ${e.error}");
    log('error msg type alert--- $showAlert');
    String errorMsg = '';
    if (e.error is DioError) {
      if (e.error.response.statusCode == 401 &&
          (e.message != null && e.message!.contains("consumer"))) {
        unAuth?.call();
        return;
      } else {
        DioError data = e.error as DioError;
        debugPrint('error msg type--- ${data.type}');
        errorMsg = await ErrorHandlingHelper.handleDioError(data);
      }
    } else if (e.error is ApiException) {
      debugPrint(
          "Error APIEXCEPTION ['message'] -> ${(e.error as ApiException).error}   ${e.error}");
      ApiException error = e.error as ApiException;
      // to handle apiexception
      if (e.error.error.response.statusCode == 401 &&
          (e.message != null && e.message!.contains("consumer"))) {
        unAuth?.call();
        return;
      } else {
        apiExceptionError(e: error);
      }
    } else if (e.error is HttpException) {
      // to handle http exception
      HttpException data = e.error as HttpException;
      errorMsg = await ErrorHandlingHelper.handleHttpException(data);
    } else if (e.error is FormatException) {
      // to handle format exception
      FormatException data = e.error as FormatException;
      errorMsg = await ErrorHandlingHelper.handleFormatException(data);
    } else {
      errorMsg = await ErrorHandlingHelper.handleFlutterError(e);
    }

    if (showAlert ?? true) {
      if (errorAlert != null) {
        Get.dialog<dynamic>(errorAlert(errorMsg));
      } else {
        errorToast(errorMsg, title: LanguageConstants.error.tr);
      }
    }

    if (callBack != null) {
      callBack(errorMsg);
    }
  }

  static void appCatchError(
      {required dynamic error,
      Color color = Colors.red,
      ErrorCalling? errorAlert}) async {
    debugPrint("Error ['message'] -> $error");
    String errorMsg = '';
    if (error is DioError) {
      debugPrint('error msg type--- ${error.type}');
      errorMsg = await ErrorHandlingHelper.handleDioError(error);
    } else if (error is ApiException) {
      debugPrint("Error APIEXCEPTION ['message'] -> ${(error).error}   $error");
      // to handle apiexception
      apiExceptionError(e: error);
    } else if (error is HttpException) {
      // to handle http exception
      errorMsg = await ErrorHandlingHelper.handleHttpException(error);
    } else if (error is FormatException) {
      // to handle format exception
      errorMsg = await ErrorHandlingHelper.handleFormatException(error);
    } else {
      errorMsg = await ErrorHandlingHelper.handleFlutterError(error);
    }

    if (errorAlert != null) {
      Get.dialog<dynamic>(errorAlert(errorMsg));
    } else {
      errorToast(errorMsg, title: LanguageConstants.error.tr);
    }
  }

  static String? validateRequired(String value, String type) {
    if (value.isEmpty) {
      return "$type ${LanguageConstants.requiredVal.tr}";
    }
    return null;
  }

  static String? validateMobile(String value) {
    //some of countries accept 9 digit so I change it range from 10-12 to 9-12
    String patttern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty == true) {
      return LanguageConstants.phoneNumberIsRequired.tr;
    } else if (value.length > 16 ||
        value.length < 9 ||
        !regExp.hasMatch(value)) {
      return LanguageConstants.phoneNumberIsNotValid.tr;
    }
    return null;
  }

  //For Email Verification we using RegEx.
  static String? validateEmail(String? value) {
    String patttern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(patttern);
    if (value?.isEmpty == true) {
      return LanguageConstants.emailIsRequired.tr;
    } else if ((!regExp.hasMatch(value ?? '') ||
        (value != null && value.length > 64))) {
      return LanguageConstants.invalidEmail.tr;
    } else {
      return null;
    }
  }

  //For Email Verification we using RegEx.
  static String? validateConfirmEmail(String? value, String email) {
    String patttern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(patttern);
    if (value?.isEmpty == true) {
      return LanguageConstants.emailIsRequired.tr;
    } else if ((!regExp.hasMatch(value ?? '') ||
        (value != null && value.length > 64))) {
      return LanguageConstants.invalidEmail.tr;
    } else if (email != value) {
      return LanguageConstants.enterEmailAddressNotSame.tr;
    } else {
      return null;
    }
  }

  static String? validateName(String? value, {String? message}) {
    String pattern = r'^[a-zA-Z ]{2,50}$';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty == true) {
      return message != null
          ? '${message} ${LanguageConstants.requiredVal.tr}'
          : '*${LanguageConstants.requiredVal.tr}';
    } else if (value!.length < 3) {
      return LanguageConstants.mustbemorethan2characters.tr;
    } else if (!regExp.hasMatch(value)) {
      return LanguageConstants.entervalid.tr;
    } else {
      return null;
    }
  }

  static String? validateNumber(String? value) {
    String pattern = r'^[0-9 ]{2,50}$';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty == true) {
      return '*${LanguageConstants.requiredVal.tr}';
    } else if (value!.length < 3) {
      return LanguageConstants.mustbemorethan2characters.tr;
    } else if (!regExp.hasMatch(value)) {
      return LanguageConstants.entervalid.tr;
    } else {
      return null;
    }
  }

  static final RegExp _passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~_]).{8,}$');

  static String? validatePassword(String? value) {
    if (value?.isEmpty == true) {
      return LanguageConstants.passwordIsRequired.tr;
    } else if (!_passwordRegex.hasMatch(value ?? '')) {
      return LanguageConstants.passwordRegExp.tr;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value?.isEmpty == true) {
      return LanguageConstants.passwordIsRequired.tr;
    } else if (!_passwordRegex.hasMatch(value.toString())) {
      return LanguageConstants.passwordRegExp.tr;
    } else if (value != password) {
      return LanguageConstants.confirmpasswordshouldbematchwithpassword.tr;
    } else {
      return null;
    }
  }

  static String? validateAddress(String value, String type) {
    if (value.isEmpty) {
      return type;
    }
    return null;
  }

  static String? validateZip(String value, String type) {
    if (value.isEmpty) {
      return LanguageConstants.enterZipOrProvince.tr;
    }
    return null;
  }
}

void errorToast(String error, {String? title, Color color = Colors.red}) {
  Get.snackbar(
    title ?? LanguageConstants.enterValidText.tr,
    error,
    duration: const Duration(seconds: 1),
    colorText: Colors.white,
    backgroundColor: color,
  );
}

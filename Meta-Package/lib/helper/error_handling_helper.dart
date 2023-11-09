import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_package/api/services/local_store_service.dart';
import 'package:meta_package/api/api_client/dio_client.dart';

class ErrorHandlingHelper {
  ErrorHandlingHelper();

  static Future<void> handleError(dynamic error, AppError type) async {
    Map<String, dynamic> errorBody = {};
    switch (type) {
      case AppError.DioError:
        errorBody = handleDioErrorForLog(error as DioError);
        break;
      case AppError.SocketException:
        errorBody = handleSocketExceptionForLog(error as SocketException);
        break;
      case AppError.HttpException:
        errorBody = handleHttpExceptionForLog(error as HttpException);
        break;
      case AppError.NullPointerException:
        // This error captured in AppError.other with flutter error block. we can leave this block for now.
        break;
      case AppError.FormatException:
        errorBody = handleFormatExceptionForLog(error as FormatException);
        break;
      case AppError.other:
        errorBody = handleOtherErrorForLog(error);
        break;
    }

    try {
      final response = await DioClient.client.getClient<Map<String, dynamic>>(
          "POST", 'https://erp.theluxuryunlimited.com/api/updateLog',
          body: errorBody);
      if (response != null) {
        // todo UI redirection for the user reference about log
      }
    } catch (e) {
      debugPrint('UpdateLog error === $e');
      if (e is DioError) {
        getErrorMessage(e);
      }
    }
  }

  static Future<String> handleDioError(DioError error) async {
    debugPrint('error msg --- $error');
    // create log on erp
    await handleError(error, AppError.DioError);

    return getErrorMessage(error);
  }

  static String getErrorMessage(DioError error) {
    String errorDescription = "";
    switch (error.type) {
      case DioErrorType.connectTimeout:
        errorDescription = error.message.isNotEmpty
            ? error.message
            : "Connection timeout with API server";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = error.message.isNotEmpty
            ? error.message
            : "Send timeout in connection with API server";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = error.message.isNotEmpty
            ? error.message
            : "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        Map response = (error.response == null)
            ? {}
            : jsonDecode(error.response.toString()) as Map<String, dynamic>;
        errorDescription = (response['message'] ?? '').toString();
        break;
      case DioErrorType.cancel:
        errorDescription = error.message.isNotEmpty
            ? error.message
            : "Request to API server was cancelled";
        break;
      case DioErrorType.other:
        errorDescription = error.message.isNotEmpty
            ? error.message
            : "Connection to API server failed due to internet connection";
        break;
    }
    debugPrint('error msg desc--- $errorDescription');
    return errorDescription;
  }

  static Future<String> handleSocketException(SocketException error) async {
    await handleError(error, AppError.SocketException);
    return error.message;
  }

  static Future<String> handleHttpException(HttpException error) async {
    await handleError(error, AppError.HttpException);
    return error.message;
  }

  static Future<String> handleFormatException(FormatException error) async {
    await handleError(error, AppError.FormatException);
    return error.message;
  }

  static Future<String> handleFlutterError(dynamic error) async {
    String errorDescription = '';
    if (error is NullThrownError) {
      errorDescription = error.toString();
    } else if (error is TypeError) {
      errorDescription = error.toString();
    } else if (error is FlutterError) {
      errorDescription = error.message;
    } else if (error is NoSuchMethodError) {
      errorDescription = error.toString();
    } else if (error is OutOfMemoryError) {
      errorDescription = error.toString();
    } else {
      errorDescription = 'UnKnown error';
    }
    await handleError(error, AppError.other);
    return errorDescription;
  }

  static Map<String, dynamic> handleFormatExceptionForLog(
      FormatException error) {
    Map<String, dynamic> errorBody = {};
    // ignore: unnecessary_cast
    errorBody = {
      "api_url": '',
      "device": LocalStore.localStore.deviceInfo,
      "api_type": '',
      "user_id": '${LocalStore.localStore.userDetail.id}',
      "email": LocalStore.localStore.userDetail.email,
      "startTime": '${DateTime.now()}',
      "endTime": '${DateTime.now()}',
      "app_version": LocalStore.localStore.packageInfo,
      "other": AppError.FormatException.name,
      "header": '',
      "request_body": '',
      "response_code": '',
      "response_body": error.message,
    };
    return errorBody;
  }

  static Map<String, dynamic> handleHttpExceptionForLog(HttpException error) {
    Map<String, dynamic> errorBody = {};
    // ignore: unnecessary_cast
    errorBody = {
      "api_url": error.uri,
      "device": LocalStore.localStore.deviceInfo,
      "api_type": '',
      "user_id": '${LocalStore.localStore.userDetail.id}',
      "email": LocalStore.localStore.userDetail.email,
      "startTime": '${DateTime.now()}',
      "endTime": '${DateTime.now()}',
      "app_version": LocalStore.localStore.packageInfo,
      "other": AppError.HttpException.name,
      "header": '',
      "request_body": '',
      "response_code": '',
      "response_body": error.message,
    };
    return errorBody;
  }

  static Map<String, dynamic> handleSocketExceptionForLog(
      SocketException error) {
    Map<String, dynamic> errorBody = {};
    // ignore: unnecessary_cast
    errorBody = {
      "api_url": '',
      "device": LocalStore.localStore.deviceInfo,
      "api_type": '',
      "user_id": '${LocalStore.localStore.userDetail.id}',
      "email": LocalStore.localStore.userDetail.email,
      "startTime": '${DateTime.now()}',
      "endTime": '${DateTime.now()}',
      "app_version": LocalStore.localStore.packageInfo,
      "other": AppError.SocketException.name,
      "header": '',
      "request_body": '',
      "response_code": '${error.osError?.errorCode}',
      "response_body":
          '${error.message} ${error.address} ${error.osError?.message}',
    };
    return errorBody;
  }

  static Map<String, dynamic> handleDioErrorForLog(DioError error) {
    Map<String, dynamic> errorBody = {};
    // ignore: unnecessary_cast
    errorBody = {
      "api_url": error.requestOptions.path,
      "device": LocalStore.localStore.deviceInfo,
      "api_type": error.requestOptions.method,
      "user_id": '${LocalStore.localStore.userDetail.id}',
      "email": LocalStore.localStore.userDetail.email,
      "startTime": '${DateTime.now()}',
      "endTime": '${DateTime.now()}',
      "app_version": LocalStore.localStore.packageInfo,
      "other": "",
      "header": error.requestOptions.headers,
      "request_body": error.requestOptions.data,
      "response_code": "${error.response?.statusCode}",
      "response_body":
          '${(error.response is String) ? jsonDecode(error.error.toString()) : error.response}',
    };

    return errorBody;
  }

  static Map<String, dynamic> handleOtherErrorForLog(dynamic error) {
    Map<String, dynamic> errorBody = {};
    // ignore: unnecessary_cast
    errorBody = {
      "api_url": '',
      "device": LocalStore.localStore.deviceInfo,
      "api_type": '',
      "user_id": LocalStore.localStore.userDetail.id,
      "email": LocalStore.localStore.userDetail.email,
      "startTime": 0,
      "endTime": DateTime.now().toString(),
      "app_version": LocalStore.localStore.packageInfo,
      "other": AppError.FormatException.name,
      "header": '',
      "request_body": '',
      "response_code": '',
      "response_body": error,
    };
    return errorBody;
  }
}

enum AppError {
  DioError,
  SocketException,
  HttpException,
  NullPointerException,
  FormatException,
  other
}

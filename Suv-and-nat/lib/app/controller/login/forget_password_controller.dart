import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class ForgetPasswordMenuController extends GetxController {
  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ForgetPasswordMenuController();

  Rx<TextEditingController> emailController = TextEditingController().obs;

  Rx<bool> forgetPasswordResponseModel = false.obs;
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  @override
  void onInit() {
    debugPrint("INTSTATE");

    super.onInit();
  }

  Future<void> getForgetPasswordResponse({String email = ''}) async {
    try {
      final userData = {
        "email": email,
        "template": "email_reset",
        "websiteId": localStore.websiteId
      };
      debugPrint("INTSTATE123455");
      final bool data = await authAPIRepository.putForgetPasswordApiResponse(
          forgetPasswordRequestJson: jsonEncode(userData));
      forgetPasswordResponseModel.value = data;
      if (forgetPasswordResponseModel.value) {
        Get.snackbar(
            '',
            LanguageConstants
                .forgotPasswordRequestSendedOnYourMailPleaseCheck.tr,
            colorText: Colors.black);
      }
      log("loginResponseModel : $forgetPasswordResponseModel");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    }
  }
}

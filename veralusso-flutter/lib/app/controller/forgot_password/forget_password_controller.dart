import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/validator.dart';
import 'package:veralusso/app/presentation/screens/login/forgot_password_design.dart';
import 'package:veralusso/app/presentation/screens/login/forgot_password_wrong_email_screen.dart';

class ForgetPasswordMenuController extends GetxController {
  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ForgetPasswordMenuController();

  Rx<bool> forgetPasswordResponseModel = false.obs;
  TextEditingController emailController = TextEditingController();
  RxBool isValidation = false.obs;
  Rx<bool> isLoading = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> getForgetPasswordResponse({required String email}) async {
    try {
      isLoading.value = true;
      final userData = {
        "email": email,
        "template": "email_reset",
        "websiteId": localStore.websiteId
      };
      final bool data = (await authAPIRepository.putForgetPasswordApiResponse(
          forgetPasswordRequestJson: jsonEncode(userData)));
      Get.to(() => const ForgetPasswordMenuScreen());
      forgetPasswordResponseModel.value = data;
      if (forgetPasswordResponseModel.value) {
        Get.snackbar(
            '',
            LanguageConstants
                .forgotPasswordRequestSendedOnYourMailPleaseCheck.tr,
            colorText: Colors.black);
      } else {
        Get.to(() => ForgetPasswordWrongEmailScreen());
      }
    } on ApiException catch (e) {
      isLoading.value = false;
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}

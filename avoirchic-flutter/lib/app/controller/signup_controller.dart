import 'dart:developer';

import 'package:avoirchic/app/core/consts/constants.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:meta_package/api/api_repository/my_account_repository.dart';
import 'package:meta_package/api/models/add_address_request/add_address_request.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/my_account/update_user_request_model.dart';
import 'package:meta_package/api/models/signup_request_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';

import '../core/utils/app_routes.dart';
import '../theme/colors.dart';

class SignUpController extends GetxController {
  Rx<Color> blackFontColor = blackColor.obs;

  Rx<TextEditingController> firstNameTextController =
      TextEditingController().obs;
  Rx<FocusNode> firstNameFocusNode = FocusNode().obs;

  Rx<TextEditingController> lastNameTextController =
      TextEditingController().obs;
  Rx<FocusNode> lastNameFocusNode = FocusNode().obs;

  Rx<TextEditingController> emailTextController = TextEditingController().obs;
  Rx<FocusNode> emailFocusNode = FocusNode().obs;

  Rx<TextEditingController> confirmEmailTextController =
      TextEditingController().obs;
  Rx<FocusNode> confirmEmailFocusNode = FocusNode().obs;

  Rx<TextEditingController> passwordTextController =
      TextEditingController().obs;
  Rx<FocusNode> passwordFocusNode = FocusNode().obs;

  Rx<TextEditingController> confirmPasswordTextController =
      TextEditingController().obs;
  Rx<FocusNode> confirmPasswordFocusNode = FocusNode().obs;

  Rx<TextEditingController> dobTextController = TextEditingController().obs;
  Rx<FocusNode> dobFocusNode = FocusNode().obs;

  // Rx<TextEditingController> domTextController = TextEditingController().obs;
  // Rx<FocusNode> domFocusNode = FocusNode().obs;

  Rx<Color> checkBoxFillColor = const Color(0XFF367587).obs;
  RxBool isLoading = false.obs;
  RxBool isChecked = false.obs;
  RxBool isSelected = false.obs;
  RxBool isSignUpApiCall = false.obs;
  RxBool isValidation = false.obs;

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  RxBool isRegister = false.obs;
  MyAccountDetails getAddressList = Get.arguments[1] as MyAccountDetails;
  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  MyAccountAPIRepository repository =
      MyAccountAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  SignUpController();

  bool validation() {
    if (!GetUtils.isEmail(emailTextController.value.text.removeAllWhitespace)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    } else if (passwordTextController.value.text !=
        confirmPasswordTextController.value.text) {
      errorToast(LanguageConstants.confirmpasswordshouldbematchwithpassword.tr);
    } else if (emailTextController.value.text.removeAllWhitespace !=
        confirmEmailTextController.value.text.removeAllWhitespace) {
      errorToast(LanguageConstants.confirmEmailNotMatch.tr);
    } else if (!GetUtils.isEmail(
        confirmEmailTextController.value.text.removeAllWhitespace)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    isRegister = (Get.arguments[0] == 1).obs;
    if (isRegister.value == true) {
      emailTextController.value.text = getAddressList.email.toString();
      lastNameTextController.value.text = getAddressList.lastname.toString();
      firstNameTextController.value.text = getAddressList.firstname.toString();
    }
    super.onInit();
  }

  Future<void> onSave(context) async {
    isValidation.value = true;

    UpdateUserRequest userData = UpdateUserRequest(
        customer: CustomerDetails(
      firstname: firstNameTextController.value.text,
      lastname: lastNameTextController.value.text,
      email: emailTextController.value.text,
    ));

    if (formKey.value.currentState?.validate() ?? false) {
      isLoading.value = true;
      try {
        MyAccountDetails? responseData = await repository.updateUser(userData);
        if (responseData != null) {
          Get.back();
          Get.snackbar(
              LanguageConstants.alert.tr, LanguageConstants.userUpdateMsg.tr,
              backgroundColor: Colors.white, colorText: Colors.black);
        }
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(e: e);
      } catch (e) {
        ExceptionHandler.appCatchError(error: e);
        log(e.toString(), name: "Error");
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> signUpUser() async {
    isValidation.value = true;
    update(["SignUp"]);
    if (formKey.value.currentState?.validate() ?? false) {
      try {
        if (isChecked.value) {
          isSignUpApiCall.value = true;

          SignUpRequestModel signUpRequestModel = SignUpRequestModel(
            customer: Customer(
              addresses: [],
              firstname: firstNameTextController.value.text,
              lastname: lastNameTextController.value.text,
              email: emailTextController.value.text.trim(),
              websiteId: int.tryParse(localStore.websiteId) ?? 1,
              dob: dobTextController.value.text,
              // extensionAttributes: RequestExtensionAttributes(
              //   dom: domTextController.value.text,
              // ),
            ),
            password: passwordTextController.value.text.trim(),
          );

          /// SignUp Api Call
          isLoading.value = true;
          MyAccountDetails? signUpData =
              await authAPIRepository.signUpWithEmail(signUpRequestModel);
          isLoading.value = true;
          if (signUpData != null) {
            log('${signUpData.toJson()}', name: "data");
            Get.offAllNamed(RoutesConstants.dashboardScreen);
          } else {
            isSignUpApiCall.value = false;
          }
        } else {
          isSignUpApiCall.value = false;
          Get.snackbar(LanguageConstants.alert.tr,
              LanguageConstants.pleaseAgreeForNewsletter.tr);
        }
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(e: e);
      } catch (e, stackStrace) {
        isSignUpApiCall.value = false;
        log(e.toString(), name: "Error");
        log("$stackStrace", name: "stackStrace");
        ExceptionHandler.appCatchError(error: e);
      } finally {
        isLoading.value = false;
        isSignUpApiCall.value = false;
      }
    }
  }
}

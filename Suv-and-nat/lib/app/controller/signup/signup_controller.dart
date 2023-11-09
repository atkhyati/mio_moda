import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/auth_api_repository.dart';
import 'package:meta_package/api/api_repository/my_account_repository.dart';
import 'package:meta_package/api/models/add_address_request/add_address_request.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/my_account/update_user_request_model.dart';
import 'package:meta_package/api/models/signup_request_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:meta_package/meta_package.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/core/const/constants.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class SignUpController extends GetxController {
  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  SignUpController();

  RxBool isSignUpApiCall = false.obs;

  TextEditingController firstNameTextController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();

  TextEditingController lastNameTextController = TextEditingController();
  FocusNode lastNameFocusNode = FocusNode();

  TextEditingController emailTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController confirmEmailTextController = TextEditingController();
  FocusNode confirmEmailFocusNode = FocusNode();

  TextEditingController passwordTextController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController confirmPasswordTextController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();

  TextEditingController dobTextController = TextEditingController();
  FocusNode dobFocusNode = FocusNode();

  RxBool isRegister = false.obs;
  MyAccountDetails? getAddressList;
  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  MyAccountAPIRepository repository =
      MyAccountAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  // TextEditingController domTextController = TextEditingController();
  // FocusNode domFocusNode = FocusNode();
  bool isValid = false;

  Rx<Color> checkBoxFillColor = const Color(0XFF973133).obs;

  RxBool isChecked = false.obs;
  RxBool isSelected = false.obs;

  RxString selectedStatus = "Mr".obs;

  RxList<String> status = ['Mr', 'Mrs'].obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    isRegister = (Get.arguments != null && Get.arguments[0] == 1).obs;
    if (isRegister.value == true) {
      getAddressList = Get.arguments[1] as MyAccountDetails;
      if (getAddressList != null) {
        emailTextController.text = getAddressList!.email.toString();
        lastNameTextController.text = getAddressList!.lastname.toString();
        firstNameTextController.text = getAddressList!.firstname.toString();
      }
    }
    super.onInit();
  }

  Future<void> onSave(context) async {
    UpdateUserRequest userData = UpdateUserRequest(
        customer: CustomerDetails(
      firstname: firstNameTextController.text,
      lastname: lastNameTextController.value.text,
      email: emailTextController.value.text,
    ));

    if (true) {
      isSignUpApiCall.value = true;
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
        isSignUpApiCall.value = false;
      }
    }
  }

  Future<void> signUpUser() async {
    isValid = true;
    update(["SignIn"]);
    if (formKey.currentState?.validate() ?? false) {
      try {
        if (isChecked.value) {
          isSignUpApiCall.value = true;
          SignUpRequestModel signUpRequestModel = SignUpRequestModel(
            customer: Customer(
              email: emailTextController.value.text.trim(),
              firstname: firstNameTextController.value.text,
              lastname: lastNameTextController.value.text,
              websiteId: int.tryParse(localStore.websiteId),
              addresses: [],
              dob: dobTextController.value.text,
              // extensionAttributes: RequestExtensionAttributes(
              //   dom: domTextController.value.text,
              // ),
            ),
            password: passwordTextController.value.text.trim(),
          );

          /// SignUp Api Call
          MyAccountDetails? signUpData =
              (await authAPIRepository.signUpWithEmail(signUpRequestModel));
          if (signUpData != null) {
            isSignUpApiCall.value = false;
            Get.offAllNamed(RoutesConstants.dashboardScreen);
          }
        } else {
          Get.snackbar(LanguageConstants.alert.tr,
              LanguageConstants.pleaseAgreeForNewsletter.tr,
              barBlur: 10, colorText: Colors.black);
        }
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(e: e);
      } catch (e, StackStrace) {
        log(e.toString(), name: "Error");
        log(StackStrace.toString(), name: "StackStrace");
        ExceptionHandler.appCatchError(error: e);
      } finally {
        isSignUpApiCall.value = false;
      }
    }
  }
}

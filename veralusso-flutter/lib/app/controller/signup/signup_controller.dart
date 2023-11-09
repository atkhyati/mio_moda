import 'dart:developer';

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
import 'package:veralusso/app/core/const/constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class SignUpController extends GetxController {
  SignUpController();

  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  TextEditingController emailTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController confirmEmailTextController = TextEditingController();
  FocusNode confirmEmailFocusNode = FocusNode();

  TextEditingController passwordTextController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController confirmPasswordTextController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();

  TextEditingController fNameTextController = TextEditingController();
  FocusNode fNameFocusNode = FocusNode();

  TextEditingController lNameTextController = TextEditingController();
  FocusNode lNameFocusNode = FocusNode();

  TextEditingController telephoneNoTextController = TextEditingController();
  FocusNode telephoneNoFocusNode = FocusNode();

  TextEditingController dobTextController = TextEditingController();
  FocusNode dobFocusNode = FocusNode();

  // TextEditingController domTextController = TextEditingController();
  // FocusNode domFocusNode = FocusNode();

  RxString selectedStatus = 'Mr'.obs;
  RxList<String> status = ['Mr', 'Mrs'].obs;

  RxString selectedCountry = 'United Kingdom'.obs;
  RxList<String> country = ['United Kingdom', 'India', 'Australia'].obs;

  RxString selectedValue = 'GDP'.obs;
  RxList<String> value = ['GDP'].obs;

  RxString selectedLanguage = 'English'.obs;
  RxList<String> language = ['English'].obs;

  TextEditingController emailAddressTextController = TextEditingController();
  FocusNode emailAddressFocusNode = FocusNode();

  Rx<Color> checkBoxFillColor = const Color(0XFFC4C4c4).obs;

  RxBool isChecked = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSelected = false.obs;
  bool isValid = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isRegister = false.obs;
  MyAccountDetails getAddressList = Get.arguments[1] as MyAccountDetails;
  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  MyAccountAPIRepository repository =
      MyAccountAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  @override
  void onInit() {
    isRegister = (Get.arguments[0] == 1).obs;
    if (isRegister.value == true) {
      emailTextController.text = getAddressList.email.toString();
      lNameTextController.text = getAddressList.lastname.toString();
      fNameTextController.text = getAddressList.firstname.toString();
    }
    super.onInit();
  }

  Future<void> onSave(context) async {
    UpdateUserRequest userData = UpdateUserRequest(
        customer: CustomerDetails(
      firstname: fNameTextController.text,
      lastname: lNameTextController.text,
      email: emailTextController.text,
    ));

    if (formKey.currentState?.validate() ?? false) {
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
    isValid = true;
    update(["SigUp"]);
    if (formKey.currentState?.validate() ?? false) {
      if (isChecked.value && isSelected.value) {
        SignUpRequestModel signUpRequestModel = SignUpRequestModel(
          customer: Customer(
            addresses: [],
            firstname: fNameTextController.value.text,
            lastname: lNameTextController.value.text,
            email: emailTextController.value.text.trim(),
            websiteId: int.tryParse(localStore.websiteId) ?? 102,
            dob: dobTextController.value.text,
            // extensionAttributes: RequestExtensionAttributes(
            //   dom: domTextController.value.text,
            // ),
          ),
          password: passwordTextController.value.text.trim(),
        );

        isLoading.value = true;
        try {
          MyAccountDetails? data =
              await authAPIRepository.signUpWithEmail(signUpRequestModel);
          if (data != null) {
            Get.offAllNamed(RoutesConstants.dashboardScreen);
          }
          isLoading.value = false;
        } on ApiException catch (e) {
          ExceptionHandler.apiExceptionError(e: e);
        } catch (e, StackStrace) {
          isLoading.value = false;
          log(e.toString(), name: "Error");
          log(StackStrace.toString(), name: "StackStrace");
          ExceptionHandler.appCatchError(error: e);
        } finally {
          isLoading.value = false;
        }
      } else {
        Get.snackbar(LanguageConstants.alert.tr,
            LanguageConstants.pleaseAgreeForNewsletter.tr);
      }
    }
  }
}

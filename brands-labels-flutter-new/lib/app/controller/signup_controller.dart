import 'dart:convert';
import 'dart:developer';

import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:brandslabels/app/theme/colors.dart';
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
import 'package:meta_package/api/models/signup_response_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';

import '../core/utils/app_routes.dart';

class SignUpController extends GetxController {
  Rx<Color> backgroundColor = whiteColor.obs;

  Rx<Color> borderColor = blackColor.obs;

  Rx<Color> textHintColor = hintGrey.obs;

  Rx<Color> buttonColor = borderBlue.obs;
  Rx<String> loginResponseModel = "".obs;

  Rx<Color> textFieldBorderColor = borderGrey.obs;

  TextEditingController nameTextController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();

  TextEditingController surNameTextController = TextEditingController();
  FocusNode surNameFocusNode = FocusNode();
  RxBool check1 = false.obs;
  TextEditingController dateOfBirthTextController = TextEditingController();
  FocusNode dateOfBirthFocusNode = FocusNode();

  // TextEditingController marriageTextController = TextEditingController();
  // FocusNode marriageFocusNode = FocusNode();

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController confirmEmailTextController = TextEditingController();
  FocusNode confirmEmailFocusNode = FocusNode();
  TextEditingController confirmPasswordTextController = TextEditingController();

  FocusNode describeFocusNode = FocusNode();

  FocusNode confirmPasswordFocusNode = FocusNode();

  RxString selectedStatus = "Mr".obs;

  RxList<String> status = ['Mr', 'Mrs'].obs;

  RxString selectedCountry = 'Australia'.obs;

  RxList<String> country = ['Australia', 'India'].obs;

  RxString selectedEnquiry = 'brands'.obs;

  RxList<String> enquiry = ['brands', '---'].obs;

  RxBool isSelected = false.obs;
  RxBool isChecked = false.obs;

  Rx<Color> checkBoxFillColor = const Color(0XFFC4C4c4).obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isSubmitButtonPressed = false;
  Rx<SignUpResponseModel> signUpResponseModel = SignUpResponseModel().obs;
  final AuthAPIRepository authAPIRepository =
      AuthAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxBool isLoading = false.obs;
  RxBool isRegister = false.obs;
  MyAccountDetails? getAddressList;
  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  MyAccountAPIRepository repository =
      MyAccountAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  SignUpController();

  @override
  void onInit() {
    isRegister = (Get.arguments != null && Get.arguments[0] == 1).obs;
    if (isRegister.value == true) {
      getAddressList = Get.arguments[1] as MyAccountDetails;
      if (getAddressList != null) {
        emailTextController.text = getAddressList!.email.toString();
        surNameTextController.text = getAddressList!.lastname.toString();
        nameTextController.text = getAddressList!.firstname.toString();
      }
    }
    super.onInit();
  }

  Future<void> onSave(context) async {
    UpdateUserRequest userData = UpdateUserRequest(
        customer: CustomerDetails(
      firstname: nameTextController.text,
      lastname: surNameTextController.text,
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
    debugPrint(
        "empty -> ${nameTextController.value.text.trim()}${passwordTextController.value.text.trim()} ${dateOfBirthTextController.value.text} ");
    isSubmitButtonPressed = true;
    update(["signUp"]);
    if ((formKey.currentState?.validate() ?? false)) {
      if (isChecked.value && isSelected.value) {
        try {
          isLoading.value = true;
          SignUpRequestModel signUpRequest = SignUpRequestModel(
            customer: Customer(
              addresses: [],
              firstname: nameTextController.value.text,
              lastname: surNameTextController.value.text,
              email: emailTextController.value.text.trim(),
              websiteId: int.tryParse(localStore.websiteId) ?? 102,
              dob: dateOfBirthTextController.value.text,
              // extensionAttributes: RequestExtensionAttributes(
              //   dom: marriageTextController.value.text,
              // ),
            ),
            password: passwordTextController.value.text.trim(),
          );
          MyAccountDetails? data =
              await authAPIRepository.signUpWithEmail(signUpRequest);
          if (data != null) {
            Get.offAllNamed(RoutesConstants.dashboardScreen);
          }
          log("signUpResponseModel : ${json.encode(signUpResponseModel.value.toJson())}");
        } on ApiException catch (e) {
          ExceptionHandler.apiExceptionError(e: e);
        } catch (e) {
          debugPrint(e.toString());
          ExceptionHandler.appCatchError(error: e);
        } finally {
          isLoading.value = true;
        }
      } else {
        Get.snackbar(LanguageConstants.alert.tr,

            LanguageConstants.pleaseAgreeForNewsletter.tr,barBlur: 10, colorText: Colors.black);
      }
    }
  }
}

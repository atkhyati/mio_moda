import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/error_dialog.dart';

import '../country/country_controller.dart';

class AffiliateProgramController extends GetxController {
  String countryCode = '1';

  RxString screenTitle = "".obs;

  Rx<Color> backColor = const Color(0XFFD1F1FF).obs;

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  RxString selectedValue = "Mr.".obs;

  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<FocusNode> focusNode = FocusNode().obs;

  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<FocusNode> lastNameFocusNode = FocusNode().obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<FocusNode> emailFocusNode = FocusNode().obs;

  Rx<TextEditingController> contactNoController = TextEditingController().obs;
  Rx<FocusNode> contactNoFocusNode = FocusNode().obs;

  Rx<TextEditingController> websiteController = TextEditingController().obs;
  Rx<FocusNode> websiteNoFocusNode = FocusNode().obs;

  Rx<TextEditingController> addressOneController = TextEditingController().obs;
  Rx<FocusNode> addressOneFocusNode = FocusNode().obs;

  Rx<TextEditingController> addressTwoController = TextEditingController().obs;
  Rx<FocusNode> addressTwoFocusNode = FocusNode().obs;

  Rx<TextEditingController> postCodeController = TextEditingController().obs;
  Rx<FocusNode> postCodeFocusNode = FocusNode().obs;

  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<FocusNode> cityFocusNode = FocusNode().obs;

  RxString selectedVisitorValue = LanguageConstants.visitorMonthHintText.tr.obs;
  RxString selectedViewsValue = LanguageConstants.viewsMonthHintText.tr.obs;
  // RxString cityValue = LanguageConstants.cityHintText.tr.obs;
  // RxString countryValue = LanguageConstants.countryHintText.tr.obs;
  RxString chosenCountry = ''.obs;
  final CountryController countryController = Get.find();

  bool isValidation = false;

  bool validation() {
    if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    screenTitle.value = LanguageConstants.affiliateProgramTitleText.tr;
    chosenCountry.value = countryController.storeWebsitesList
            .firstWhere((element) =>
                element.websiteId.toString() == localStore.websiteId)
            .name ??
        '';
    super.onInit();
  }

  void onTap() {
    isValidation = true;
    update(["Affi"]);
    if (validation()) {}
  }
}

import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';

import '../core/consts/app_constants.dart';
import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class AffiliateProgramController extends GetxController {
  String countryCode = '1';

  RxString screenTitle = "".obs;

  Rx<Color> backColor = const Color(0XFFF9EAE3).obs;

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
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<FocusNode> cityFocusNode = FocusNode().obs;
  Rx<TextEditingController> addressTwoController = TextEditingController().obs;
  Rx<FocusNode> addressTwoFocusNode = FocusNode().obs;

  Rx<TextEditingController> postCodeController = TextEditingController().obs;
  Rx<FocusNode> postCodeFocusNode = FocusNode().obs;
  bool isValidation = false;

  RxString selectedVisitorValue = LanguageConstants.visitorMonthHintText.tr.obs;
  RxString selectedViewsValue = LanguageConstants.viewsMonthHintText.tr.obs;
  RxString cityValue = LanguageConstants.cityHintText.tr.obs;
  RxString countryValue = LanguageConstants.countryHintText.tr.obs;
  RxString bgImage = "assets/images/avoirchick_background.png".obs;
  Rx<CountryListModel> selectedCoutry = CountryListModel().obs;
  RxList<CountryListModel> getcountryList = <CountryListModel>[].obs;
  RxBool isLoading = false.obs;
  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));

  @override
  void onInit() {
    screenTitle.value = LanguageConstants.affiliateProgramTitleText.tr;
    getCountryList();
    super.onInit();
  }

  bool validation() {
    if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  void onTap() {
    isValidation = true;
    update(["Affi"]);
    if (validation()) {}
  }
  Future<void> getCountryList() async {
    isLoading.value = true;
    try {
      List<CountryListModel>? countryList =
      await addressListAPIRepository.getCountryListResponse();

      if (countryList?.isNotEmpty == true) {
        getcountryList.value = countryList!;
        getcountryList.removeWhere(
                (element) => (element.fullNameEnglish?.isEmpty ?? true));
        selectedCoutry.value = getcountryList.first;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading.value = false;
    //getUpdateOrNot();
  }
}

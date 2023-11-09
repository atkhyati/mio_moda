import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/add_address_request/add_address_request.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/controller/country/country_controller.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/CustomPhoneField/countries.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class AddAddressController extends GetxController {
  String countryCodeNumber = '1';
  RxString phoneErrorMsg = "".obs;

  RxInt index = 0.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController zipPovinceController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController address3Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  RxList<CountryListModel> getcountryList = <CountryListModel>[].obs;
  MyAccountDetails getAddressList = Get.arguments[0] as MyAccountDetails;
  RxInt seletedPage = 0.obs;
  String addressId = '';
  RxString country = "".obs;

  Rx<Address> getUpdateAddressList = Address().obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool getFirstName = false.obs;
  Rx<CountryListModel> selectedCoutry = CountryListModel().obs;
  Rx<AvailableRegion> selectedState = AvailableRegion().obs;
  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;
  RxBool isLoading = true.obs;

  RxBool isScreenLoading = false.obs;

  String? addressType =
      ((Get.arguments is List) && (Get.arguments as List).length == 4)
          ? Get.arguments[3] as String?
          : null;

  AddAddressController({this.countryCode});

  @override
  void onInit() {
    seletedPage.value = Get.arguments[2] is int ? Get.arguments[2] as int : 0;
    country = Get.find<CountryController>().country;
    getInitialCountryCode();
    getCountryList();
    super.onInit();
  }

  void getInitialCountryCode() {
    countryCodeNumber = countries
        .firstWhere((item) => item.code == (country.value),
            orElse: () => countries.first)
        .dialCode;
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
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    getUpdateOrNot();
  }

  void getUpdateOrNot() {
    if (Get.arguments[2] == 1) {
      getUpdateAddressList.value =
          Get.arguments[1] is Address ? Get.arguments[1] as Address : Address();
      addressId = getUpdateAddressList.value.id.toString();

      firstNameController.text = getUpdateAddressList.value.firstname ?? '';
      lastNameController.text = getUpdateAddressList.value.lastname ?? '';
      phoneNumberController.text = getUpdateAddressList.value.telephone ?? '';
      zipPovinceController.text = getUpdateAddressList.value.postcode ?? '';
      address1Controller.text = getUpdateAddressList.value.street?.first ?? "";
      address2Controller.text = getUpdateAddressList.value.street?[0] ?? "";
      address3Controller.text = getUpdateAddressList.value.street?[0] ?? "";
      cityController.text = getUpdateAddressList.value.city ?? '';
      for (var i in getcountryList) {
        if (i.id.toString() ==
            getUpdateAddressList.value.countryId.toString()) {
          selectedCoutry.value = i;
          for (var j in (selectedCoutry.value.availableRegions ?? [])) {
            if (j.id.toString() ==
                (getUpdateAddressList.value.region?.regionId ?? '')
                    .toString()) {
              selectedState.value = AvailableRegion(
                code: getUpdateAddressList.value.region?.regionCode ?? '',
                id: getUpdateAddressList.value.region?.regionId.toString() ??
                    '',
                name: getUpdateAddressList.value.region?.region ?? '',
              );
            }
          }
        }
      }
    }
  }

  bool checkCountryAndState(bool isStateEmpty) {
    if (selectedCoutry.value.id == null) {
      Get.snackbar(LanguageConstants.warning.tr,
          '${LanguageConstants.countryText.tr} ${LanguageConstants.requiredVal.tr}');
      return false;
    }
    if (!isStateEmpty && selectedState.value.id == null) {
      Get.snackbar(LanguageConstants.warning.tr,
          '${LanguageConstants.stateText.tr} ${LanguageConstants.requiredVal.tr}');
      return false;
    }
    return true;
  }

  Future<void> addAddress(BuildContext context, GlobalKey<FormState> formKey,
      bool isStateEmpty) async {
    try {
      isLoading.value = true;
      if (phoneNumberController.text.isEmpty) {
        phoneErrorMsg.value = LanguageConstants.phoneNumberIsRequired.tr;
      } else {
        phoneErrorMsg.value = "";
      }
      if ((formKey.currentState?.validate() ?? false) &&
          checkCountryAndState(isStateEmpty)) {
        await addressListAPIRepository.addNewAddress(
            getAddressList,
            AddAddressRequest(
                region: Region(
                    regionCode: selectedState.value.code,
                    region: selectedState.value.name,
                    regionId: int.parse(selectedState.value.id ?? "0")),
                countryId: selectedCoutry.value.id.toString().trim(),
                street: [
                  (address1Controller.value.text.toString()),
                  (address1Controller.value.text.toString()),
                  (address1Controller.value.text.toString())
                ],
                firstname: firstNameController.text,
                lastname: lastNameController.text,
                telephone:
                    "+$countryCodeNumber${phoneNumberController.value.text.toString()}",
                postcode: zipPovinceController.value.text.toString(),
                city: cityController.value.text.toString(),
                defaultShipping:
                    addressType != null ? addressType == 'shipping' : false,
                defaultBilling:
                    addressType != null ? addressType == 'billing' : false));

        Get.back(result: true);
      }
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateAddress(
      BuildContext context, GlobalKey<FormState> formKey) async {
    try {
      isScreenLoading.value = true;
      if (phoneNumberController.text.isEmpty) {
        phoneErrorMsg.value = LanguageConstants.phoneNumberIsRequired.tr;
      } else {
        phoneErrorMsg.value = "";
      }
      if ((formKey.currentState?.validate() ?? false) &&
          checkCountryAndState(false)) {
        MyAccountDetails? addressListModal =
            await addressListAPIRepository.updateAddress(
                getAddressList,
                AddAddressRequest(
                    region: Region(
                        regionCode: selectedState.value.code,
                        region: selectedState.value.name,
                        regionId: int.parse(selectedState.value.id ?? "0")),
                    countryId: selectedCoutry.value.id.toString().trim(),
                    street: [
                      (address1Controller.value.text.toString()),
                      (address1Controller.value.text.toString()),
                      (address1Controller.value.text.toString())
                    ],
                    firstname: firstNameController.text,
                    lastname: lastNameController.text,
                    telephone: phoneNumberController.value.text.toString(),
                    postcode: zipPovinceController.value.text.toString(),
                    city: cityController.value.text.toString()),
                addressId);
        if (addressListModal != null) {
          // isScreenLoading.value = false;
          Get.back(result: true);
        }
      }
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isScreenLoading.value = false;
    }
  }
}

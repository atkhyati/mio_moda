import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/add_address_request/add_address_request.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../presentation/common_widget/alert_dialog/common_alert_dialog.dart';

class MyAddressController extends GetxController {
  RxInt index = 0.obs;

  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;
  RxBool isLoading = true.obs;
  Rx<MyAccountDetails> getAdressList = MyAccountDetails().obs;

  MyAddressController({this.countryCode});

  @override
  void onInit() {
    getAddressList();
    super.onInit();
  }

  Future<void> getAddressList() async {
    try {
      isLoading.value = true;
      MyAccountDetails? data =
          await addressListAPIRepository.getAddressListResponse();
      if (data != null) {
        getAdressList.value = data;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addAddress() async {
    var getList = [].obs;
    for (var i in getAdressList.value.addresses!) {
      getList.add(AddAddressRequest(
              region: i.region,
              countryId: "${i.countryId}",
              street: i.street,
              firstname: "${i.firstname}",
              lastname: "${i.lastname}",
              telephone: "${i.telephone}",
              postcode: "${i.postcode}",
              city: "${i.city}",
              defaultShipping: i.isShipping?.value ?? false,
              defaultBilling: i.isBilling?.value ?? false)
          .toJson());
    }
    postAddress(getList);
  }

  Future<void> postAddress(getaddress) async {
    debugPrint("Add Address $getaddress");
    var addaddressPost = CustomerData(
        customer: CustomerDetails(
      email: getAdressList.value.email.toString(),
      firstname: getAdressList.value.firstname.toString(),
      lastname: getAdressList.value.lastname.toString(),
      websiteId: getAdressList.value.websiteId,
      addresses: getaddress,
    )).toJson();
    try {
      MyAccountDetails data = await addressListAPIRepository
          .postAddAddressApiResponse(json.encode(addaddressPost));
      getAdressList.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> billingCheckButtonOnTap(Address? address) async {
    debugPrint('${address?.id.toString()}');
    debugPrint(
        '${address?.id.toString() != getAdressList.value.defaultBilling}');
    debugPrint('${getAdressList.value.defaultBilling}');
    if (getAdressList.value.defaultBilling != null &&
        address?.id.toString() != getAdressList.value.defaultBilling) {
      getAdressList.value.addresses
          ?.firstWhere((element) =>
              element.id ==
              int.parse(getAdressList.value.defaultBilling ?? '0'))
          .defaultBilling = false;
    }
    getAdressList.value.addresses
        ?.firstWhere((element) => element.id == address?.id)
        .defaultBilling = !(address?.defaultBilling ?? false);
    addAddress();
  }

  Future<void> shippingCheckButtonOnTap(Address? address) async {
    if (getAdressList.value.defaultShipping != null &&
        address?.id.toString() != getAdressList.value.defaultShipping) {
      getAdressList.value.addresses
          ?.firstWhere((element) =>
              element.id ==
              int.parse(getAdressList.value.defaultShipping ?? '0'))
          .defaultShipping = false;
    }
    getAdressList.value.addresses
        ?.firstWhere((element) => element.id == address?.id)
        .defaultShipping = !(address?.defaultShipping ?? false);
    addAddress();
  }

  Future confirmationDialogForRemove(
      Address? address, BuildContext context) async {
    showDialog<dynamic>(
        context: context,
        builder: (_) {
          return CommonAlertDialog(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            elevation: 6.0,
            radius: 0,
            backgroundColor: const Color(0xffFBECE5),
            titleWidget: Text(
              LanguageConstants.removeAddress.tr,
              style: const TextStyle(color: appColor),
            ),
            contentWidget: Text(
              LanguageConstants.areYouSureYouWantToRemoveAddress.tr,
              style: const TextStyle(color: appColor),
            ),
            actionWidgets: [
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13.0,
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: appColor,
                  ),
                  child: Text(
                    LanguageConstants.yes.tr,
                    style: AppTextStyle.textStyleUtils500(
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  Get.back<dynamic>();
                  deleteAddressOnTap(address);
                },
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13.0,
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: appColor,
                  ),
                  child: Text(
                    LanguageConstants.no.tr,
                    style: AppTextStyle.textStyleUtils500(
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  Get.back<dynamic>();
                },
              ),
            ],
          );
        });
  }

  Future<void> deleteAddressOnTap(Address? address) async {
    getAdressList.value.addresses
        ?.removeWhere((element) => element.id == address?.id);
    addAddress();
  }
}

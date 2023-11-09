import 'dart:convert';
import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/address_api_repository.dart';
import 'package:meta_package/api/models/add_address_request/add_address_request.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/services/add_address_service.dart';
import 'package:meta_package/translations/translations.dart';

import '../presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import '../theme/app_text_style.dart';

class MyAddressController extends GetxController {
  RxInt index = 0.obs;
  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;
  RxBool isLoading = true.obs;
  Rx<MyAccountDetails> getAdressList = MyAccountDetails().obs;

  List<bool> visibleMonth = <bool>[].obs;
  List<bool> visibleshiping = <bool>[].obs;

  MyAddressController({this.countryCode});

  @override
  void onInit() {
    getAddressList();
    super.onInit();
  }

  Future<void> getAddressList() async {
    isLoading.value = true;
    try {
      final MyAccountDetails? data =
          await addressListAPIRepository.getAddressListResponse();
      debugPrint("Details Of Address $data");
      if (data != null) {
        getAdressList.value = data;
        debugPrint("Address List Is ${getAdressList.value.addresses?.length}");
        for (var i = 0; i < (getAdressList.value.addresses?.length ?? 0); i++) {
          visibleMonth.add(false);
          visibleshiping.add(false);
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
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
    postaddress(getList);
  }

  String getTextForName(Address? getAddress) {
    return "${getAddress?.firstname}, ${getAddress?.lastname}, ${getAddress?.street?.first}, ${getAddress?.city}, ${getAddress?.postcode}";
  }

  Future<void> postaddress(getaddress) async {
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
      MyAccountDetails addressList = await addressListAPIRepository
          .postAddAddressApiResponse(json.encode(addaddressPost));
      getAdressList.value = addressList;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> billingCheckButtonOnTap(Address? address) async {
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

  Future<void> deleteAddressOnTap(Address? address) async {
    getAdressList.value.addresses
        ?.removeWhere((element) => element.id == address?.id);
    addAddress();
  }

  Future<void> confirmationDialogForRemove(
      Address? address, BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return CommonAlertDialog(
            elevation: 6.0,
            radius: 0,
            titleWidget: Text(LanguageConstants.removeAddress.tr,
                style: AppTextStyle.textStyleUtils700_16()),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            contentWidget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(LanguageConstants.areYouSureYouWantToRemoveAddress.tr,
                    style: AppTextStyle.textStyleUtils400_16()),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: darkBlue),
                        child: Text(
                          LanguageConstants.yes.tr,
                          style: AppTextStyle.textStyleUtils400(
                              size: 15, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        deleteAddressOnTap(address);
                      },
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: darkBlue),
                        child: Text(
                          LanguageConstants.no.tr,
                          style: AppTextStyle.textStyleUtils400(
                              size: 15, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

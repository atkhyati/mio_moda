import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:solo_luxury/all_imports.dart';

import '../../presentation/common_widget/alert_dialog/common_alert_dialog.dart';

class AddressBookController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;
  RxBool isLoading = true.obs;
  RxBool isDefaultLoading = false.obs;
  Rx<MyAccountDetails> getAdressList = MyAccountDetails().obs;

  AddressBookController({this.countryCode});

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
      if (data != null) {
        getAdressList.value = data;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading.value = false;
  }

  Future<void> addAddress() async {
    isDefaultLoading.value = true;
    debugPrint("Adding Address");
    addressListAPIRepository.addAddress(getAdressList);
    isDefaultLoading.value = false;
  }

  Future<void> addressOnTap(Address? address) async {
    dynamic result = await Get.toNamed<dynamic>(RoutesConstants.addAdressScreen,
        arguments: [getAdressList.value, address, 1]);
    if (result != null && result is bool && result) {
      getAddressList();
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

  Future confirmationDialogForRemove(
      Address? address, BuildContext context) async {
    showDialog<dynamic>(
      context: context,
      builder: (_) {
        return GetBuilder<CartController>(builder: (controller) {
          return CommonAlertDialog(
            elevation: 6.0,
            radius: 0,
            contentPadding: const EdgeInsets.all(14.0),
            insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
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
      },
    );
  }
}

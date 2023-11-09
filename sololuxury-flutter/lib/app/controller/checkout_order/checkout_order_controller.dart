import 'dart:async';
import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';
import 'package:meta_package/api/models/checkout_order/check_out_order_address_model.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/api/models/checkout_order/multi_address_model.dart'
    hide Region;
import 'package:meta_package/api/models/checkout_order/multi_address_model.dart'
    as multi_address hide Region;
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/screens/checkout_order/widget/checkout_add_address_dialog.dart';

class CheckoutOrderController extends GetxController {
  String countryCode = '1';
  RxString phoneErrorMsg = "".obs;
  final CartModel? cartlist =
      Get.arguments is CartModel ? Get.arguments as CartModel : null;
  Rx<ShippingInformationModel> shipInfoModel = ShippingInformationModel().obs;
  RxList<EstimateShippingMethodModel> estimatesList =
      <EstimateShippingMethodModel>[].obs;
  Rx<CouponCode> couponCode = CouponCode().obs;
  Rx<MultiAddressModel> multiAddressModel = MultiAddressModel().obs;
  Rx<MultiAddressModel> billingMultiAddressModel = MultiAddressModel().obs;
  RxInt selectedAddressIndex = 0.obs;
  RxInt selectedShippingIndex = 0.obs;
  RxInt selectedPaymentIndex = 0.obs;
  RxInt selectedBillingIndex = 0.obs;
  RxInt selectedCouponsIndex = (-1).obs;
  RxBool isSameAsBilling = true.obs;
  RxBool isShowItems = true.obs;
  RxBool isLoading = false.obs;
  RxBool showAppliedCoupons = false.obs;
  RxBool dialogLoaderShow = false.obs;
  RxString discountedAmount = '0'.obs;
  multi_address.Address? selectedAddress;
  RxBool isInValid = false.obs;

  // RxList<String> appliedCouponName = <String>[].obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> couponFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  final TextEditingController couponCodeController = TextEditingController();
  multi_address.Address shippingAddress = multi_address.Address();
  multi_address.Address billingAddress = multi_address.Address();
  final CartController cartController = Get.find();

  final CheckoutOrderAPIRepository checkoutOrderAPIRepository;
  final CartGetDataAPIRepository cartGetDataAPIRepository;
  final AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));

  CheckoutOrderController(
      {required this.checkoutOrderAPIRepository,
      required this.cartGetDataAPIRepository});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final zipPovinceController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final address3Controller = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();

  final billingFirstNameController = TextEditingController();
  final billingLastNameController = TextEditingController();
  final billingEmailController = TextEditingController();
  final billingPhoneNumberController = TextEditingController();
  final billingZipPovinceController = TextEditingController();
  final billingAddress1Controller = TextEditingController();
  final billingAddress2Controller = TextEditingController();
  final billingAddress3Controller = TextEditingController();
  final billingCityController = TextEditingController();
  final billingStateController = TextEditingController();
  Timer? debounceTimer;

  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString email = "".obs;
  RxString add1 = "".obs;
  RxString add2 = "".obs;
  RxString add3 = "".obs;
  RxString city = "".obs;
  RxString countryName = "".obs;
  RxString state = "".obs;
  RxString zipCode = "".obs;
  RxString phone = "".obs;
  RxString firstNameBilling = "".obs;
  RxString lastNameBilling = "".obs;
  RxString emailBilling = "".obs;
  RxString add1Billing = "".obs;
  RxString add2Billing = "".obs;
  RxString add3Billing = "".obs;
  RxString cityBilling = "".obs;
  RxString countryNameBilling = "".obs;
  RxString stateBilling = "".obs;
  RxString zipCodeBilling = "".obs;
  RxString phoneBilling = "".obs;
  RxString shippingCarrierCode = "freeshipping".obs;
  RxString shippingMethodCode = "freeshipping".obs;
  CheckOutOrderAddressModel checkOutOrderAddressModel =
      CheckOutOrderAddressModel();

  Rx<CountryListModel> selectedCoutry1 = CountryListModel().obs;
  Rx<CountryListModel> selectedCoutry2 = CountryListModel().obs;
  RxList<AvailableRegion> selectedStateList1 = <AvailableRegion>[].obs;
  RxList<AvailableRegion> selectedStateList2 = <AvailableRegion>[].obs;
  Rx<AvailableRegion> selectedState1 = AvailableRegion().obs;
  Rx<AvailableRegion> selectedState2 = AvailableRegion().obs;
  RxList<CountryListModel> getcountryList = RxList<CountryListModel>();
  RxList<bool> validatorList = List.generate(11, (index) => false).obs;
  RxList<bool> validatorListBilling = List.generate(11, (index) => false).obs;

  RxString selectedCoutry = "".obs;
  RxInt saveAddressBook = 1.obs;
  Rx<Totals> getTotalsData = Totals().obs;

  RxBool isEnabledPlaceOrder = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getCountryList();
    if (localStore.isGuest) {
      await getGuestAddress();
    } else {
      await getAddressList();
      await getEstimateAndShipInformationFromApi();
    }
    await getCoupons();
  }

  Future<void> placeOrder(BuildContext context) async {
    log("${selectedPaymentIndex.value}", name: "Index");
    String response;
    try {
      // todo : update payment available condition
      if (selectedPaymentIndex.value == 1 || selectedPaymentIndex.value == 3) {
        String code = shipInfoModel
                .value.paymentMethods?[selectedPaymentIndex.value].code ??
            '';
        if (localStore.customerToken.toString() == "") {
          response = await postGuestOrderForOrder(cartlist, code, "", context);
        } else {
          response = await postListForOrder(cartlist, code, "", context);
        }
        if (selectedPaymentIndex.value == 1) {
          if (response.isNotEmpty) {
            debugPrint("this is order id -> $response");
            Get.offAllNamed<dynamic>(
              RoutesConstants.orderConfirmScreen,
              arguments: response,
            );
          }
        } else if (selectedPaymentIndex.value == 3) {
          Map<String, dynamic> lineItems = {};
          List<Map<String, dynamic>> lineItemsArray = [];
          Map<String, dynamic> paymentRequest = {};
          for (var element in shipInfoModel.value.totals?.items ?? []) {
            lineItemsArray.add({
              "amountExcludingTax": 0,
              "amountIncludingTax": element.basePriceInclTax ?? 0.0,
              "description": element.name?.toString() ?? '',
              "id": element.itemId?.toString() ?? '',
              "quantity": element.qty ?? 0,
              "itemCategory": "",
              "taxPercentage": element.taxPercent ?? 0.0,
            });
          }
          debugPrint("ListItem -> $lineItems");
          String currency = localStore.currentCurrency;
          paymentRequest = {
            "currency": currency.isEmpty ? 'EUR' : currency,
            "amount": "${shipInfoModel.value.totals!.grandTotal}",
            "countryCode": localStore.currentCode.split("-")[0].toUpperCase(),
            "qty": shipInfoModel.value.totals!.itemsQty,
            "lineItems": lineItemsArray
          };
          debugPrint("Payment -> $paymentRequest");
          await responseFromNativeCode(
            response,
            context,
            paymentRequest,
          );
        }
      } else {
        // todo : Once we integrated all payment we can remove this alert. so let keep this string as hard coded for now
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.bottomSlide,
          title: LanguageConstants.warning.tr,
          desc:
              'Sorry, Selected payment not available for the moment. Please choose some other payment to continue',
          btnOkOnPress: () {},
        ).show();
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<void> billingAddressOnTap(
      int index, multi_address.Address? address) async {
    selectedBillingIndex.value = index;
    checkEnablePlaceOrder();
    if (selectedBillingIndex.value != index) {
      billingAddress = address ?? multi_address.Address();
      if (!isSameAsBilling.value) {
        await estimateAndShippingAPICall(
          shippingAddress,
          billingAddress,
        );
        isSameAsBilling.value = false;
      } else {
        await estimateAndShippingAPICall(
          shippingAddress,
          shippingAddress,
        );
      }
    }
  }

  Future<void> getGuestEstimateAndShipInformationFromApi(
      {String paramShipping = '', String paramBilling = ''}) async {
    isLoading.value = true;
    try {
      String params = "";
      params = paramShipping;
      debugPrint("paramShipping :- $paramShipping");
      debugPrint("Shiping param :- $params");
      List<EstimateShippingMethodModel> data =
          await checkoutOrderAPIRepository.postGuestEstimateAPIResponse(params);
      if (data.isNotEmpty == true) {
        estimatesList.value = [];
        estimatesList.value = data;
      }
      String params1 = paramBilling;
      debugPrint("Shipping Billing Param :- $params1");
      ShippingInformationModel data1 = await checkoutOrderAPIRepository
          .postGuestShippingInformationResponse(params1);
      shipInfoModel.value = data1;
      await getTotals();
      checkEnablePlaceOrder();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getGuestAddress() async {
    final String value = LocalStore.getSavedGuestAddress();

    if (value.isNotEmpty) {
      checkOutOrderAddressModel = CheckOutOrderAddressModel.fromJson(
          jsonDecode(value) as Map<String, dynamic>);
      firstName.value = checkOutOrderAddressModel.firstName ?? '';
      lastName.value = checkOutOrderAddressModel.lastName ?? '';
      email.value = checkOutOrderAddressModel.email ?? '';
      add1.value = checkOutOrderAddressModel.add1 ?? '';
      add2.value = checkOutOrderAddressModel.add2 ?? '';
      add3.value = checkOutOrderAddressModel.add3 ?? '';
      city.value = checkOutOrderAddressModel.city ?? '';
      countryName.value =
          checkOutOrderAddressModel.countryName?.fullNameEnglish ?? '';
      state.value = checkOutOrderAddressModel.state?.name ?? '';
      zipCode.value = checkOutOrderAddressModel.zipCode ?? '';
      phone.value = checkOutOrderAddressModel.phone ?? '';
      firstNameBilling.value = checkOutOrderAddressModel.firstNameBilling ?? '';
      lastNameBilling.value = checkOutOrderAddressModel.lastNameBilling ?? '';
      emailBilling.value = checkOutOrderAddressModel.emailBilling ?? '';
      add1Billing.value = checkOutOrderAddressModel.add1Billing ?? '';
      add2Billing.value = checkOutOrderAddressModel.add2Billing ?? '';
      add3Billing.value = checkOutOrderAddressModel.add3Billing ?? '';
      cityBilling.value = checkOutOrderAddressModel.cityBilling ?? '';
      countryNameBilling.value =
          checkOutOrderAddressModel.countryNameBilling?.fullNameEnglish ?? '';
      stateBilling.value = checkOutOrderAddressModel.stateBilling?.name ?? '';
      zipCodeBilling.value = checkOutOrderAddressModel.zipCodeBilling ?? '';
      phoneBilling.value = checkOutOrderAddressModel.phoneBilling ?? '';
      shippingCarrierCode.value =
          checkOutOrderAddressModel.shippingCarrierCode ?? 'freeshipping';
      shippingMethodCode.value =
          checkOutOrderAddressModel.shippingMethodCode ?? 'freeshipping';

      selectedShippingIndex.value =
          shippingCarrierCode.value == 'freeshipping' ? 0 : 1;

      firstNameController.text = checkOutOrderAddressModel.firstName ?? '';
      lastNameController.text = checkOutOrderAddressModel.lastName ?? '';
      emailController.text = checkOutOrderAddressModel.email ?? '';
      address1Controller.text = checkOutOrderAddressModel.add1 ?? '';
      address2Controller.text = checkOutOrderAddressModel.add2 ?? '';
      address3Controller.text = checkOutOrderAddressModel.add3 ?? '';
      cityController.text = checkOutOrderAddressModel.city ?? '';
      selectedCoutry1.value =
          checkOutOrderAddressModel.countryName ?? CountryListModel();
      selectedStateList1.value = selectedCoutry1.value.availableRegions ?? [];
      selectedState1.value =
          checkOutOrderAddressModel.state ?? AvailableRegion();
      stateController.text = checkOutOrderAddressModel.state?.name ?? '';
      zipPovinceController.text = checkOutOrderAddressModel.zipCode ?? '';
      phoneNumberController.text =
          checkOutOrderAddressModel.phone ?? '9836565489';
      billingFirstNameController.text =
          checkOutOrderAddressModel.firstNameBilling ?? '';
      billingLastNameController.text =
          checkOutOrderAddressModel.lastNameBilling ?? '';
      billingEmailController.text =
          checkOutOrderAddressModel.emailBilling ?? '';
      billingAddress1Controller.text =
          checkOutOrderAddressModel.add1Billing ?? '';
      billingAddress2Controller.text =
          checkOutOrderAddressModel.add2Billing ?? '';
      billingAddress3Controller.text =
          checkOutOrderAddressModel.add3Billing ?? '';
      billingCityController.text = checkOutOrderAddressModel.cityBilling ?? '';
      selectedCoutry2.value =
          checkOutOrderAddressModel.countryName ?? CountryListModel();
      selectedState2.value =
          checkOutOrderAddressModel.state ?? AvailableRegion();
      billingStateController.text =
          checkOutOrderAddressModel.stateBilling?.name ?? '';
      billingZipPovinceController.text =
          checkOutOrderAddressModel.zipCodeBilling ?? '';
      billingPhoneNumberController.text =
          checkOutOrderAddressModel.phoneBilling ?? '';
      setOnAddressChangeDeBouncer();
    } else {
      setOnAddressChangeDeBouncer();
    }
  }

  Future<void> setAddress() async {
    checkOutOrderAddressModel = CheckOutOrderAddressModel(
      firstName: firstName.value,
      lastName: lastName.value,
      email: email.value,
      add1: add1.value,
      add2: add2.value,
      add3: add3.value,
      city: city.value,
      countryName: selectedCoutry1.value,
      state: selectedState1.value,
      zipCode: zipCode.value,
      phone: phone.value,
      firstNameBilling: firstNameBilling.value,
      lastNameBilling: lastNameBilling.value,
      emailBilling: emailBilling.value,
      add1Billing: add1Billing.value,
      add2Billing: add2Billing.value,
      add3Billing: add3Billing.value,
      cityBilling: cityBilling.value,
      countryNameBilling: selectedCoutry2.value,
      stateBilling: selectedState2.value,
      zipCodeBilling: zipCodeBilling.value,
      phoneBilling: phoneBilling.value,
      shippingCarrierCode: (estimatesList.isEmpty)
          ? shippingCarrierCode.value
          : estimatesList[selectedShippingIndex.value].carrierCode ??
              'freeshipping',
      shippingMethodCode: (estimatesList.isEmpty)
          ? shippingMethodCode.value
          : estimatesList[selectedShippingIndex.value].methodCode ??
              'freeshipping',
    );
    await LocalStore.setSavedGuestAddress(
        jsonEncode(checkOutOrderAddressModel.toJson()));
  }

  void setOnAddressChangeDeBouncer() {
    if (debounceTimer?.isActive ?? false) {
      debounceTimer?.cancel();
    }
    debounceTimer = Timer(
      const Duration(milliseconds: 750),
      () {
        if (formKey.currentState?.validate() ?? false) {
          setAddress();
          shippingValidationAddress();
        }
      },
    );
  }

  void couponEnable() {
    isInValid.value = false;
    if (couponCodeController.text != '') {
      if (showAppliedCoupons.value) {
        showDialogForRemoveCoupons();
      } else {
        addCouponsToCartForField(
          couponCodeController.text,
        );
      }
    }
  }

  Future<void> myBillingAddress() async {
    isSameAsBilling.value = !isSameAsBilling.value;
    shippingAddress =
        multiAddressModel.value.addresses![selectedAddressIndex.value];

    if (isSameAsBilling.value) {
      billingAddress =
          multiAddressModel.value.addresses![selectedAddressIndex.value];
      await estimateAndShippingAPICall(shippingAddress, billingAddress);
    } else {
      billingAddress =
          multiAddressModel.value.addresses![selectedBillingIndex.value];
      await estimateAndShippingAPICall(shippingAddress, billingAddress);
    }
    checkEnablePlaceOrder();
  }

  Future<void> getEstimateAndShipInformationFromApi() async {
    try {
      isLoading.value = true;
      MultiAddressModel? data =
          await addressListAPIRepository.getMultiAddressAPIResponse();
      log('getAddressList 000 :-> $data');
      if (data != null) {
        multiAddressModel.value = data;
        billingMultiAddressModel.value = data;
        log('billingMultiAddressModel?.value is:--->>> ${multiAddressModel.value.addresses}');
        if (multiAddressModel.value.addresses?.isNotEmpty ?? false) {
          await estimateAndShippingAPICall(
            multiAddressModel.value.addresses?.first ?? multi_address.Address(),
            multiAddressModel.value.addresses?.first ?? multi_address.Address(),
          );
          if (multiAddressModel.value.addresses?.isNotEmpty ?? false) {
            shippingAddress = multiAddressModel.value.addresses?.first ??
                multi_address.Address();
          }
        }
        checkEnablePlaceOrder();
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> shipHereOnTap(int index, multi_address.Address? address) async {
    if (selectedAddressIndex.value != index) {
      shippingAddress = address ?? multi_address.Address();
      if (!isSameAsBilling.value) {
        await estimateAndShippingAPICall(
          shippingAddress,
          billingAddress,
        );
      } else {
        await estimateAndShippingAPICall(
          shippingAddress,
          shippingAddress,
        );
      }
    }
    selectedAddressIndex.value = index;
  }

  Future<void> shippingAddressOnTap(int index) async {
    selectedShippingIndex.value = index;
    if (localStore.isGuest) {
      await setAddress();
      await shippingValidationAddress();
    } else {
      if (!isSameAsBilling.value) {
        await estimateAndShippingAPICall(
          shippingAddress,
          billingAddress,
        );
      } else {
        await estimateAndShippingAPICall(
          shippingAddress,
          shippingAddress,
        );
      }
    }
  }

  Future<void> estimateAndShippingAPICall(
    multi_address.Address address,
    multi_address.Address billingAddress,
  ) async {
    isLoading.value = true;
    try {
      selectedAddress = billingAddress;

      List<EstimateShippingMethodModel>? data1 =
          await checkoutOrderAPIRepository.postEstimate(
        address,
        multiAddressModel.value.email!,
        isSameAsBilling.value,
      );
      if (data1.isNotEmpty == true) {
        estimatesList.value = data1;
      }

      var carrierCode = (estimatesList.isEmpty)
          ? shippingCarrierCode.value
          : estimatesList[selectedShippingIndex.value].carrierCode ??
              kCheckoutShippingCodeFreeShipping;
      var carrierMethodCode = (estimatesList.isEmpty)
          ? shippingMethodCode.value
          : estimatesList[selectedShippingIndex.value].methodCode ??
              kCheckoutShippingCodeFreeShipping;

      shipInfoModel.value =
          await checkoutOrderAPIRepository.postShippingInformation(
              address,
              billingAddress,
              multiAddressModel.value.email!,
              isSameAsBilling.value,
              carrierCode,
              carrierMethodCode);

      await getTotals();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> responseFromNativeCode(String? orderId, BuildContext context,
      Map<String, dynamic> paymentRequest) async {
    String? resultCode;
    try {
      if (orderId?.isNotEmpty == true) {
        isLoading.value = true;
        paymentRequest['reference'] = orderId;
        final String? result = await platform.invokeMethod<String>(
          'helloFromNativeCode',
          paymentRequest,
        );
        isLoading.value = false;
        if (result != null) {
          dynamic paymentResponse;
          try {
            paymentResponse = jsonDecode(result);
          } catch (e) {
            debugPrint(e.toString());
            paymentResponse = result;
          }
          if (paymentResponse is String) {
            resultCode = paymentResponse;
          } else if (paymentResponse is Map<String, dynamic>) {
            resultCode = paymentResponse['resultCode'] as String?;
          }
          debugPrint("Response Map Is Her $resultCode");
          if (resultCode == "Authorised") {
            AwesomeDialog(
              context: context,
              dismissOnBackKeyPress: false,
              dismissOnTouchOutside: false,
              dialogType: DialogType.success,
              animType: AnimType.bottomSlide,
              title: LanguageConstants.success.tr,
              desc: LanguageConstants.thePaymentWasSuccessful.tr,
              btnOkOnPress: () async {
                Get.offAllNamed(
                  RoutesConstants.orderConfirmScreen,
                  arguments: orderId,
                );
              },
            ).show();
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.bottomSlide,
              title: LanguageConstants.error.tr,
              desc: resultCode,
              btnOkOnPress: () {},
            ).show();
          }
        }
      }
    } on PlatformException catch (e) {
      debugPrint("Failed to Invoke: '${e.message}'.");
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<String> postListForOrder(CartModel? cartlist, String method,
      String paymentId, BuildContext context) async {
    isLoading.value = true;

    String? postCreateOrder;
    try {
      postCreateOrder = await checkoutOrderAPIRepository.postPaymentInformation(
        email: cartlist?.billingAddress?.email ?? '',
        paymentMethod: method,
        selectedAddress: selectedAddress!,
      );
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    }
    debugPrint("this postListForOrder is $postCreateOrder");
    isLoading.value = false;
    return postCreateOrder ?? '';
  }

//Create Guest Order Api
  Future<String> postGuestOrderForOrder(CartModel? cartlist, String method,
      String paymentId, BuildContext context) async {
    try {
      isLoading.value = true;
      Map podLIst = {
        //todo replace correct payment method
        "paymentMethod": {"method": "checkmo"}
      };

      debugPrint("Create Order Api List is $podLIst");
      String postCreateOrder =
          await checkoutOrderAPIRepository.postGuestCreateOrderAPIResponse(
              json.encode(podLIst), localStore.guestToken.toString());

      if (postCreateOrder.isNotEmpty == true) {
        localStore.guestToken = '';
        await LocalStore.removePrefValue(kStorageConstGuestauthToken);
      }
      return postCreateOrder;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
    return '';
  }

  Future<void> getCountryList() async {
    try {
      isLoading.value = true;
      List<CountryListModel>? data =
          await addressListAPIRepository.getCountryListResponse();
      if (data?.isNotEmpty == true) {
        getcountryList.value = data!;
        getcountryList.removeWhere(
            (element) => (element.fullNameEnglish?.isEmpty ?? true));
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

//CountrList
  Rx<MyAccountDetails> getAdressList1 = MyAccountDetails().obs;

  Future<void> getAddressList() async {
    try {
      isLoading.value = true;
      MyAccountDetails? data =
          await addressListAPIRepository.getAddressListResponse();
      if (data != null) {
        getAdressList1.value = data;
        debugPrint("Address List Is $getAdressList1");
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCoupons() async {
    try {
      isLoading.value = true;
      CouponCode data = await cartGetDataAPIRepository.getCoupons();
      couponCode.value = data;
      debugPrint("getCoupons List Is checkout ${couponCode.value}");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getTotals({bool showDialog = false}) async {
    try {
      Totals data = await cartGetDataAPIRepository.getTotals();
      getTotalsData.value = data;
      if (getTotalsData.value.getDiscount() != null) {
        showAppliedCoupons.value = true;
        couponCodeController.text =
            (getTotalsData.value.getDiscountName() ?? '')
                .split('(')
                .last
                .split(')')
                .first;
      }
      if (showDialog) {
        showAppliedCoupons.value = true;
        showDialogForSuccessfullyAppliedCoupons(
          couponCodeController.text,
          data.discountAmount?.abs().toString() ?? '0',
        );
      }
      debugPrint("getCoupons getTotals List Is ${shipInfoModel.value.totals}");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, st) {
      log('e.toString() is:-->>>$e && st is:-->>$st');
    }
  }

  Future<void> addCouponsToCartForField(String code) async {
    try {
      isLoading.value = true;
      String data = await cartGetDataAPIRepository.addCouponsToCart(code);
      await getTotals(showDialog: true);
      debugPrint("getCoupons List Is addCouponsToCart $data");
      await getTotals(showDialog: true);
      // getAppliedCoupon();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  void showDialogForSuccessfullyAppliedCoupons(
      String couponCode, String savedValue) {
    showDialog<dynamic>(
      context: Get.context!,
      builder: (context) {
        return CommonAlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // titlePadding: EdgeInsets.zero,
          backgroundColor: const Color(0xFFF9EAE3),
          contentWidget: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.close,
                      size: 22,
                      color: Colors.transparent,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.close,
                          size: 22,
                          color: appColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    '$couponCode ${LanguageConstants.cOUPONAPPLIEDSUCCESSFULLYYOUSAVED.tr} ${localStore.currentCurrency} $savedValue ${LanguageConstants.oNTHISORDER.tr}',
                  ),
                ),
                const SizedBox(height: 30.0),
                SizedBox(
                  height: 40.0,
                  child: CommonButton(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    buttonType: ButtonType.elevatedButton,
                    onPressed: () {
                      Get.back<dynamic>();
                    },
                    elevation: 0.0,
                    color: appColorButton,
                    borderRadius: 0.0,
                    child: CommonTextPoppins(
                      LanguageConstants.okay.tr,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        );
      },
    );
  }

  void showDialogForRemoveCoupons() {
    showDialog<dynamic>(
      context: Get.context!,
      builder: (context) {
        return CommonAlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // titlePadding: EdgeInsets.zero,
          backgroundColor: const Color(0xFFF9EAE3),
          contentWidget: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.close,
                      size: 22,
                      color: Colors.transparent,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.close,
                          size: 22,
                          color: appColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "${LanguageConstants.areYouSureYouWantToRemove.tr} ${couponCodeController.text} ${LanguageConstants.couponCode.tr}?",
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40.0,
                      child: CommonButton(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        buttonType: ButtonType.elevatedButton,
                        onPressed: () async {
                          deleteAppliedCoupon();
                          Get.back<dynamic>();
                        },
                        elevation: 0.0,
                        color: appColorButton,
                        borderRadius: 0.0,
                        child: CommonTextPoppins(
                          LanguageConstants.okay.tr,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      height: 40.0,
                      child: CommonButton(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        buttonType: ButtonType.elevatedButton,
                        onPressed: () {
                          Get.back<dynamic>();
                        },
                        elevation: 0.0,
                        color: appColorButton,
                        borderRadius: 0.0,
                        child: CommonTextPoppins(
                          LanguageConstants.cancel.tr,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> deleteAppliedCoupon() async {
    try {
      isLoading.value = true;
      String data = await cartGetDataAPIRepository.deleteAppliedCoupons();
      await getTotals();
      if (data.isNotEmpty == true) {
        showAppliedCoupons.value = false;
        couponCodeController.text = '';
        // appliedCouponName.value = [];
        debugPrint(
            "getCoupons getTotals List Is ${shipInfoModel.value.totals}");
        Validators.apiResponseMessage(
          // body: data,
          message: LanguageConstants.couponRemoved.tr,
          color: Colors.green,
        );
      } else {
        showAppliedCoupons.value = false;
        // appliedCouponName.value = [];
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

//Api Calling

  Future<void> addAddress() async {
    try {
      if (phoneNumberController.text.isEmpty) {
        phoneErrorMsg.value = LanguageConstants.phoneNumberIsRequired.tr;
      } else {
        phoneErrorMsg.value = "";
      }
      if (formKey2.currentState?.validate() ?? false) {
        dialogLoaderShow.value = true;
        var getList = <Map<String, dynamic>>[].obs;
        for (var i in getAdressList1.value.addresses!) {
          getList.add(AddAddressRequest(
                  region: i.region,
                  countryId: "${i.countryId}",
                  street: i.street,
                  firstname: "${i.firstname}",
                  lastname: "${i.lastname}",
                  telephone: "+$countryCode${i.telephone}",
                  postcode: "${i.postcode}",
                  city: "${i.city}",
                  defaultShipping: false,
                  defaultBilling: false)
              .toJson());
        }

        getList.add(AddAddressRequest(
                region: Region(
                    regionCode: selectedState1.value.name == null
                        ? selectedCoutry1.value.twoLetterAbbreviation.toString()
                        : selectedState1.value.code ?? '',
                    region: selectedState1.value.name == null
                        ? stateController.text
                        : selectedState1.value.name ?? '',
                    regionId: selectedState1.value.name == null
                        ? 12
                        : int.parse(selectedState1.value.id ?? '')),
                countryId: selectedCoutry1.value.id.toString(),
                street: [(address1Controller.text.toString())],
                firstname: firstNameController.text.toString(),
                lastname: lastNameController.text.toString(),
                telephone:
                    "+$countryCode${phoneNumberController.text.toString()}",
                postcode: zipPovinceController.text.toString(),
                city: cityController.text.toString(),
                defaultShipping: false,
                defaultBilling: false)
            .toJson());

        await postaddress(getList);
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      dialogLoaderShow.value = false;
    }
  }

  Future<void> postaddress(List<Map<String, dynamic>> getaddress) async {
    debugPrint("Add Address $getaddress");
    Map addaddressPost = {
      "customer": {
        "email": getAdressList1.value.email.toString(),
        "firstname": getAdressList1.value.firstname.toString(),
        "lastname": getAdressList1.value.lastname.toString(),
        "website_id": getAdressList1.value.websiteId.toString(),
        "addresses": getaddress,
      }
    };
    try {
      await addressListAPIRepository
          .postAddAddressApiResponse(json.encode(addaddressPost));
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }

    selectedCoutry1 = CountryListModel().obs;
    selectedState1 = AvailableRegion().obs;

    stateController.clear();
    address1Controller.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    zipPovinceController.clear();
    cityController.clear();
    Get.back<dynamic>();
    getAddressList();
    getEstimateAndShipInformationFromApi();
  }

  //Add To Cart Open Dialog3
  void showDialogAddress(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return CheckOutAddAddressDialog();
      },
    );
  }

  Future<void> shippingValidationAddress() async {
    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isNotEmpty &&
        add1.isNotEmpty &&
        city.isNotEmpty &&
        add2.isNotEmpty &&
        countryName.isNotEmpty &&
        add3.isNotEmpty &&
        state.isNotEmpty &&
        zipCode.isNotEmpty &&
        phone.isNotEmpty) {
      String params = json.encode({
        "address": {
          "region": (selectedState1.value.name != '' &&
                  selectedState1.value.name != null)
              ? selectedState1.value.name
              : stateController.text,
          "region_id":
              (selectedState1.value.id != null && selectedState1.value.id != '')
                  ? selectedState1.value.id
                  : null,
          "region_code": (selectedState1.value.code != null &&
                  selectedState1.value.code != "")
              ? selectedState1.value.code
              : null,
          "country_id": selectedCoutry1.value.id,
          "street": [
            add1.value,
            add2.value,
            add3.value,
          ],
          "postcode": zipCode.value,
          "city": city.value,
          "firstname": firstName.value,
          "lastname": lastName.value,
          "email": email.value,
          "telephone": phone.value,
          "same_as_billing": isSameAsBilling.value ? 1 : 0
        }
      });
      debugPrint("params pass -> $params");
      if (isSameAsBilling.value) {
        String params1 = jsonEncode({
          "addressInformation": {
            "shipping_address": {
              "region": (selectedState1.value.name != null &&
                      selectedState1.value.name != "")
                  ? selectedState1.value.name
                  : stateController.text,
              "region_id": (selectedState1.value.id != null &&
                      selectedState1.value.id != "")
                  ? selectedState1.value.id
                  : null,
              "region_code": (selectedState1.value.code != null &&
                      selectedState1.value.code != "")
                  ? selectedState1.value.code
                  : null,
              "country_id": selectedCoutry1.value.id,
              "street": [
                add1.value,
                add2.value,
                add3.value,
              ],
              "postcode": zipCode.value,
              "city": city.value,
              "firstname": firstName.value,
              "lastname": lastName.value,
              "email": email.value,
              "telephone": phone.value,
            },
            "billing_address": {
              "region": (selectedState1.value.name != null &&
                      selectedState1.value.name != "")
                  ? selectedState1.value.name
                  : stateController.text,
              "region_id": (selectedState1.value.id != null &&
                      selectedState1.value.id != "")
                  ? selectedState1.value.id
                  : null,
              "region_code": (selectedState1.value.code != null &&
                      selectedState1.value.code != "")
                  ? selectedState1.value.code
                  : null,
              "country_id": selectedCoutry1.value.id,
              "street": [
                add1.value,
                add2.value,
                add3.value,
              ],
              "postcode": zipCode.value,
              "city": city.value,
              "firstname": firstName.value,
              "lastname": lastName.value,
              "email": email.value,
              "telephone": phone.value,
            },
            "shipping_carrier_code": (estimatesList.isEmpty)
                ? shippingCarrierCode.value
                : estimatesList[selectedShippingIndex.value].carrierCode ??
                    'freeshipping',
            "shipping_method_code": (estimatesList.isEmpty)
                ? shippingMethodCode.value
                : estimatesList[selectedShippingIndex.value].methodCode ??
                    'freeshipping',
          }
        });
        await getGuestEstimateAndShipInformationFromApi(
          paramShipping: params,
          paramBilling: params1,
        );
        AppConstants.dismissKeyboard();
      } else {
        if (firstNameBilling.isNotEmpty &&
            lastNameBilling.isNotEmpty &&
            emailBilling.isNotEmpty &&
            add1Billing.isNotEmpty &&
            cityBilling.isNotEmpty &&
            add2Billing.isNotEmpty &&
            countryNameBilling.isNotEmpty &&
            add3Billing.isNotEmpty &&
            stateBilling.isNotEmpty &&
            zipCodeBilling.isNotEmpty &&
            phoneBilling.isNotEmpty) {
          String params1 = jsonEncode({
            "addressInformation": {
              "shipping_address": {
                "region": selectedState1.value.name ?? stateController.text,
                "region_id": selectedState1.value.id,
                "region_code": selectedState1.value.code,
                "country_id": selectedCoutry1.value.id,
                "street": [
                  add1.value,
                  add2.value,
                  add3.value,
                ],
                "postcode": zipCode.value,
                "city": city.value,
                "firstname": firstName.value,
                "lastname": lastName.value,
                "email": email.value,
                "telephone": phone.value,
              },
              "billing_address": {
                "region":
                    selectedState2.value.name ?? billingStateController.text,
                "region_id": selectedState2.value.id,
                "region_code": selectedState2.value.code,
                "country_id": selectedCoutry2.value.id,
                "street": [
                  add1Billing.value,
                  add2Billing.value,
                  add3Billing.value,
                ],
                "postcode": zipCodeBilling.value,
                "city": cityBilling.value,
                "firstname": firstNameBilling.value,
                "lastname": lastNameBilling.value,
                "email": emailBilling.value,
                "telephone": phoneBilling.value
              },
              "shipping_carrier_code": (estimatesList.isEmpty)
                  ? shippingCarrierCode.value
                  : estimatesList[selectedShippingIndex.value].carrierCode ??
                      'freeshipping',
              "shipping_method_code": (estimatesList.isEmpty)
                  ? shippingMethodCode.value
                  : estimatesList[selectedShippingIndex.value].methodCode ??
                      'freeshipping',
            }
          });
          await getGuestEstimateAndShipInformationFromApi(
            paramShipping: params,
            paramBilling: params1,
          );
          AppConstants.dismissKeyboard();
        }
      }
    }
    checkEnablePlaceOrder();
  }

  void checkEnablePlaceOrder() {
    if (localStore.isGuest) {
      if (isSameAsBilling.value) {
        if (firstName.isNotEmpty &&
            lastName.isNotEmpty &&
            email.isNotEmpty &&
            add1.isNotEmpty &&
            city.isNotEmpty &&
            add2.isNotEmpty &&
            countryName.isNotEmpty &&
            add3.isNotEmpty &&
            state.isNotEmpty &&
            zipCode.isNotEmpty &&
            phone.isNotEmpty) {
          log('hello test123');
          isEnabledPlaceOrder.value = true;
        } else {
          isEnabledPlaceOrder.value = false;
        }
      } else {
        if (firstNameBilling.isNotEmpty &&
            lastNameBilling.isNotEmpty &&
            emailBilling.isNotEmpty &&
            add1Billing.isNotEmpty &&
            cityBilling.isNotEmpty &&
            add2Billing.isNotEmpty &&
            countryNameBilling.isNotEmpty &&
            add3Billing.isNotEmpty &&
            stateBilling.isNotEmpty &&
            zipCodeBilling.isNotEmpty &&
            phoneBilling.isNotEmpty) {
          isEnabledPlaceOrder.value = true;
        } else {
          isEnabledPlaceOrder.value = false;
        }
      }
    } else {
      if (multiAddressModel.value.addresses?.isNotEmpty ?? false) {
        isEnabledPlaceOrder.value = true;
      } else {
        isEnabledPlaceOrder.value = false;
      }
    }
  }
}

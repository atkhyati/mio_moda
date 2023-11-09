import 'dart:developer';

import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/newsletter_api_respository.dart';
import 'package:meta_package/api/api_repository/track_your_order_repository.dart';
import 'package:meta_package/api/models/guest_order_track/guest_order_track.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';

import '../core/consts/app_constants.dart';
import '../presentation/common_widgets/common_widget/common_button.dart';
import '../presentation/common_widgets/common_widget/common_message/validator.dart';
import '../presentation/common_widgets/common_widget/common_text_poppins.dart';
import '../presentation/screens/track_your_order/track_your_negativescreen.dart';

class GuestReturnsController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  TextEditingController orderIdController = TextEditingController();
  TextEditingController billingLastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  TextEditingController subscribeEmailController = TextEditingController();
  final NewsletterApiRepository newsletterAPIRepository =
      NewsletterApiRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxBool isLoading = false.obs;
  RxBool isInValid = false.obs;
  RxBool isOrderLoading = false.obs;
  Rx<MyOrdersDataItem> myOrdersItems = MyOrdersDataItem().obs;
  RxBool isValid = false.obs;

  final TrackYourOrderAPIRepository trackYourOrderAPIRepository =
      TrackYourOrderAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  Future<void> subscribeNewsLetter() async {
    isLoading.value = true;
    try {
      final response = await newsletterAPIRepository.subscribeNewsLetter(
          email: subscribeEmailController.text);
      if (response.message != null && response.message != '') {
        subscribeEmailController.text = "";
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CommonTextPoppins(
              response.message.toString(),
            ),
          ),
        );
      }
      log('', name: "Value");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
    isLoading.value = false;
  }

  Future<void> getGuestTrackYourOrder() async {
    isValid.value = true;
    isOrderLoading.value = true;
    debugPrint("Get getTrackYourOrder ===>");
    update(["forms"]);
    try {
      if (orderIdController.value.text != "") {
        MyOrdersDataItem itemsData = await trackYourOrderAPIRepository
            .getGuestTrackYourOrderApiResponse(GuestOrderForm(GuestOrderRequest(
                    orderId: orderIdController.text,
                    billingLastName: billingLastnameController.text,
                    type: "email",
                    email: emailController.text)
                .toJson()));

        myOrdersItems.value = itemsData;

        if (myOrdersItems.value.incrementId != null) {
          Get.toNamed<dynamic>(RoutesConstants.orderDetailScreen,
              arguments: ['', myOrdersItems.value]);
        } else {
          Get.to<dynamic>(() => const TrackYourRequestNegative());
        }
        orderIdController.clear();
        billingLastnameController.clear();
        emailController.clear();
        update(["forms"]);
        isOrderLoading.value = false;
      }
    } on ApiException catch (e) {
      errorToast(
          LanguageConstants.weCannotFindAnyOrdersAssociatedWithThisEmail.tr);
      isOrderLoading.value = false;
      ExceptionHandler.apiExceptionError(
          e: e,
          callBack: (String errorMsg) {
            Get.to<dynamic>(() => const TrackYourRequestNegative());
          });
    } catch (e) {
      isOrderLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }
}

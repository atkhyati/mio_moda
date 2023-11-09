import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/newsletter_api_respository.dart';
import 'package:meta_package/api/api_repository/track_your_order_repository.dart';
import 'package:meta_package/api/models/guest_order_track/guest_order_track.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';

import '../../core/const/app_constants.dart';
import '../../core/utils/lang_directory/language_constant.dart';
import '../../presentation/common_widget/common_message/app_routes.dart';
import '../../presentation/common_widget/common_message/error_dialog.dart';
import '../../presentation/common_widget/common_message/validator.dart';
import '../../presentation/common_widget/common_widget/common_text_poppins.dart';
import '../../presentation/screens/track_your_ticket_mail/track_ticket_negativeresponse.dart';

class GuestReturnsController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  TextEditingController orderIdController = TextEditingController();
  TextEditingController billingLastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subscribeEmailController = TextEditingController();
  final NewsletterApiRepository newsletterAPIRepository =
      NewsletterApiRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxBool isLoading = false.obs;
  Rx<MyOrdersDataItem> myOrdersItems = MyOrdersDataItem().obs;
  RxBool isValid = false.obs;
  RxBool isOrderLoading = false.obs;
  final TrackYourOrderAPIRepository trackYourOrderAPIRepository =
      TrackYourOrderAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  Future<void> subscribeNewsLetter(String email) async {
    isLoading.value = true;
    try {
      final response =
          await newsletterAPIRepository.subscribeNewsLetter(email: email);
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
          Get.toNamed<dynamic>(RoutesConstants.orderDetailsScreen,
              arguments: ['', myOrdersItems.value]);
        } else {
          Get.to<dynamic>(() => const TrackYourTicketNoDataFound());
        }
        orderIdController.clear();
        billingLastnameController.clear();
        emailController.clear();
        update(["forms"]);
      }
      isOrderLoading.value = false;
    } on ApiException catch (e) {
      isOrderLoading.value = false;
      errorToast(
          LanguageConstants.weCannotFindAnyOrdersAssociatedWithThisEmail.tr);
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      isOrderLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }
}

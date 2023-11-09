import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_ticket_api_repository.dart';
import 'package:meta_package/api/api_repository/special_request_repository.dart';
import 'package:meta_package/api/models/my_ticket/create_ticket_request.dart';
import 'package:meta_package/api/services/ticket_service.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/error_dialog.dart';

import '../../presentation/common_widget/common_message/app_routes.dart';
import '../../presentation/common_widget/common_message/validator.dart';

class SpecialRequestController extends GetxController {
  String countryCode = '1';

  RxBool isSubmitButtonPressed = false.obs;
  SpecialRequestRepository specialRequestRepository =
      SpecialRequestRepository(baseUrl: AppConstants.apiEndPointLogin);
  final MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));
 bool isError=false;

  SpecialRequestController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    if (localStore.userDetail.email != null) {
      emailController.text = localStore.userDetail.email ?? '';
      nameController.text = localStore.userDetail.firstname ?? '';
      lastNameController.text = localStore.userDetail.lastname ?? '';
    }
    brandNameController.text =
        Get.arguments[0] is String ? Get.arguments[0].toString() : '';
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController styleController = TextEditingController();
  TextEditingController keywordController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  bool isValidation = false;

  bool validation() {
    if (nameController.text.trim() == "") {
      return false;
    } else if (lastNameController.text.trim() == "") {
      return false;
    } else if (!GetUtils.isEmail(emailController.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    } else if (phoneNumberController.text.trim() == "") {
      return false;
    } else if (brandNameController.text.trim() == "") {
      return false;
    } else if (styleController.text.trim() == "") {
      return false;
    } else if (keywordController.text.trim() == "") {
      return false;
    } else if (imageUrlController.text.trim() == "") {
      return false;
    } else if (remarkController.text.trim() == "") {
      return false;
    }
    return true;
  }

  Future<void> contactUsPost(context) async {
    try {
      isValidation = true;
      update(["Create"]);
      if (validation()) {
        isSubmitButtonPressed.value = true;

        Map<String, dynamic> response =
            (await specialRequestRepository.getSpecialRequestApiResponse(
                nameController.value.text,
                lastNameController.value.text,
                emailController.value.text,
                "+$countryCode${phoneNumberController.value.text}",
                brandNameController.value.text,
                styleController.value.text,
                keywordController.value.text,
                imageUrlController.value.text,
                remarkController.value.text,
                localStore.userDetail.id.toString(),
                localStore.currentCode));
        if (response.containsKey('message')) {
          Get.toNamed(RoutesConstants.requestReceivedScreen);
        }
        Map<String, dynamic> response1 =
            await myTicketAPIRepository.postCreateMyTickets(TicketForm(
          CreateTicketRequest(
                  name: nameController.value.text,
                  lastName: lastNameController.value.text,
                  email: emailController.value.text,
                  phone: "+$countryCode${phoneNumberController.value.text}",
                  brand: brandNameController.value.text,
                  style: styleController.value.text,
                  keyword: keywordController.value.text,
                  imageUrl: imageUrlController.value.text,
                  remarks: remarkController.value.text,
                  customerId: localStore.userDetail.id.toString(),
                  langCode: localStore.currentCode,
                  ticketType: null)
              .toJson(),
        ));
        if (response1.containsKey('message')) {
          Get.toNamed<dynamic>(RoutesConstants.requestReceivedScreen);
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isSubmitButtonPressed.value = false;
    }
  }

  String getHeader() {
    return Get.arguments[1] == "brand"
        ? LanguageConstants.brandProductQuery.tr
        : LanguageConstants.categoryProductQuery.tr;
  }
}

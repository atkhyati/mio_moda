import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_ticket_api_repository.dart';
import 'package:meta_package/api/api_repository/special_request_repository.dart';
import 'package:meta_package/api/models/my_ticket/create_ticket_request.dart';
import 'package:meta_package/api/services/ticket_service.dart';

import '../core/utils/lang_directory/language_constant.dart';

class SpecialRequestController extends GetxController {
  String countryCode = '1';

  RxBool isSubmitButtonPressed = false.obs;
  SpecialRequestRepository specialRequestRepository =
      SpecialRequestRepository(baseUrl: AppConstants.apiEndPointLogin);
  MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));

  SpecialRequestController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    brandNameController.text =
        Get.arguments[0] is String ? Get.arguments[0].toString() : '';
    if (localStore.userDetail.email != null) {
      emailController.text = localStore.userDetail.email ?? '';
      nameController.text = localStore.userDetail.firstname ?? '';
      lastNameController.text = localStore.userDetail.lastname ?? '';
    }
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

  Future<void> contactUsPost(BuildContext context) async {
    isValidation = true;
    update(["Create"]);
    try {
      isSubmitButtonPressed.value = true;

      if (validation()) {
        isLoading.value = true;

        Map<String, dynamic> response1 =
            await myTicketAPIRepository.postCreateMyTickets(TicketForm(
          CreateTicketRequest(
                  name: nameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  phone: "+$countryCode${phoneNumberController.text}",
                  brand: brandNameController.text,
                  style: styleController.text,
                  keyword: keywordController.text,
                  imageUrl: imageUrlController.text,
                  remarks: remarkController.text,
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
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  String getHeaderString() {
    return Get.arguments[1] == "brand"
        ? 'Brand Product Query'
        : "Category Product Query";
  }
}

import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/models/contact_us_request/contact_us_request.dart';
import 'package:meta_package/api/models/contact_us_response_model.dart';
import 'package:suvandnat/app/controller/country/country_controller.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class ContactUsController extends GetxController {
  String countryCode = '1';

  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxInt index = 0.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  final AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ContactUsController();

  RxString chosenValue = LanguageConstants.typeOfEnquiryTextsuv.tr.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController onyourmindController = TextEditingController();

  RxString chosenCountry = ''.obs;
  bool isValidation = false;

  List<String> data = [
    LanguageConstants.typeOfEnquiryTextsuv.tr,
    LanguageConstants.deliveryText.tr,
    LanguageConstants.ordersText.tr,
    LanguageConstants.paymentText.tr,
    LanguageConstants.productText.tr,
    LanguageConstants.promotionText.tr,
    LanguageConstants.returnsContactText.tr,
    LanguageConstants.shipping.tr,
    LanguageConstants.technicalText.tr,
  ];

  RxList<ContactUsResponseModel> getRersponse =
      RxList<ContactUsResponseModel>();

  final CountryController countryController = Get.find();

  @override
  Future<void> onInit() async {
    chosenCountry.value = countryController.storeWebsitesList
            .firstWhere((element) =>
                element.websiteId.toString() == localStore.websiteId)
            .name ??
        '';
  }

  Future<void> contactUsPost(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        isLoading.value = true;
        List<ContactUsResponseModel> response = (await aboutAPIRepository
            .getContactUsApiData(ContactUsForm(ContactUsRequest(
                    name: nameController.value.text,
                    lastName: surnameController.value.text,
                    email: emailController.value.text,
                    subject: subjectController.value.text,
                    orderNo: '10000',
                    phone: "+$countryCode${phoneController.value.text}",
                    typeOfInquiry: chosenValue.value,
                    country: chosenCountry.value,
                    sourceOfTicket: 'mobile',
                    message: onyourmindController.value.text)
                .toJson())));

        if (response.isNotEmpty == true) {
          getRersponse.value = response;
          if (getRersponse.first.status.toString() == "success") {
            AwesomeDialog(
              btnOkColor: const Color(0xFF973133),
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.BOTTOMSLIDE,
              title: LanguageConstants.success.tr,
              desc: '${getRersponse.first.message}',
              btnOkOnPress: () {
                Navigator.pop(context);
              },
            ).show();
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              title: LanguageConstants.error.tr,
              desc: '${getRersponse.first.message}',
              btnOkOnPress: () {
                Navigator.pop(context);
              },
            ).show();
          }
          debugPrint("contactUsResponseModel 111-> " +
              getRersponse.first.message.toString());
        }
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(e: e);
      } catch (e) {
        log(e.toString(), name: "Error");
        isLoading.value = true;
        ExceptionHandler.appCatchError(error: e);
      } finally {
        isLoading.value = true;
      }
    }
  }
}

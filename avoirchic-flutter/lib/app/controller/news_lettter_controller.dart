import 'dart:developer';

import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/newsletter_api_respository.dart';
import 'package:meta_package/api/models/newsletter/newsletter_request.dart';

import '../core/consts/app_constants.dart';
import '../main/main.common.dart';
import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class NewsLetterController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final List<String> imgList = [
    LanguageConstants.changeTHEWORLDWithYourPurchaseText.tr,
  ];
  final NewsletterApiRepository newsletterAPIRepository =
      NewsletterApiRepository(baseUrl: AppConstants.apiEndPointLogin);

  RxBool isEmailSelected = true.obs;
  RxBool isLoading = false.obs;

  Future<void> subscribeNewsLetter() async {
    isLoading.value = true;
    try {
      var userEmail = isEmailSelected.value ? localStore.userDetail.email : '';
      if (localStore.customerToken == "") {
        await newsletterAPIRepository.subscribeNewsLetter(email: userEmail);
      } else {
        await newsletterAPIRepository.subscribeNewsletterProviderUser(
            NewsletterRequestModel(
                customer: Customer1(
                    email: localStore.userDetail.email,
                    firstname: localStore.userDetail.firstname,
                    id: localStore.userDetail.id,
                    lastname: localStore.userDetail.lastname,
                    store_id: localStore.userDetail.storeId,
                    redExtensionAttributes:
                        RequestExtAttribute(is_subscribed: true).toJson(),
                    // extensionAttributes: RequestExtAttribute(is_subscribed: true),
                    website_id: localStore.userDetail.websiteId)));
      }
      localStore.userDetail.extensionAttributes!.isSubscribed = true;
      Get.back();
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
}

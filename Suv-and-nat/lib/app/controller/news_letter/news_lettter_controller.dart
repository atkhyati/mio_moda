import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/newsletter_api_respository.dart';
import 'package:meta_package/api/models/newsletter/newsletter_request.dart';
import 'package:suvandnat/app/main/main.common.dart';

import '../../core/const/app_constants.dart';
import '../../presentation/common_widget/common_message/validator.dart';

class NewsLetterController extends GetxController {
  RxDouble height = 25.0.obs;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  final NewsletterApiRepository newsletterAPIRepository =
      NewsletterApiRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxBool isLoading = false.obs;
  RxBool isEmailSelected = true.obs;

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

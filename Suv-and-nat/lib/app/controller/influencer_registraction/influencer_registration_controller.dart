import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/influencer_api_repository.dart';
import 'package:meta_package/api/models/influence_registration/influencer_registration_model.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/error_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
/*import 'package:http/http.dart' as http;*/

class InfluencerRegistrationController extends GetxController {
  String countryCode = '1';

  final formKey = GlobalKey<FormState>().obs;
  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> contactNo = TextEditingController().obs;
  Rx<TextEditingController> websiteUrl = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> country = TextEditingController().obs;
  Rx<TextEditingController> postCode = TextEditingController().obs;
  Rx<TextEditingController> faceBook = TextEditingController().obs;
  Rx<TextEditingController> instagram = TextEditingController().obs;
  Rx<TextEditingController> twitter = TextEditingController().obs;
  Rx<TextEditingController> youtube = TextEditingController().obs;
  Rx<TextEditingController> linkedin = TextEditingController().obs;
  Rx<TextEditingController> pinterest = TextEditingController().obs;
  Rx<TextEditingController> faceBookFollower = TextEditingController().obs;
  Rx<TextEditingController> instagramFollower = TextEditingController().obs;
  Rx<TextEditingController> twitterFollower = TextEditingController().obs;
  Rx<TextEditingController> youtubeFollower = TextEditingController().obs;
  Rx<TextEditingController> linkedinFollower = TextEditingController().obs;
  Rx<TextEditingController> pinterestFollower = TextEditingController().obs;
  Rx<TextEditingController> projectWork = TextEditingController().obs;
  bool isValid = false;

  RxString selectedStatus = "Mr".obs;

  RxList<String> status = ['Mr', 'Mrs'].obs;
  late final InfluencerApiRepository influencerApiRepository =
      InfluencerApiRepository();

  InfluencerRegistrationController();

  bool validation() {
    if (!GetUtils.isEmail(email.value.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    super.onInit();

    debugPrint("PRIYA DETAILS");
  }

  Future<void> influencerReg(context, formKey) async {
    isValid = true;
    update(["influencer"]);
    try {
      if (validation()) {
        if (firstName.value.text != "" &&
            lastName.value.text != "" &&
            email.value.text != "" &&
            contactNo.value.text != "") {
          InfluencerRegistrationMethodModel influencerRegistrationMethodModel =
              InfluencerRegistrationMethodModel(
            firstName: firstName.value.text.toString(),
            country: country.value.text.toString(),
            emailaddress: email.value.text.toString(),
            facebook: faceBook.value.text.toString(),
            postcode: postCode.value.text.toString(),
            city: city.value.text.toString(),
            facebookFollowers: faceBookFollower.value.text.toString(),
            instagram: instagram.value.text.toString(),
            instagramFollowers: instagramFollower.value.text.toString(),
            lastName: lastName.value.text.toString(),
            linkedin: linkedin.value.text.toString(),
            linkedinFollowers: linkedinFollower.value.text.toString(),
            phone: "+$countryCode${contactNo.value.text.toString()}",
            pinterest: pinterest.value.text.toString(),
            pinterestFollowers: pinterestFollower.value.text.toString(),
            twitter: twitter.value.text.toString(),
            twitterFollowers: twitterFollower.value.text.toString(),
            workedOn: projectWork.value.text.toString(),
            youtube: youtube.value.text.toString(),
            youtubeFollowers: youtubeFollower.value.text.toString(),
            website: "www.suvandnat.com",
            url: websiteUrl.value.text.toString(),
            langCode: "storeCode",
            type: "influencer",
            websiteName: "websitename",
          );
          (await influencerApiRepository.getInfluencerAPIResponse(
              json.encode(influencerRegistrationMethodModel)));
          /* http.Response response = data.obj;*/
          /* if (response.statusCode == 200) {*/
          Get.offAndToNamed(
              RoutesConstants.influencerRegistrationThankyouScreen);
          /*     }*/
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("ERROR:::::::::::::::::::::${e.toString()}");
      ExceptionHandler.appCatchError(error: e);
    }
  }
}

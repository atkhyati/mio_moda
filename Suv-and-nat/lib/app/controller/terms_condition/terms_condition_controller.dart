import 'dart:developer';

import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

import '../../data/api/api_endpoint/about_api.dart';

class TeamsConditionController extends GetxController {
  var collepnseIcon = [false].obs;
  CmsPageModel? teamsConditionList;

  static TeamsConditionController get to => Get.find();
  var isLoading = true.obs;

  AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  String? countryCode;

  TeamsConditionController({this.countryCode});

  @override
  void onInit() {
    getTemsCondition();
    super.onInit();
  }

  var nodata = false.obs;
  var messageData = "".obs;

//CountrList
  Future<void> getTemsCondition() async {
    isLoading.value = true;
    try {
      teamsConditionList = await aboutAPIRepository.getPrivacyPolicyResponse(
          endpoint: AboutApi.termAndConditionApi);
      if (teamsConditionList?.cmsText != null) {
        nodata.value = false;
        collepnseIcon =
            ((teamsConditionList?.cmsText?.map<bool>((v) => false).toList()) ??
                    [false])
                .obs;
        isLoading.value = false;
      } else {
        nodata.value = true;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}

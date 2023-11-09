import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/data/api/api_endpoint/about_api.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';

class TeamsConditionController extends GetxController {
  RxInt index = 0.obs;

  var collepnseIcon = [false].obs;

  static TeamsConditionController get to => Get.find();
  CmsPageModel? teamsConditionList;
  var isLoading = true.obs;

  String? countryCode;
  AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

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
    try {
      isLoading.value = true;
      teamsConditionList = await aboutAPIRepository.getPrivacyPolicyResponse(
          endpoint: AboutApi.termAndConditionApi);
      collepnseIcon =
          (teamsConditionList?.cmsText?.map<bool>((v) => false).toList() ??
                  [false])
              .obs;
      if (teamsConditionList?.cmsText?.isEmpty == true) {
        nodata.value = false;
      }
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}

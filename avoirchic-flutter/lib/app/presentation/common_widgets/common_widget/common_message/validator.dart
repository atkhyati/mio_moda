import 'package:avoirchic/app/presentation/common_widgets/error_widget/error_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/services/local_store_service.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:meta_package/utils/validator.dart';

class ExceptionHandler {
  static void apiExceptionError(
      {required ApiException e,
      ValueChanged<String>? callBack,
      Function? unAuth,
      bool? showAlert}) {
    Validators.apiExceptionError(
        e: e,
        showAlert: showAlert,
        callBack: callBack,
        errorAlert: (String value) {
          return ErrorDataWidget(
            error: value,
          );
        },
        unAuth: () async {
          LocalStore localStore = LocalStore();
          localStore.customerToken = "";
          await LocalStore.removePrefValue(
            kStorageConstAuthToken,
          );
          await LocalStore.removePrefValue(
            localStore.customerToken,
          );
          await LocalStore.removePrefValue(
            kStorageConstAuthToken,
          );
          LocalStore().checkGuest();
        });
  }

  static void appCatchError({required dynamic error}) {
    Validators.appCatchError(
        error: error,
        errorAlert: (String value) {
          return ErrorDataWidget(
            error: value,
          );
        });
  }
}

String firstCapitalize(String name) {
  if (name != "") {
    return name.split(" ").map((str) => str.capitalize).join(" ");
  } else {
    return "";
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_endpoint/my_account_api.dart';
import 'package:meta_package/api/models/my_account/change_password_request_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/my_account/update_user_request_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';
import 'package:meta_package/constants/key_value_constants.dart';

class UserService {
  late MyAccountApi myAccountApi;

  UserService(this.myAccountApi);

  Future<MyAccountDetails> getAccountDetailsResponseProvider() async {
    try {
      MyAccountDetails userData =
          await myAccountApi.getAccountDetailsResponseProvider();
      await LocalStore.setPrefStringValue(
          kStorageConstUserDetail, jsonEncode(userData.toJson()));
      await LocalStore.localStore.getUserDetail();
      LocalStore.localStore.checkGuest();
      return userData;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  Future<MyAccountDetails> updateUser(
      {required UpdateUserRequest requestJson}) async {
    try {
      MyAccountDetails userData =
          await myAccountApi.updateUser(requestJson: requestJson);
      await LocalStore.setPrefStringValue(
          kStorageConstUserDetail, jsonEncode(userData.toJson()));
      await LocalStore.localStore.getUserDetail();
      LocalStore.localStore.checkGuest();
      return userData;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  Future<bool> changePasswordResponseProvider(
      String currentPassword, String newPassword) async {
    try {
      return await myAccountApi.changePasswordResponseProvider(
          body: ChangePasswordRequest(
              currentPassword: currentPassword, newPassword: newPassword));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

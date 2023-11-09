import 'package:meta_package/api/api_endpoint/my_account_api.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/my_account/update_user_request_model.dart';
import 'package:meta_package/api/services/user_service.dart';

class MyAccountAPIRepository {
  String baseUrl;
  late UserService userService;
  late MyAccountApi myAccountApi;

  MyAccountAPIRepository({required this.baseUrl}) {
    myAccountApi = MyAccountApi(baseUrl: baseUrl);
    userService = UserService(myAccountApi);
  }

  Future<MyAccountDetails> getAccountDetailsResponse() async {
    return await userService.getAccountDetailsResponseProvider();
  }

  Future<bool> changePasswordResponse(
      String currentPassword, String newPassword) async {
    return await userService.changePasswordResponseProvider(
        currentPassword, newPassword);
  }

  Future<MyAccountDetails> updateUser(UpdateUserRequest request) async {
    return await userService.updateUser(requestJson: request);
  }
}

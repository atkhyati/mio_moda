import 'package:meta_package/api/api_endpoint/auth_api.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/signup_request_model.dart';
import 'package:meta_package/api/services/auth_service.dart';

class AuthAPIRepository {
  String baseUrl;

  late AuthService authService;
  late AuthApi authApi;

  AuthAPIRepository({required this.baseUrl}) {
    authApi = AuthApi(baseUrl: baseUrl);
    authService = AuthService(authApi);
  }

  Future<MyAccountDetails?> loginWithEmail(
      String userName, String password) async {
    return await authService.loginUserWithEmail(
        email: userName, password: password);
  }

  Future<MyAccountDetails?> loginWithGoogleSignIn() async {
    return await authService.loginWithGoogleSignIn();
  }

  Future<MyAccountDetails> loginWithAppleSignIn() async {
    return await authService.loginWithAppleSignIn();
  }

  Future<MyAccountDetails> loginWithFacebook() async {
    return await authService.loginWithFacebook();
  }

  Future<MyAccountDetails?> loginWithTwitter() async {
    return await authService.loginWithTwitter();
  }

  Future<MyAccountDetails?> signUpWithEmail(SignUpRequestModel request) async {
    return await authService.signUpWithEmail(request);
  }

  Future<bool> putForgetPasswordApiResponse(
      {required String forgetPasswordRequestJson}) async {
    return await authApi.putForgetPasswordProvider(
        requestJson: forgetPasswordRequestJson);
  }
}

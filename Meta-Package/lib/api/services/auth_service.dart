import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_endpoint/auth_api.dart';
import 'package:meta_package/api/api_endpoint/my_account_api.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/signup_request_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';
import 'package:meta_package/api/services/user_service.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:meta_package/utils/global_singlton.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

class AuthService extends GetConnect {
  late AuthApi authApi;
  late UserService userService;

  AuthService(this.authApi) {
    userService = UserService(MyAccountApi(baseUrl: authApi.baseUrl));
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookLogin facebookLogin = FacebookLogin();
  final TwitterLogin twitterLogin = TwitterLogin(
    apiKey: '4JHL318N3idTY2nRfDMFI4ikU',
    apiSecretKey: '6zdEzGkGjtnzgixF9FvWaIBEZt5y8eO0ew1TyK9Mx0yKXWOTWg',
    redirectURI: 'example://',
  );
  final _auth = FirebaseAuth.instance;

  Future<MyAccountDetails> loginUserWithEmail(
      {required String email, required String password}) async {
    try {
      final authUserData = {
        "username": email,
        "password": password,
      };
      SocialLoginResponse data = await authApi.postLoginResponseProvider(
          requestJson: jsonEncode(authUserData),
          method:
              '?username=${Uri.encodeComponent(email)}&password=${Uri.encodeComponent(password)}');

      await LocalStore.setPrefStringValue(
          kStorageConstAuthToken, data.response.replaceAll('"', ""));
      await LocalStore.localStore.getToken();
      return userService.getAccountDetailsResponseProvider();
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  Future<MyAccountDetails> loginWithGoogleSignIn() async {
    try {
      await googleLogOut();
      final GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleSignInAccount?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken ?? '',
        idToken: googleAuth?.idToken ?? '',
      );
      UserCredential signInResult =
          await _auth.signInWithCredential(credential);
      final User? googleUser = signInResult.user;
      return await loginForSocialLogin(user: googleUser, type: 'google');
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  Future<void> googleLogOut() async {
    try {
      await googleSignIn.signOut();
    } catch (e) {
      debugPrint("ERROR----->>e");
    }
  }

  Future<MyAccountDetails> loginWithFacebook() async {
    try {
      facebookLogOut();
      final result = await facebookLogin.logIn(
        permissions: [
          FacebookPermission.email,
          FacebookPermission.userGender,
        ],
      );
      log('1234 is:--${result.status}');
      User? fbUser;
      switch (result.status) {
        case FacebookLoginStatus.success:
          final FacebookAccessToken? accessToken = result.accessToken;
          log('12345 is:--${result.accessToken?.token}');
          AuthCredential credential = FacebookAuthProvider.credential(
            accessToken?.token ?? '',
          );
          UserCredential? signInResult =
              await _auth.signInWithCredential(credential);
          fbUser = signInResult.user;

          debugPrint("$fbUser");
          debugPrint(fbUser?.email);
          debugPrint(fbUser?.displayName);
          debugPrint(fbUser?.photoURL);
          break;
        case FacebookLoginStatus.cancel:
          Get.snackbar(
              LanguageConstants.alert.tr, result.error?.developerMessage ?? '');
          break;
        case FacebookLoginStatus.error:
          Get.snackbar(
              LanguageConstants.alert.tr, result.error?.developerMessage ?? '');
          break;
      }
      return await loginForSocialLogin(user: fbUser, type: 'fb');
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  Future<void> facebookLogOut() async {
    try {
      await facebookLogin.logOut();
    } catch (e) {
      debugPrint("ERROR----->>e");
    }
  }

  Future<MyAccountDetails> loginWithAppleSignIn() async {
    final rawNonce = GlobalSingleton().generateNonce();
    final nonce = GlobalSingleton().sha256ofString(rawNonce);
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final result =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      final User? appleUser = result.user;
      debugPrint("$appleUser");
      debugPrint(appleUser?.email);
      debugPrint(appleUser?.displayName);
      debugPrint(appleUser?.photoURL);
      return await loginForSocialLogin(user: appleUser, type: 'apple');
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  Future<MyAccountDetails> loginWithTwitter() async {
    try {
      final AuthResult authResult = await twitterLogin.login();
      log('AuthResult is:-->>${authResult.status}');
      User? twitterUser;
      switch (authResult.status) {
        case TwitterLoginStatus.loggedIn:
          // success
          AuthCredential credential = TwitterAuthProvider.credential(
            accessToken: authResult.authToken ?? '',
            secret: authResult.authTokenSecret ?? '',
          );
          UserCredential? signInResult =
              await _auth.signInWithCredential(credential);
          twitterUser = signInResult.user;
          break;
        case TwitterLoginStatus.cancelledByUser:
          Get.snackbar(
              LanguageConstants.alert.tr, authResult.errorMessage ?? '');
          break;
        case TwitterLoginStatus.error:
          Get.snackbar(
              LanguageConstants.alert.tr, authResult.errorMessage ?? '');
          break;

        default:
          TwitterLoginStatus.error;
      }
      return await loginForSocialLogin(user: twitterUser, type: 'twitter');
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  Future<MyAccountDetails> loginForSocialLogin(
      {User? user, required String type}) async {
    try {
      final socialAuthUserData = {
        "type": type,
        "user_id": user?.uid,
        "firstname": (user?.displayName ?? '').split(' ').first,
        "lastname": (user?.displayName ?? '').split(' ').last,
        "email": user?.email,
        "gender": 0,
        "taxvat": 0
      };

      SocialLoginResponse data = await authApi.postSocialLoginResponseProvider(
          requestJson: jsonEncode(socialAuthUserData));

      await LocalStore.setPrefStringValue(
          kStorageConstAuthToken, data.response.replaceAll('"', ""));
      await LocalStore.localStore.getToken();
      return userService.getAccountDetailsResponseProvider();
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  Future<MyAccountDetails> signUpWithEmail(SignUpRequestModel request) async {
    try {
      await authApi.getSignupResponseProvider(requestJson: request);
      return loginUserWithEmail(
          email: request.customer?.email ?? '',
          password: request.password ?? '');
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

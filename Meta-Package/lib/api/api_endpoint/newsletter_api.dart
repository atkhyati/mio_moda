import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:meta_package/api/models/newsletter/newsletter_response.dart';
import 'package:meta_package/api/services/user_service.dart';

import '../api_client/api_exception.dart';
import '../api_client/dio_client.dart';

import '../services/local_store_service.dart';

class NewsletterApi<T> extends NewsletterApiInterface {
  static const String newsletterUnsubscribe = "/rest/V1/newsletter/unsubscribe";
  static const String newsletterSubscribe = "/rest/V1/newsletter/subscribe";
  static const String newsletterSubscribeForRegisterUser =
      "/rest/V1/customers/me";
  String baseUrl;
  late DioClient client;
  late UserService userService;

  NewsletterApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<NewsletterResponse> subscribeNewsletterProvider(
      {String? email}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "POST", "$baseUrl$newsletterSubscribe",
          token: true,
          body: jsonEncode(
              {"email": email ?? '${LocalStore.localStore.userDetail.email}'}));

      return NewsletterResponse.fromJson(response.data ?? {});
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  Future<void> subscribeNewsletterProviderUser({required dynamic body}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("PUT",
          "$baseUrl/${LocalStore.localStore.currentCode}$newsletterSubscribeForRegisterUser",
          token: true, body: body);
      debugPrint("${response}");
      // return response;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class NewsletterApiInterface<T> {
  Future<T?> subscribeNewsletterProvider();
  Future<T?> subscribeNewsletterProviderUser({required dynamic body});
}

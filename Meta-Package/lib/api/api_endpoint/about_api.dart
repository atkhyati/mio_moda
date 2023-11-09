// import 'package:dio/src/response.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';
import 'package:meta_package/api/models/contact_us_response_model.dart';
import 'package:meta_package/api/models/terms_and_conditions/terms_and_condition_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

import '../models/faq/faq_model.dart';

class AboutApi<T> extends AboutApiInterface {
  static const String faq = "/rest/V1/cmspagemanagerList/16";
  static const String privacyPolicyApi = '/rest/V1/cmspagemanagerList/18';
  static const String termAndConditionApi = '/rest/V1/cmsPage/19';
  static const String referFriendEndPoint = "/rest/V1/referFriend";
  static const String contactUs = "/rest/V1/contactus";

  String baseUrl;
  late DioClient client;

  AboutApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<FaqModel> getFaqResponseProvider({String? endpoint}) async {
    try {
      final response = await client.getClient<List<dynamic>>(
          "GET", baseUrl + (endpoint ?? faq),
          token: false);

      return response.many((json) => FaqModel.fromJson(json)).first;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<CmsPageModel> getPrivacyPolicyAPIResponseProvider(
      {String? endpoint}) async {
    try {
      String localStoreId = "/${LocalStore.localStore.currentCode}";
      final response = await client.getClient<List<dynamic>>(
          "GET", baseUrl + localStoreId + (endpoint ?? privacyPolicyApi),
          token: false);

      return response.many((json) => CmsPageModel.fromJson(json)).first;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<TermsAndConditionsModel> getTermsConditionAPIProvider(
      {String? endpoint}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET", baseUrl + (endpoint ?? termAndConditionApi));
      return response.one((json) => TermsAndConditionsModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<String> getReferFriendAPIProvider(
      {required dynamic body, required Map<String, dynamic> data}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("POST",
          "$baseUrl/${LocalStore.localStore.currentCode}$referFriendEndPoint?referForm[referrer_first_name]=${data['refFirstName']}&referForm[referrer_email]=${data['refEmail']}&referForm[referrer_phone]=${data['refPhone']}&referForm[your_first_name]=${data['yourFirstName']}&referForm[your_email]=${data['yourEmail']}&referForm[your_phone]=${data['yourPhone']}",
          body: body);

      return response.data != null ? response.data!["message"].toString() : '';
    } on FormatException catch (e) {
      throw ApiException(message: e.message, error: e);
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    }
  }

  @override
  Future<List<ContactUsResponseModel>> getContactUsResponseProvider(
      {required Map<String, String> data}) async {
    try {
      final response = await client
          .getMultipartClient("POST", baseUrl + contactUs, data: data);
      var json1 = jsonDecode(response.body) as Map<String, dynamic>;
      return response.many((json) => ContactUsResponseModel.fromJson(json1));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<ContactUsResponseModel>> postContactUsProvider(
      {required Map<String, dynamic> data}) async {
    try {
      final response =
          await client.getClient("POST", baseUrl + contactUs, body: data);
      return response.many((json) => ContactUsResponseModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class AboutApiInterface<T> {
  Future<T?> getFaqResponseProvider({String? endpoint});

  Future<T?> getPrivacyPolicyAPIResponseProvider({String? endpoint});

  Future<T?> getTermsConditionAPIProvider({String? endpoint});

  Future<T?> getReferFriendAPIProvider(
      {required dynamic body, required Map<String, dynamic> data});

  Future<T?> getContactUsResponseProvider({required Map<String, String> data});

  Future<T?> postContactUsProvider({required Map<String, dynamic> data});
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/return_reason/return_reason_model.dart';
import 'package:meta_package/api/models/returns_refunds/returns_refunds_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class ReturnApi<T> extends ReturnApiInterface {
  static const String returnReasonApi = '/V1/orderReturnList/';
  static const String postReturnReasonApi = '/rest/V1/orderReturn';
  static const String returnsAndRefund = "/rest/V1/cmspagemanagerList/15";

  String baseUrl;
  late DioClient client;

  ReturnApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<List<ReturnReasonModel>> getReturnReasonResponseProvider() async {
    try {
      final response = await client.getClient<List<dynamic>>(
          "GET", baseUrl + LocalStore.getUrlWithCode() + returnReasonApi);
      return response.many((json) => ReturnReasonModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<Map<String, dynamic>> postReturnItemAPIProvider(
      {required Map<String, String> data}) async {
    try {
      final response = await client.getMultipartClient(
          "POST", baseUrl + postReturnReasonApi,
          data: data);
      var json1 = jsonDecode(response.body) as Map<String, dynamic>;
      return json1;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<CmsText>> getReturnsRefundsApiResponseProvider() async {
    try {
      var localStoreId = "/${LocalStore.localStore.currentCode}";
      final response = await client.getClient<List<dynamic>>(
        "GET",
        baseUrl + localStoreId + returnsAndRefund,
      );
      return response
              .many((json) => ReturnsAndRefundsModel.fromJson(json))
              .first
              .cmsText ??
          <CmsText>[];
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class ReturnApiInterface<T> {
  Future<T?> getReturnReasonResponseProvider();

  Future<T?> postReturnItemAPIProvider({required Map<String, String> data});

  Future<T?> getReturnsRefundsApiResponseProvider();
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';

class SpecialSizeApi<T> extends SpecialSizeApiInterface {
  static const String notifyMeBase = "/rest/V1/notifyMe";

  String baseUrl;
  late DioClient client;

  SpecialSizeApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<Map<String, dynamic>> postSpecialSizeResponseProvider(
      {required Map<String, String> data}) async {
    try {
      final response = await client
          .getMultipartClient("POST", baseUrl + notifyMeBase, data: data);
      var json1 = jsonDecode(response.body) as Map<String, dynamic>;
      return json1;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class SpecialSizeApiInterface<T> {
  Future<T?> postSpecialSizeResponseProvider(
      {required Map<String, String> data});
}

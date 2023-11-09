import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';

import '../services/local_store_service.dart';

class SpecialRequestApi<T> extends SpecialRequestApiInterface {
  static const String specialRequest = "/rest/V1/mytickets/create/";

  String baseUrl;
  late DioClient client;

  SpecialRequestApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<Map<String, dynamic>> specialRequestAPIResponse(
      {required dynamic body}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("POST",
          '$baseUrl/${LocalStore.localStore.currentCode}$specialRequest',
          additionalHeaders: {"Accept": "application/json"}, body: body);
      debugPrint("Response!!${response.data}");
      return response.data ?? {};
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class SpecialRequestApiInterface<T> {
  Future<T?> specialRequestAPIResponse({required dynamic body});
}

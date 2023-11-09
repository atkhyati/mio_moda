import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';

class InfluencerApi<T> extends InfluencerApiInterface {
  static const String apiEndPointNewInfluencer =
      "https://erp.theluxuryunlimited.com/api/influencer/add";

  @override
  Future<Map<String, dynamic>> postInfluencerRegProvider(
      {required String requestJson}) async {
    String website = json.decode(requestJson)['website'].toString();
    try {
      DioClient client = DioClient.client;
      client.setBaseUrl(website);
      final response = await client.getClient<Map<String, dynamic>>(
          "POST", apiEndPointNewInfluencer,
          body: requestJson);
      //todo
      return response.data ?? {};
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class InfluencerApiInterface<T> {
  Future<T?> postInfluencerRegProvider({required String requestJson});
}

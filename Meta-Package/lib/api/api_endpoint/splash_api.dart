import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';

class SplashApi<T> extends SplashApiInterface {
  static String jsonEndPoint = "/json";

  String baseUrl;
  late DioClient client;

  SplashApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<String> getSplashAPIResponseProvider() async {
    try {
      final response =
          await client.getClientWithoutHeader<Map<String, dynamic>>(
              "GET", baseUrl + jsonEndPoint);
      return response.data != null
          ? response.data!['countryCode'].toString()
          : '';
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class SplashApiInterface<T> {
  Future<T?> getSplashAPIResponseProvider();
}

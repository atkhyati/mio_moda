import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/home/currency_model.dart';
import 'package:meta_package/api/models/home/logo_model.dart';

class DashboardApi<T> extends DashboardApiInterface {
  static String logoEndPoint = "/rest/V1/logoList";
  static String currencyEndPoint = "/rest/V1/directory/currency";

  String baseUrl;
  late DioClient client;

  DashboardApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<LogoModel> getHomeAndLogoAPIResponseProvider2() async {
    try {
      final response =
          await client.getClient<List<dynamic>>("GET", baseUrl + logoEndPoint);
      //todo
      LogoModel logoModel = (response.data?.isNotEmpty == true)
          ? LogoModel.fromJson((response.data?.first) as Map<String, dynamic>)
          : LogoModel(); // handled on type cast. can be changed based on need
      return logoModel;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<CurrencyModel> getCurrencyAPIResponseProvider() async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET", baseUrl + currencyEndPoint,
          token: true);
      return response.one((json) => CurrencyModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class DashboardApiInterface<T> {
  Future<T?> getHomeAndLogoAPIResponseProvider2();

  Future<T?> getCurrencyAPIResponseProvider();
}

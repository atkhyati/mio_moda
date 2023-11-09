import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/country/store_config_model.dart';
import 'package:meta_package/api/models/country/store_websites_model.dart';
import 'package:meta_package/api/models/store_credit/store_credit_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

import '../api_client/dio_client.dart';

class StoreApi<T> extends StoreApiInterface {
  static String storeWebsitesEndPoint = "/rest/V1/store/websites";
  static String storeViewsEndPoint = "/rest/V1/store/storeViews";
  static String storeConfigsEndPoint = "/rest/V1/store/storeConfigs";
  static String storeCreditApi = '/rest/V1/store/credits/balance/';
  static String storeWebsitesApi = '/rest/V1/websitesStores';

  String baseUrl;
  late DioClient client;

  StoreApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<List<StoreWebSitesModel>> getStoreWebsites() async {
    try {
      final response = await client.getClient<List<dynamic>>(
          "GET", baseUrl + storeWebsitesApi);
      return response.many((json) => StoreWebSitesModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<StoreConfigModel>> getStoreConfigsAPIResponse() async {
    try {
      final response = await client.getClient<List<dynamic>>(
          "GET", baseUrl + storeConfigsEndPoint);
      return response.many((json) => StoreConfigModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<StoreCreditModel>> getStoreCreditAPIResponseProvider() async {
    try {
      final response = await client.getClient<List<dynamic>>("GET",
          "$baseUrl/${LocalStore.localStore.currentCode}$storeCreditApi");
      List<StoreCreditModel> storeCredits =
          response.many((json) => StoreCreditModel.fromJson(json));
      // if (storeCredits.isNotEmpty && storeCredits.length == 1) {
      //   if (storeCredits[0].status != null && storeCredits[0].status=="No Data") {
      //     return [];
      //   }
      // }
      return storeCredits;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class StoreApiInterface<T> {
  Future<T?> getStoreWebsites();

  Future<T?> getStoreConfigsAPIResponse();

  Future<T?> getStoreCreditAPIResponseProvider();
}

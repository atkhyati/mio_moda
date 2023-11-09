import '../api_endpoint/store_api.dart';
import '../models/country/store_config_model.dart';
import '../models/country/store_websites_model.dart';
import 'package:meta_package/api/models/store_credit/store_credit_model.dart';

class StoreAPIRepository {
  String baseUrl;

  StoreAPIRepository({required this.baseUrl});

  late StoreApi baseApi = StoreApi(baseUrl: baseUrl);

  Future<List<StoreWebSitesModel>> getStoreWebsitesAPIResponse() async {
    return await baseApi.getStoreWebsites();
  }

  Future<List<StoreConfigModel>> getStoreConfigsAPIResponse() async {
    return await baseApi.getStoreConfigsAPIResponse();
  }

  Future<List<StoreCreditModel>> getStoreCreditResponse() async {
    return await baseApi.getStoreCreditAPIResponseProvider();
  }
}

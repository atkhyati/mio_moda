import 'package:meta_package/api/api_endpoint/dashboard_api.dart';
import 'package:meta_package/api/models/home/currency_model.dart';
import 'package:meta_package/api/models/home/logo_model.dart';

class DashboardAPIRepository {
  String baseUrl;

  DashboardAPIRepository({required this.baseUrl});

  late DashboardApi baseApi = DashboardApi(baseUrl: baseUrl);

  Future<LogoModel> getLogoAPIResponse() async {
    return await baseApi.getHomeAndLogoAPIResponseProvider2();
  }

  Future<CurrencyModel> getCurrencyAPIResponse() async {
    return await baseApi.getCurrencyAPIResponseProvider();
  }
}

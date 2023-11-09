import 'package:meta_package/api/api_endpoint/splash_api.dart';

class SplashAPIRepository {
  String baseUrl;

  SplashAPIRepository({required this.baseUrl});

  late SplashApi baseApi = SplashApi(baseUrl: baseUrl);

  Future<String> getSplashAPIResponse() async {
    return await baseApi.getSplashAPIResponseProvider();
  }
}

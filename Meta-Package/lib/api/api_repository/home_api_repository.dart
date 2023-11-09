import 'package:meta_package/api/api_endpoint/home_api.dart';
import 'package:meta_package/api/models/home/home_model.dart';
import 'package:meta_package/api/models/home/home_page_manager_response_model.dart';

class HomeAPIRepository {
  String baseUrl;

  HomeAPIRepository({required this.baseUrl});

  late HomeApi baseApi = HomeApi(baseUrl: baseUrl);

  Future<List<dynamic>> getHomeAPIResponse() async {
    return await baseApi.getHomeAndLogoAPIResponseProvider();
  }

  Future<Map<String, dynamic>> getBannerListAPIResponse({
    required dynamic formData,
  }) async {
    return await baseApi.getBannerListAPIResponseProvider(body: formData);
  }

  Future<List<HomePageManagerResponseModel>>
      getHomePageManagerResponse() async {
    return await baseApi.getHomePageManagerResponse();
  }

  Future<HomeModel> getAvoirHomePageMenuResponse() async {
    return await baseApi.getAvoirHomePageMenuResponse();
  }

  Future<List<HomePageManagerResponseModel>> getHomeMenuAPIResponse() async {
    return await baseApi.getHomePageMenuResponse();
  }
}

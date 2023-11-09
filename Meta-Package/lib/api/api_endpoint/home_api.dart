import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/home/home_model.dart';
import 'package:meta_package/api/models/home/home_page_manager_response_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class HomeApi<T> extends HomeApiInterface {
  static String bannerListEndPoint = "/V1/bannerList";
  static String homeEndPoint = "/V1/homepagemanagerList";
  static String homePageEndPoint = "/rest/V1/homePage";
  static String menuEndPoint = "/V1/categories";

  String baseUrl;
  late DioClient client;

  HomeApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<Map<String, dynamic>> getBannerListAPIResponseProvider(
      {required dynamic body}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "POST", "$baseUrl${LocalStore.getUrlWithCode()}$bannerListEndPoint",
          body: body);
      //todo
      return response.data ?? {};
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<dynamic>> getHomeAndLogoAPIResponseProvider() async {
    try {
      final response = await client.getClient<List<dynamic>>(
          "GET", "$baseUrl${LocalStore.getUrlWithCode()}$homeEndPoint");
      //todo
      return response.data ?? [];
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<HomePageManagerResponseModel>> getHomePageMenuResponse() async {
    try {
      final response = await client.getClient<List<dynamic>>(
          "GET", baseUrl + homePageEndPoint);
      return response
          .many((json) => HomePageManagerResponseModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<HomeModel> getAvoirHomePageMenuResponse() async {
    try {
      final response = await client.getClient<List<dynamic>>(
          "GET", baseUrl + homePageEndPoint);
      return response.many((json) => HomeModel.fromJson(json)).first;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<HomePageManagerResponseModel>>
      getHomePageManagerResponse() async {
    try {
      final response = await client.getClient(
          "GET", "$baseUrl${LocalStore.getUrlWithCode()}$menuEndPoint");
      return response
          .many((json) => HomePageManagerResponseModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class HomeApiInterface<T> {
  Future<T?> getBannerListAPIResponseProvider({required dynamic body});

  Future<T?> getHomeAndLogoAPIResponseProvider();

  Future<T?> getHomePageMenuResponse();

  Future<T?> getAvoirHomePageMenuResponse();

  Future<T?> getHomePageManagerResponse();
}

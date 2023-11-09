import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/search/search_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class SearchApi<T> extends SearchApiInterface {
  static const String searchProductAPI =
      "/V1/products?searchCriteria[filter_groups][0][filters][0][field]=entity_id&searchCriteria[filter_groups][0][filters][0][value]=";
  static const String searchAPI =
      "/V1/search?searchCriteria[requestName]=quick_search_container&searchCriteria[filter_groups][0][filters][0][field]=search_term&searchCriteria[filter_groups][0][filters][0][value]=";

  String baseUrl;
  late DioClient client;

  SearchApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<SearchModel> getSearchAPIResponseProvider({
    required String argument,
    required int currentPage,
    required int pageSize,
  }) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("GET",
          '$baseUrl${LocalStore.getUrlWithCode()}$searchAPI$argument&searchCriteria[currentPage]=$currentPage&searchCriteria[pageSize]=$pageSize');
      return response.one((json) => SearchModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<ProductModel> getSearchProductAPIResponseProvider({
    required dynamic itemId,
  }) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("GET",
          '$baseUrl${LocalStore.getUrlWithCode()}$searchProductAPI$itemId&searchCriteria[filter_groups][0][filters][0][condition_type]=in');
      return response.one((json) => ProductModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class SearchApiInterface<T> {
  Future<T?> getSearchAPIResponseProvider({
    required String argument,
    required int currentPage,
    required int pageSize,
  });

  Future<T?> getSearchProductAPIResponseProvider({
    required dynamic itemId,
  });
}

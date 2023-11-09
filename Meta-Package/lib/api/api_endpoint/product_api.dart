import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class ProductApi<T> extends ProductApiInterface {
  static String homeBrandProductListEndPoint =
      "/rest/all/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=brands&searchCriteria[filter_groups][0][filters][0][value]=";
  static String productListEndPoint =
      "/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=";
  static String optionsEndPoint = "/V1/products/attributes/brands/options";
  static String filterDataApi = '/V1/layeredList/';
  static String sortedProductListEndPoint =
      "&searchCriteria[sortOrders][0][field]=price&searchCriteria[sortOrders][0][direction]=";

  static String filteredColorProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=color_v2&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredCatProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredPriceProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=price&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredPriceProductListEndPointForPriceRangeFrom =
      "&searchCriteria[filter_groups][1][filters][0][field]=price&searchCriteria[filter_groups][1][filters][0][value]=";

  static String filteredPriceProductListEndPointForPriceRangeTo =
      "&searchCriteria[filter_groups][2][filters][0][field]=price&searchCriteria[filter_groups][2][filters][0][value]=";

  static String filteredPriceFromProductListEndPoint =
      "&searchCriteria[filter_groups][1][filters][0][condition_type]=from";

  static String filteredPriceToProductListEndPoint =
      "&searchCriteria[filter_groups][2][filters][0][condition_type]=to";

  static String filteredSizeProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=size_v2&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredBrandProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=brands&searchCriteria[filter_groups][0][filters][0][value]=";

  String baseUrl;
  late DioClient client;

  ProductApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<ProductModel> getProductListApiResponse(
      {required String query,
      required int currentPage,
      required int pageSize,
      required bool isBrand,
      String? currentCurrency}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
        "GET",
        baseUrl +
            (isBrand
                ? (homeBrandProductListEndPoint + query)
                : currentCurrency?.isNotEmpty == true
                    ? '${LocalStore.getUrlWithCode()}$productListEndPoint$query&searchCriteria[currentPage]=$currentPage&searchCriteria[pageSize]=$pageSize&searchCriteria[sortOrders][0][field]=entity_id&searchCriteria[sortOrders][0][direction]=DESC&currency=$currentCurrency'
                    : '${LocalStore.getUrlWithCode()}$productListEndPoint$query&searchCriteria[currentPage]=$currentPage&searchCriteria[pageSize]=$pageSize&searchCriteria[sortOrders][0][field]=entity_id&searchCriteria[sortOrders][0][direction]=DESC'),
      );
      return response.one((json) => ProductModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<ProductModel> getSortedProductListResponseProvider({
    required String query,
    required int currentPage,
    required int pageSize,
  }) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
        "GET",
        '$baseUrl${LocalStore.getUrlWithCode()}$productListEndPoint$query&searchCriteria[currentPage]=$currentPage&searchCriteria[pageSize]=$pageSize',
      );
      return response.one((json) => ProductModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<dynamic>> getOptionsListResponseProvider() async {
    try {
      final response = await client.getClient<List<dynamic>>(
          "GET", "$baseUrl${LocalStore.getUrlWithCode()}$optionsEndPoint");
      return response.data ?? [];
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<FilterModel>> getFilterListResponseProvider({
    required String id,
  }) async {
    try {
      final response = await client.getClient<List<dynamic>>(
          "GET", "$baseUrl${LocalStore.getUrlWithCode()}$filterDataApi$id",
          token: false);
      return response.many((json) => FilterModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class ProductApiInterface<T> {
  Future<T?> getProductListApiResponse(
      {required String query,
      required int currentPage,
      required int pageSize,
      required bool isBrand,
      String? currentCurrency});

  Future<T?> getSortedProductListResponseProvider({
    required String query,
    required int currentPage,
    required int pageSize,
  });

  Future<T?> getOptionsListResponseProvider();

  Future<T?> getFilterListResponseProvider({
    required String id,
  });
}

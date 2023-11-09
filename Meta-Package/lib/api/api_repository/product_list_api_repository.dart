import 'package:meta_package/api/api_endpoint/product_api.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';

class ProductListAPIRepository {
  String baseUrl;

  ProductListAPIRepository({required this.baseUrl});

  late ProductApi baseApi = ProductApi(baseUrl: baseUrl);

  Future<ProductModel> getProductListApiResponse(String val, bool isBrand,
      {int currentPage = 0, int pageSize = 20, String? currentCurrency}) async {
    return await baseApi.getProductListApiResponse(
        query: val,
        currentPage: currentPage,
        pageSize: pageSize,
        isBrand: isBrand,
        currentCurrency: currentCurrency);
  }

  Future<ProductModel> getFilteredProductListApiResponse(
    String value, {
    int currentPage = 0,
    int pageSize = 20,
  }) async {
    return await baseApi.getSortedProductListResponseProvider(
      query: value,
      currentPage: currentPage,
      pageSize: pageSize,
    );
  }

  Future<ProductModel> getSortedProductListApiResponse(
    String value, {
    int currentPage = 0,
    int pageSize = 20,
  }) async {
    return await baseApi.getSortedProductListResponseProvider(
      query: value,
      currentPage: currentPage,
      pageSize: pageSize,
    );
  }

  Future<List<dynamic>> getOptionsListApiResponse() async {
    return await baseApi.getOptionsListResponseProvider();
  }

  Future<List<FilterModel>> getFilterListApiResponse(String id) async {
    return await baseApi.getFilterListResponseProvider(
      id: id,
    );
  }
}

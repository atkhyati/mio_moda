import 'package:meta_package/api/api_endpoint/search_api.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/search/search_model.dart';

class SearchAPIRepository {
  String baseUrl;

  SearchAPIRepository({required this.baseUrl});

  late SearchApi baseApi = SearchApi(baseUrl: baseUrl);

  Future<SearchModel> getSearchAPIResponse(
      {required String argument,
      required int currentPage,
      required int pageSize}) async {
    return await baseApi.getSearchAPIResponseProvider(
        argument: argument, currentPage: currentPage, pageSize: pageSize);
  }

  Future<ProductModel> getSearchProductAPIResponse(String code,
      {itemID}) async {
    return await baseApi.getSearchProductAPIResponseProvider(itemId: itemID);
  }
}

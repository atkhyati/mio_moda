import 'package:meta_package/api/api_endpoint/brand_api.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';

class BrandListAPIRepository {
  String baseUrl;

  BrandListAPIRepository({required this.baseUrl});

  late BrandListApi baseApi = BrandListApi(baseUrl: baseUrl);

  Future<List<BrandModel>> getBrandListResponse() async {
    return await baseApi.brandListAPIProvider();
  }
}

import 'package:meta_package/api/api_endpoint/special_size_api.dart';

class SpecialSizeAPIRepository {
  String baseUrl;

  SpecialSizeAPIRepository({required this.baseUrl});

  late SpecialSizeApi baseApi = SpecialSizeApi(baseUrl: baseUrl);

  Future<Map<String, dynamic>> postSpecialSizeApiResponse(
      String website, String email, String sku) async {
    Map<String, String> data = {};
    data["website"] = website.toString();
    data["email"] = email.toString();
    data["sku"] = sku.toString();
    return await baseApi.postSpecialSizeResponseProvider(data: data);
  }
}

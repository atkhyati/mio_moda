import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';

class BrandListApi<T> extends BrandListApiInterface {
  static const String brandList = "/rest/V1/brandList";

  String baseUrl;

  late DioClient client;

  BrandListApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<List<BrandModel>> brandListAPIProvider() async {
    try {
      final response =
          await client.getClient<List<dynamic>>("GET", baseUrl + brandList);
      return response.many((json) => BrandModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class BrandListApiInterface<T> {
  Future<T?> brandListAPIProvider();
}

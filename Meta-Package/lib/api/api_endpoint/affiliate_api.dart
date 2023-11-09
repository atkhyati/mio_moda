import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class AffiliateApi<T> extends AffiliateApiInterface {
  static const String affiliateGetData = "/rest/V1/cmspagemanagerList/24";

  String baseUrl;
  late DioClient client;

  AffiliateApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<CmsPageModel> getAffiliateResponseProvider() async {
    try {
      final response = await client.getClient<List<dynamic>>("GET",
          "$baseUrl/${LocalStore.localStore.currentCode}$affiliateGetData");

      return response.many((json) => CmsPageModel.fromJson(json)).first;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class AffiliateApiInterface<T> {
  Future<T?> getAffiliateResponseProvider();
}

import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import '../models/shipping/shipping_model.dart';
import '../services/local_store_service.dart';

class ShippingApi<T> extends ShippingApiInterface {
  static const String shipping = "/rest/V1/cmspagemanagerList/20";

  String baseUrl;
  late DioClient client;

  ShippingApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<List<CmsText>> getShippingApiResponseProvider(
      {String? shippingURL}) async {
    try {
      String localStoreId = "/${LocalStore.localStore.currentCode}";
      final response = await client.getClient<List<dynamic>>(
          "GET", baseUrl + localStoreId + (shippingURL ?? shipping));
      return response
              .many((json) => ShippingData.fromJson(json))
              .first
              .cmsText ??
          <CmsText>[];
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class ShippingApiInterface<T> {
  Future<T?> getShippingApiResponseProvider();
}

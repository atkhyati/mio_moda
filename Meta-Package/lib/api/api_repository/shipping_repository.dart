import 'package:meta_package/api/api_endpoint/shipping_api.dart';
import '../models/shipping/shipping_model.dart';

class ShippingAPIRepository {
  String baseUrl;

  ShippingAPIRepository({required this.baseUrl});

  late ShippingApi baseApi = ShippingApi(baseUrl: baseUrl);

  Future<List<CmsText>> getShippingApiResponse({String? shippingURL}) async {
    return await baseApi.getShippingApiResponseProvider(
        shippingURL: shippingURL ?? null);
  }
}

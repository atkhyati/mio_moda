import 'package:meta_package/api/api_endpoint/order_confirm_api.dart';
import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';
import 'package:meta_package/api/models/order_tracking/order_traking_model.dart';

class OrderConfirmationApiRepository {
  String baseUrl;

  OrderConfirmationApiRepository({required this.baseUrl});

  late OrderConfirmApi baseApi = OrderConfirmApi(baseUrl: baseUrl);

  Future<OrderConfirmationModel> getOrderConfirmationApiResponse(
      String orderId) async {
    return await baseApi.getOrderConfirmationProvider(id: orderId);
  }

  Future<List<OrderTrackingModel>> getOrderTrackingResponse(String id) async {
    return await baseApi.getOrderTrackingResponseProvider(id: id);
  }
}

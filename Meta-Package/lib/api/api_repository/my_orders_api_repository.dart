import 'package:meta_package/api/api_endpoint/my_order_api.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';

class MyOrdersAPIRepository {
  String baseUrl;

  MyOrdersAPIRepository({required this.baseUrl});

  late MyOrderApi baseApi = MyOrderApi(baseUrl: baseUrl);

  Future<MyOrdersData> getMyOrdersApiResponse(String? email) async {
    // await localStore.getUserDetail();
    return await baseApi.getMyOrdersListResponseProvider(email: email ?? '');
  }

  Future<List<String>> getCancelReasonResponse() async {
    return await baseApi.getCancelReasonResponseProvider();
  }

  Future<List<String>> getReturnReasonResponse() async {
    return await baseApi.getReturnReasonProvider();
  }

  Future<Map<String, dynamic>> postCancellationReasonResponse(body) async {
    return await baseApi.postCancellationResponseProvider(body: body);
  }

  Future<Map<String, dynamic>> postCreateMyTickets(body) async {
    return await baseApi.postCreateMyTicketsResponseProvider(body: body);
  }

  Future<Map<String, dynamic>> postItemCancellationReasonResponse(body) async {
    return await baseApi.postItemCancellationResponseProvider(body: body);
  }

  Future<Map<String, dynamic>> postReturnOrder(body) async {
    return await baseApi.postReturnOrderResponseProvider(body: body);
  }

  Future<Map<String, dynamic>> postItemReturnReasonResponse(body) async {
    return await baseApi.postItemReturnResponseProvider(body: body);
  }
}

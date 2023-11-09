import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class MyOrderApi<T> extends MyOrderApiInterface {
  static const String myOrders =
      "/V1/ordersData?searchCriteria[filter_groups][0][filters][0][field]=customer_email&searchCriteria[filter_groups][0][filters][0][condition_type]=equal&searchCriteria[filter_groups][0][filters][0][value]=";
  static String cancelReasonApi = '/rest/V1/order/cancellation/reasons';
  static String returnReasonStatusApi = '/rest/V1/returnStatus';
  static String cancellationApi = '/rest/V1/order/cancellation/';
  static String createMyTicket = '/rest/V1/mytickets/create/';
  static String cancellationItemApi = '/rest/V1/orderItem/cancellation/';
  static String returnOrderApi = '/rest/V1/order/return/';
  static String returnOrderItemApi = '/rest/V1/orderItem/return';

  String baseUrl;
  late DioClient client;

  MyOrderApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<MyOrdersData> getMyOrdersListResponseProvider(
      {required String email}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>(
          "GET", "$baseUrl${LocalStore.getUrlWithOrdersCode()}$myOrders$email");
      return response.one((json) => MyOrdersData.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<String>> getCancelReasonResponseProvider() async {
    try {
      final response = await client.getClientWithoutHeader<List<dynamic>>("GET",
          "$baseUrl/${LocalStore.localStore.currentCode}$cancelReasonApi");
      //todo
      return response.data != null
          ? response.data?.map((e) => e.toString()).toList() ?? []
          : [];
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<String>> getReturnReasonProvider() async {
    try {
      final response = await client.getClient<List<dynamic>>("GET",
          "$baseUrl/${LocalStore.localStore.currentCode}$returnReasonStatusApi");
      //todo
      return response.data != null
          ? response.data?.map((e) => e.toString()).toList() ?? []
          : [];
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<Map<String, dynamic>> postCancellationResponseProvider(
      {required dynamic body}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("POST",
          "$baseUrl/${LocalStore.localStore.currentCode}$cancellationApi",
          token: true, body: body);
      return response.data ?? {};
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<Map<String, dynamic>> postCreateMyTicketsResponseProvider(
      {required dynamic body}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("POST",
          "$baseUrl/${LocalStore.localStore.currentCode}$createMyTicket",
          token: true, body: body);
      return response.data ?? {};
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<Map<String, dynamic>> postItemCancellationResponseProvider(
      {required dynamic body}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("POST",
          "$baseUrl/${LocalStore.localStore.currentCode}$cancellationItemApi",
          token: true, body: body);
      return response.data ?? {};
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<Map<String, dynamic>> postReturnOrderResponseProvider(
      {required dynamic body}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("POST",
          "$baseUrl/${LocalStore.localStore.currentCode}$returnOrderApi",
          token: true, body: body);
      return response.data ?? {};
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<Map<String, dynamic>> postItemReturnResponseProvider(
      {required dynamic body}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("POST",
          "$baseUrl/${LocalStore.localStore.currentCode}$returnOrderItemApi",
          token: true, body: body);
      return response.data ?? {};
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class MyOrderApiInterface<T> {
  Future<T?> getMyOrdersListResponseProvider({required String email});

  Future<T?> getCancelReasonResponseProvider();

  Future<T?> getReturnReasonProvider();

  Future<T?> postCancellationResponseProvider({required dynamic body});

  Future<T?> postCreateMyTicketsResponseProvider({required dynamic body});

  Future<T?> postItemCancellationResponseProvider({required dynamic body});

  Future<T?> postReturnOrderResponseProvider({required dynamic body});

  Future<T?> postItemReturnResponseProvider({required dynamic body});
}

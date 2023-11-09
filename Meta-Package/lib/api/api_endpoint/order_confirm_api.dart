import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';
import 'package:meta_package/api/models/order_tracking/order_traking_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class OrderConfirmApi<T> extends OrderConfirmApiInterface {
  static const String orderConfirmation = "/V1/ordersData/";
  static const String orderTrackingApi = '/rest/V1/orderTrackingList/';
  static const String createOrderEndPoint = "/rest/V1/orders/create";

  String baseUrl;
  late DioClient client;

  OrderConfirmApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<OrderConfirmationModel> getOrderConfirmationProvider(
      {required String id}) async {
    try {
      final response = await client.getClient(
          "GET", "$baseUrl${LocalStore.getUrlWithCode()}$orderConfirmation$id");
      return response.one((json) => OrderConfirmationModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<List<OrderTrackingModel>> getOrderTrackingResponseProvider(
      {required String id}) async {
    try {
      final response = await client.getClient<List<dynamic>>("GET",
          "$baseUrl/${LocalStore.localStore.currentCode}$orderTrackingApi$id",
          additionalHeaders: {
            "Content-type":
                "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW"
          });
      return response.many((json) => OrderTrackingModel.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class OrderConfirmApiInterface<T> {
  Future<T?> getOrderConfirmationProvider({required String id});

  Future<T?> getOrderTrackingResponseProvider({
    required String id,
  });
}

import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class OrderTrackApi<T> extends OrderTrackApiInterface {
  static const String trackOrder =
      "/V1/ordersData/?searchCriteria[filter_groups][0][filters][0][field]=increment_id&searchCriteria[filter_groups][0][filters][0][value]=";

  String baseUrl;
  late DioClient client;

  OrderTrackApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<MyOrdersData> getTrackYourOrderApiResponseProvider(
      {required String id}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("GET",
          '$baseUrl${LocalStore.getUrlWithOrdersCode()}$trackOrder$id&searchCriteria[');
      return response.one((json) => MyOrdersData.fromJson(json));
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  Future<MyOrdersDataItem> getGuestTrackYourOrderApiResponseProvider(
      {required dynamic body}) async {
    try {
      final response = await client.getClient<Map<String, dynamic>>("POST",
          '$baseUrl${LocalStore.getUrlWithOrdersCode()}/V1/orders/guest/form',
          token: true, body: body);
      return response.one((json) => MyOrdersDataItem.fromJson(json));
    } on FormatException catch (e) {
      throw ApiException(message: e.message, error: e);
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    }
  }
}

abstract class OrderTrackApiInterface<T> {
  Future<T?> getTrackYourOrderApiResponseProvider({required String id});
  Future<T?> getGuestTrackYourOrderApiResponseProvider({required dynamic body});
}

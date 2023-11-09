import 'package:dio/dio.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_client/dio_client.dart';
import 'package:meta_package/api/api_core/base_http_core.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:meta_package/api/models/my_ticket/ticket_messages_model.dart';
import 'package:meta_package/api/services/local_store_service.dart';

class MyTicketApi<T> extends MyTicketApiInterface {
  static String myTicketApi = '/rest/V1/mytickets/';
  static String ticketApi =
      'https://erp.theluxuryunlimited.com/api/ticket/send';
  static String createMyTicket = '/rest/V1/mytickets/create/';

  String baseUrl;
  late DioClient client;

  MyTicketApi({required this.baseUrl}) {
    client = DioClient.client;
    client.setBaseUrl(baseUrl);
  }

  @override
  Future<List<MyTicketList>> getMyTicketsResponseProvider(
      {required String id}) async {
    try {
      final response = await client.getClient<List<dynamic>>(
          "GET", "$baseUrl/${LocalStore.localStore.currentCode}$myTicketApi",
          token: true);
      List<MyTicketList> myTickets =
          response.many((json) => MyTicketList.fromJson(json));
      if (myTickets.isNotEmpty && myTickets.length == 1) {
        if (myTickets[0].error != null && !myTickets[0].error!) {
          if (myTickets[0].message != null &&
              myTickets[0].message == 'No tickets Found') {
            return [];
          }
        }
      }
      return myTickets;
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  @override
  Future<TicketMessagesModel> postMyTicketsResponseProvider(
      {required dynamic body}) async {
    try {
      final response = await client
          .getClient<Map<String, dynamic>>("POST", ticketApi, body: body);
      return response.one((json) => TicketMessagesModel.fromJson(json));
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
          '$baseUrl/${LocalStore.localStore.currentCode}$createMyTicket',
          additionalHeaders: {"Accept": "application/json"}, body: body);
      return response.data ?? {};
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }
}

abstract class MyTicketApiInterface<T> {
  Future<T?> getMyTicketsResponseProvider({required String id});

  Future<T?> postMyTicketsResponseProvider({
    required dynamic body,
  });

  Future<T?> postCreateMyTicketsResponseProvider({required dynamic body});
}

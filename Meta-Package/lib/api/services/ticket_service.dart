import 'package:meta_package/api/api_endpoint/my_ticket_api.dart';

import '../models/my_ticket/my_ticket_list.dart';
import '../models/my_ticket/ticket_messages_model.dart';

class TicketService {
  String baseUrl;
  late MyTicketApi myTicketApi;

  factory TicketService(String baseUrl) {
    return TicketService.internal(baseUrl);
  }

  TicketService.internal(this.baseUrl) {
    myTicketApi = MyTicketApi(baseUrl: baseUrl);
  }

  Future<List<MyTicketList>> getMyTickets(String id) async {
    return await myTicketApi.getMyTicketsResponseProvider(id: id);
  }

  Future<TicketMessagesModel> postMyTicketsResponseProvider(
      Map requestBody) async {
    return await myTicketApi.postMyTicketsResponseProvider(body: requestBody);
  }

  Future<Map<String, dynamic>> postCreateMyTickets(body) async {
    return await myTicketApi.postCreateMyTicketsResponseProvider(body: body);
  }
}

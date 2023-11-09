import 'package:meta_package/api/models/my_ticket/add_message_request.dart';
import 'package:meta_package/api/models/my_ticket/create_ticket_request.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:meta_package/api/models/my_ticket/ticket_messages_model.dart';
import 'package:meta_package/api/services/ticket_service.dart';

class MyTicketAPIRepository {
  MyTicketAPIRepository({required this.ticketService});

  final TicketService ticketService;

  Future<List<MyTicketList>> getMyTickets(String id) async {
    return await ticketService.getMyTickets(id);
  }

  Future<TicketMessagesModel> postMyTicketsResponseProvider(
      AddMessageRequest addMessageRequest) async {
    return await ticketService
        .postMyTicketsResponseProvider(addMessageRequest.toJson());
  }

  Future<Map<String, dynamic>> postCreateMyTickets(
      TicketForm createTicketRequest) async {
    return await ticketService
        .postCreateMyTickets(createTicketRequest.toJson());
  }
}

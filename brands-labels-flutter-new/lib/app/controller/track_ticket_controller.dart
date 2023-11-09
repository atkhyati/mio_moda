import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_ticket_api_repository.dart';
import 'package:meta_package/api/models/my_ticket/add_message_request.dart';
import 'package:meta_package/api/models/my_ticket/ticket_messages_model.dart';
import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';
import 'package:meta_package/api/services/ticket_service.dart';
import 'package:meta_package/utils/validator.dart';

import '../core/consts/app_constants.dart';
import '../presentation/screens/track_ticket_list/widget/trace_ticket_dialog_box.dart';

class TrackTicketController extends GetxController {
  RxList<TrackTicketModal> trackTicketList = <TrackTicketModal>[].obs;
  RxBool dialogLoading = true.obs;
  TicketMessagesModel ticketMessagesModel = TicketMessagesModel();
  MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));
  final TextEditingController messageController = TextEditingController();
  Rx<TicketData> getTicketMessagesData = TicketData().obs;
  @override
  void onInit() {
    trackTicketList.value = Get.arguments is List<TrackTicketModal>
        ? Get.arguments as List<TrackTicketModal>
        : [];
    super.onInit();
  }
  Future<void> getTicketMessages(TrackTicketModal? myTicketList) async {
    dialogLoading.value = true;
    try {
      try {
        TicketMessagesModel finalResponse =
        await myTicketAPIRepository.postMyTicketsResponseProvider(
          AddMessageRequest(
              website: "www.brands-labels.com",
              email: myTicketList?.email,
              ticketId: myTicketList?.ticketCode),
        );
        ticketMessagesModel = finalResponse;
        getTicketMessagesData.value =
        (ticketMessagesModel.tickets?.data ?? []).isNotEmpty
            ? ticketMessagesModel.tickets?.data?.first ?? TicketData()
            : TicketData();
        debugPrint("Response addDataToTicket is:-->>$finalResponse");
      } on ApiException catch (e) {
        Validators.apiExceptionError(e: e);
      } catch (e, st) {
        log('Error addDataToTicket $e && st:-> $st');
        Validators.appCatchError(error: e);
      }
      dialogLoading.value = false;
    } catch (e) {
      debugPrint(e.toString());
      dialogLoading.value = false;
      Validators.appCatchError(error: e);
    }
  }
  void showDialogBoxOpen(TrackTicketModal ticket) {
    getTicketMessages(ticket);
    showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return TraceTicketDialogBox(
          ticket: ticket,
        );
      },
    );
  }
  Future<void> addMessageToTicket(TrackTicketModal? myTicketList) async {
    dialogLoading.value = true;
    try {
      try {
        TicketMessagesModel? finalResponse = await myTicketAPIRepository
            .postMyTicketsResponseProvider(AddMessageRequest(
            website: "www.brands-labels.com",
            ticketId: myTicketList?.ticketCode,
            message: messageController.text,
            action: "send_messsage"));
        ticketMessagesModel = finalResponse;
        if (finalResponse != null) {
          getTicketMessagesData.value =
          (ticketMessagesModel.tickets?.data ?? []).isNotEmpty
              ? (ticketMessagesModel.tickets?.data?.first ?? TicketData())
              : TicketData();
          messageController.clear();
        }
        debugPrint("Response addDataToTicket is:-->>$finalResponse");
      } on ApiException catch (e) {
        Validators.apiExceptionError(e: e);
      } catch (e, st) {
        log('Error addDataToTicket $e && st:-> $st');
        Validators.appCatchError(error: e);
      }
      dialogLoading.value = false;
    } catch (e) {
      debugPrint(e.toString());
      dialogLoading.value = false;
      Validators.appCatchError(error: e);
    }
  }

}

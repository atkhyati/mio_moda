import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_ticket_api_repository.dart';
import 'package:meta_package/api/models/my_ticket/add_message_request.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:meta_package/api/models/my_ticket/ticket_messages_model.dart';
import 'package:meta_package/api/services/ticket_service.dart';
import 'package:veralusso/app/controller/my_tickets/widget/message_dialog.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/main/main.common.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class MyTicketsController extends GetxController {
  RxInt index = 0.obs;
  MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));

  MyTicketsController();

  RxBool isLoading = true.obs;
  RxBool isButtonTap = false.obs;
  RxBool dialogLoading = true.obs;
  TicketMessagesModel ticketMessagesModel = TicketMessagesModel();
  Rx<TicketData> getTicketMessagesData = TicketData().obs;

  RxList<MyTicketList> getTicketList = RxList<MyTicketList>();
  final TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    getMyTicket();
    super.onInit();
  }

  Future<void> getMyTicket() async {
    isLoading.value = true;
    try {
      debugPrint("getStoreDataFromApi -> ");
      await localStore.getUserDetail();
      List<MyTicketList> itemsData = await myTicketAPIRepository
          .getMyTickets(localStore.userDetail.id.toString());
      if (itemsData.isNotEmpty == true) {
        getTicketList.value = itemsData;
      }
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    }
    messageController.clear();
  }

  Future<void> addMessageToTicket(MyTicketList? myTicketList) async {
    dialogLoading.value = true;
    debugPrint(
      "getStoreDataFromApi -> ${(DateTime.now().millisecondsSinceEpoch / 1000).ceil()}",
    );
    try {
      TicketMessagesModel finalResponse = await myTicketAPIRepository
          .postMyTicketsResponseProvider(AddMessageRequest(
              email: myTicketList?.email,
              website: "www.veralusso.com",
              ticketId: myTicketList?.ticketCode,
              message: messageController.text,
              action: "send_messsage"));
      ticketMessagesModel = finalResponse;
      getTicketMessagesData.value =
          (ticketMessagesModel.tickets?.data ?? []).isNotEmpty
              ? ticketMessagesModel.tickets?.data?.first ?? TicketData()
              : TicketData();
      messageController.clear();
      debugPrint("Response addDataToTicket is:-->>$finalResponse");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, st) {
      log('Error addDataToTicket $e && st:-> $st');
      ExceptionHandler.appCatchError(error: e);
    } finally {
      dialogLoading.value = false;
    }
  }

  Future<void> getTicketMessages(MyTicketList? myTicketList) async {
    dialogLoading.value = true;
    try {
      List<MyTicketList> itemsData = await myTicketAPIRepository
          .getMyTickets(localStore.userDetail.id.toString());
      if (itemsData.isNotEmpty == true) {
        getTicketList.value = itemsData;
        debugPrint(itemsData[0].myticketsId);
      }

      // ticketMessagesModel = itemsData.;
      getTicketMessagesData.value =
          (ticketMessagesModel.tickets?.data ?? []).isNotEmpty
              ? ticketMessagesModel.tickets?.data?.first ?? TicketData()
              : TicketData();
      debugPrint("Response addDataToTicket is:-->>$itemsData");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, st) {
      log('Error addDataToTicket $e && st:-> $st');
      ExceptionHandler.appCatchError(error: e);
    } finally {
      dialogLoading.value = false;
    }
  }

  void showDialogBoxOpen(MyTicketList ticket) {
    getTicketMessages(ticket);
    showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return MessageDialog(
          ticket: ticket,
        );
      },
    );
  }
}

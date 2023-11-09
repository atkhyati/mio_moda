import 'dart:developer';

import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_orders_api_repository.dart';
import 'package:meta_package/api/api_repository/my_ticket_api_repository.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/api/models/my_ticket/cancel_reason_request.dart';
import 'package:meta_package/api/models/my_ticket/create_ticket_request.dart';
import 'package:meta_package/api/services/ticket_service.dart';
import 'package:meta_package/translations/translations.dart';

import '../presentation/common_widgets/common_widget/common_text_poppins.dart';
import '../presentation/screens/my_orders/widgets/create_ticket_dialogue.dart';
import '../presentation/screens/my_orders/widgets/selected_reason_dialogue.dart';
import '../presentation/screens/my_orders/widgets/show_success_dialogue.dart';

class MyOrdersController extends GetxController {
  RxInt index = 0.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Rx<MyOrdersData>? myOrdersModel = MyOrdersData().obs;

  final MyOrdersAPIRepository myOrdersAPIRepository =
      MyOrdersAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));
  RxBool isLoading = true.obs;
  MyOrdersDataItem argumentData12 = MyOrdersDataItem();
  RxList<String> cancelReasonList = <String>[].obs;
  RxString selectedCancelString = ''.obs;
  RxList<String> returnReasonList = <String>[].obs;
  RxString selectedReturnString = ''.obs;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController urlOfImageController = TextEditingController();
  final GlobalKey<FormState> ticketFormKey = GlobalKey<FormState>();

  MyOrdersController();

  @override
  void onInit() {
    super.onInit();
    getMyOrders();
  }

  Future<void> getMyOrders() async {
    isLoading.value = true;
    try {
      MyOrdersData data = await myOrdersAPIRepository
          .getMyOrdersApiResponse(localStore.userDetail.email);
      myOrdersModel?.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }

    debugPrint("MyOrder List Is ${myOrdersModel?.value}");
  }

  bool isOrderIsEmpty() {
    return myOrdersModel?.value.items == null ||
        (myOrdersModel?.value.items?.isEmpty ?? true);
  }

  void onCancelTap(MyOrdersDataItem? orderData) {
    argumentData12 = orderData ?? MyOrdersDataItem();
    if ((orderData?.extensionAttributes?.isCancellable ?? '0') == '1') {
      showDialogBoxOpen(order: orderData?.items?.first);
    } else {
      createTicketDialog();
    }
  }

  void showDialogBoxOpen({
    bool fromItem = false,
    ParentItemElement? order,
  }) {
    selectedCancelString.value = "";
    showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return SelectReasonDialog(
          reasonList: cancelReasonList,
          selectedReason: selectedCancelString,
          onTap: () async {
            if (selectedCancelString.value == "") {
              ScaffoldMessenger.of(Get.context!).showSnackBar(
                SnackBar(
                  content: CommonTextPoppins(
                    LanguageConstants.pleaseSelectReturnReasonItem.tr,
                  ),
                ),
              );
            } else {
              bool value = false;
              if (fromItem) {
                value = await postItemCancellationReason(
                    order?.itemId, order?.orderId);
              } else {
                value = await postCancellationReason(order?.orderId);
              }
              Get.back<dynamic>();
              if (value) {
                showTextDialog();
              } else {
                log('createMyTicketForCancelOrder is:-->>$fromItem');
                createTicketDialog(order: order, fromItem: fromItem);
              }
              // postReturnItem(order, context);
            }
          },
        );
      },
    );
  }

  void showTextDialog() {
    showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return const ShowSuccessDialog();
      },
    );
  }

  void createTicketDialog({ParentItemElement? order, bool fromItem = false}) {
    phoneNumberController.text = argumentData12.billingAddress?.telephone ?? '';
    urlOfImageController.clear();
    remarksController.clear();
    if (fromItem) {
      urlOfImageController.text =
          order?.extensionAttributess?.productImage ?? '';
    }
    showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return CreateTicketDialog(
          key: ticketFormKey,
          fromItem: fromItem,
          phoneNumberController: phoneNumberController,
          emailController:
              TextEditingController(text: localStore.userDetail.email),
          firstNameController:
              TextEditingController(text: localStore.userDetail.firstname),
          lastNameController:
              TextEditingController(text: localStore.userDetail.lastname),
          orderCancelController: TextEditingController(
              text: LanguageConstants.orderCancelRequest.tr),
          imageUrlController: urlOfImageController,
          remarksController: remarksController,
          orderController:
              TextEditingController(text: argumentData12.incrementId ?? ''),
          skuController: TextEditingController(
            text: fromItem
                ? (order?.sku ?? '')
                : (argumentData12.items ?? [])
                    .map((e) => e.sku ?? '')
                    .toList()
                    .join(","),
          ),
          onTap: () async {
            String msg = '';
            if (ticketFormKey.currentState != null &&
                ticketFormKey.currentState!.validate()) {
              if (fromItem) {
                msg = await createMyTicketForCancelItemOrder(order);
              } else {
                msg = await createMyTicketForCancelOrder();
              }
              Get.back<dynamic>();
              log(msg, name: "msg");
              Get.toNamed<dynamic>(RoutesConstants.requestReceivedScreen);
            }

            // showTicketResponseDialog(Get.context!, msg);
          },
        );
      },
    );
  }

  Future<String> createMyTicketForCancelOrder() async {
    isLoading.value = true;
    String style =
        (argumentData12.items ?? []).map((e) => e.sku).toList().join(",");
    debugPrint("createMyTicketForCancelOrder -> 00 :- >>$style");

    try {
      Map<String, dynamic> returnReasonListData = await myTicketAPIRepository
          .postCreateMyTickets(TicketForm(CreateTicketRequest(
                  name: localStore.userDetail.firstname,
                  lastName: localStore.userDetail.lastname,
                  email: localStore.userDetail.email,
                  phone: phoneNumberController.text,
                  brand: "Order # : ${argumentData12.incrementId ?? ''}",
                  style: style,
                  keyword: "Order Request",
                  imageUrl: urlOfImageController.text,
                  remarks:
                      "Order Request for Order : #${argumentData12.incrementId ?? ''} ,Reason :${remarksController.text}",
                  langCode: localStore.currentCode,
                  customerId: localStore.userDetail.id,
                  ticketType: 3)
              .toJson()));
      debugPrint(
          "getStoreDataFromApi createMyTicketForCancelOrder -> $returnReasonListData");
      isLoading.value = false;
      return returnReasonListData['message'].toString();
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
    isLoading.value = false;
    return '';
  }

  Future<bool> postItemCancellationReason(int? id, int? orderId) async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");

    try {
      Map<String, dynamic> returnReasonListData =
          await myOrdersAPIRepository.postItemCancellationReasonResponse(
              CancelReasonForm(CancelReasonRequest(
        itemId: id,
        orderId: orderId,
        reason: selectedCancelString.value,
        langCode: localStore.currentCode,
      ).toJson()));
      debugPrint(
          "getStoreDataFromApi postCancellationReason -> $returnReasonListData");
      isLoading.value = false;
      debugPrint("Cancel postCancellationReason list Get $cancelReasonList");
      return (returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
    isLoading.value = false;
    return false;
  }

  Future<bool> postCancellationReason(int? orderID) async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");

    try {
      Map<String, dynamic> returnReasonListData = await myOrdersAPIRepository
          .postCancellationReasonResponse(CancelReasonForm(CancelReasonRequest(
        orderId: orderID,
        reason: selectedCancelString.value,
        langCode: localStore.currentCode,
      ).toJson()));
      debugPrint(
          "getStoreDataFromApi postCancellationReason -> $returnReasonListData");
      isLoading.value = false;
      debugPrint("Cancel postCancellationReason list Get $cancelReasonList");
      return (returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool);
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
    isLoading.value = false;
    return false;
  }

  Future<String> createMyTicketForCancelItemOrder(
      ParentItemElement? order) async {
    isLoading.value = true;
    debugPrint("getStoreDataFromApi -> ");

    try {
      Map<String, dynamic> returnReasonListData = await myTicketAPIRepository
          .postCreateMyTickets(TicketForm(CreateTicketRequest(
                  name: localStore.userDetail.firstname,
                  lastName: localStore.userDetail.lastname,
                  email: localStore.userDetail.email,
                  phone: phoneNumberController.text,
                  brand: "Order # : ${argumentData12.incrementId ?? ''}",
                  style: order?.sku ?? '',
                  keyword: "Order Request",
                  imageUrl: order?.extensionAttributess?.productImage ?? '',
                  remarks:
                      "Order Request for Order : #${argumentData12.incrementId ?? ''} ,Reason :$selectedCancelString",
                  langCode: localStore.currentCode,
                  customerId: localStore.userDetail.id,
                  ticketType: 2)
              .toJson()));
      debugPrint(
          "getStoreDataFromApi createMyTicketForCancelItemOrder -> $returnReasonListData");
      isLoading.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelItemOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
      isLoading.value = false;
      debugPrint("$e");
    }
    isLoading.value = false;
    return '';
  }
}

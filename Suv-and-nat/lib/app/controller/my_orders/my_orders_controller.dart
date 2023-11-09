import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/my_orders_api_repository.dart';
import 'package:meta_package/api/api_repository/my_ticket_api_repository.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/api/models/my_ticket/cancel_reason_request.dart';
import 'package:meta_package/api/models/my_ticket/create_ticket_request.dart';
import 'package:meta_package/api/models/my_ticket/return_item_request.dart';
import 'package:meta_package/api/services/ticket_service.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/controller/my_orders/widgets/create_ticket_dialog.dart';
import 'package:suvandnat/app/controller/my_orders/widgets/select_reason_dialog.dart';
import 'package:suvandnat/app/controller/my_orders/widgets/show_success_dialog.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/theme/colors.dart';

class MyOrdersController extends GetxController {
  RxBool dialogLoader = false.obs;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Rx<MyOrdersData> myOrdersModel = MyOrdersData().obs;
  final MyOrdersAPIRepository myOrdersAPIRepository =
      MyOrdersAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  final MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));
  MyOrdersDataItem argumentData12 = MyOrdersDataItem();

  MyOrdersController();

  MyAccountDetails userDetail = MyAccountDetails();
  RxBool isLoading = true.obs;
  RxList<String> cancelReasonList = <String>[].obs;
  RxList<String> returnReasonList = <String>[].obs;
  RxString selectedReturnString = ''.obs;
  RxString selectedCancelString = ''.obs;

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController urlOfImageController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    getMyOrders();
    getReturnReasonList();
  }

  void onReturnTap(MyOrdersDataItem? orderData) {
    argumentData12 = orderData ?? MyOrdersDataItem();
    if ((orderData?.extensionAttributes?.isReturnable ?? '0') == '1') {
      showReturnReasonSelectionDialog(order: orderData?.items?.first);
    } else {
      createTicketForReturnDialog();
    }
  }

  Future<void> getReturnReasonList() async {
    try {
      List<String> returnReasonListData =
          await myOrdersAPIRepository.getReturnReasonResponse();
      if (returnReasonListData.isNotEmpty == true) {
        returnReasonList.value = returnReasonListData;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  Future<bool> postReturnOrder(orderId) async {
    isLoading.value = true;

    try {
      Map<String, dynamic> returnReasonListData = await myOrdersAPIRepository
          .postReturnOrder(ReturnItemForm(ReturnItemRequest(
                  orderId: orderId,
                  reason: selectedCancelString.value,
                  langCode: localStore.currentCode)
              .toJson()));
      isLoading.value = false;
      return (returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading.value = false;
    return false;
  }

  void showReturnReasonSelectionDialog(
      {bool fromItem = false, ParentItemElement? order}) {
    selectedReturnString.value = "";
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return SelectReasonDialog(
          fromReturn: true,
          reasonList: returnReasonList,
          selectedReason: selectedReturnString,
          onTap: () async {
            if (selectedReturnString.value == "") {
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
                value =
                    await postItemReturnReason(order?.itemId, order?.orderId);
              } else {
                value = await postReturnOrder(order?.orderId);
              }
              Get.back();
              if (value) {
                showTextDialog();
              } else {
                log('createMyTicketForCancelOrder is:-->>$fromItem');
                createTicketForReturnDialog(order: order, fromItem: fromItem);
              }
            }
          },
        );
      },
    );
  }

  void showTextDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return const ShowSuccessDialog();
      },
    );
  }

  void createTicketForReturnDialog(
      {ParentItemElement? order, bool fromItem = false}) {
    phoneNumberController.text = argumentData12.billingAddress?.telephone ?? '';
    urlOfImageController.clear();
    remarksController.clear();
    if (fromItem) {
      urlOfImageController.text =
          order?.extensionAttributess?.productImage ?? '';
    }
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CreateTicketDialog(
          fromItem: fromItem,
          fromReturn: true,
          phoneNumberController: phoneNumberController,
          emailController:
              TextEditingController(text: localStore.userDetail.email),
          firstNameController:
              TextEditingController(text: localStore.userDetail.firstname),
          lastNameController:
              TextEditingController(text: localStore.userDetail.lastname),
          orderCancelController: TextEditingController(
              text: LanguageConstants.orderReturnRequest.tr),
          imageUrlController: urlOfImageController,
          remarksController: remarksController,
          orderController:
              TextEditingController(text: argumentData12.incrementId ?? ''),
          skuController: TextEditingController(
            text: fromItem
                ? (order?.sku ?? '')
                : (argumentData12.items ?? [])
                    .map((e) => e.sku)
                    .toList()
                    .join(","),
          ),
          onTap: () async {
            if (fromItem) {
              await createMyTicketForReturnItemOrder(order);
            } else {
              await createMyTicketForReturnOrder();
            }
            Get.back();
            Get.toNamed(RoutesConstants.requestReceivedScreen);
            // showTicketResponseDialog(Get.context!, msg);
          },
        );
      },
    );
  }

  Future<String> createMyTicketForReturnOrder() async {
    dialogLoader.value = true;
    String style =
        (argumentData12.items ?? []).map((e) => e.sku).toList().join(",");
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
                  ticketType: 1)
              .toJson()));
      debugPrint(
          "getStoreDataFromApi createMyTicketForCancelOrder -> $returnReasonListData");
      dialogLoader.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      dialogLoader.value = false;
      ExceptionHandler.appCatchError(error: e);
    }
    dialogLoader.value = false;
    return '';
  }

  Future<bool> postItemReturnReason(id, orderID) async {
    isLoading.value = true;
    debugPrint("postItemReturnReason -> ");

    try {
      Map<String, dynamic> returnReasonListData = await myOrdersAPIRepository
          .postItemReturnReasonResponse(ReturnItemForm(ReturnItemRequest(
                  itemId: id,
                  orderId: orderID,
                  reason: selectedCancelString.value,
                  langCode: localStore.currentCode)
              .toJson()));
      isLoading.value = false;
      return (returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool);
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading.value = false;
    return false;
  }

  Future<String> createMyTicketForReturnItemOrder(
      ParentItemElement? order) async {
    dialogLoader.value = true;

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
                  ticketType: 1)
              .toJson()));

      dialogLoader.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelItemOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      dialogLoader.value = false;
      ExceptionHandler.appCatchError(error: e);
    }
    dialogLoader.value = false;
    return '';
  }

  Future<void> getMyOrders() async {
    isLoading.value = true;
    try {
      await localStore.getUserDetail();
      userDetail = localStore.userDetail;
      MyOrdersData data = await myOrdersAPIRepository
          .getMyOrdersApiResponse(localStore.userDetail.email);
      myOrdersModel.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e, stackStrace) {
      log(e.toString());
      log(stackStrace.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  bool orderDataIsEmpty() {
    return myOrdersModel.value.items == null ||
        (myOrdersModel.value.items?.isEmpty ?? false);
  }

  String getName(MyOrdersDataItem? orderData) {
    return '${orderData?.billingAddress?.firstname ?? ''} ${orderData?.billingAddress?.lastname ?? ''}';
  }

  String getSubTotal(MyOrdersDataItem? orderData) {
    return '${orderData?.subtotal?.toString() ?? '-'} ${orderData?.orderCurrencyCode?.toString() ?? ''}';
  }

  Color getReturnableColor(MyOrdersDataItem? orderData) {
    return (orderData?.extensionAttributes?.isReturnable ?? '0') == '1'
        ? blackColor
        : grey;
  }

  Color getCancellableColor(MyOrdersDataItem? orderData) {
    return (orderData?.extensionAttributes?.isCancellable ?? '0') == '1'
        ? blackColor
        : grey;
  }
  //Cancel order API and flow

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
    showDialog(
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
              Get.back();
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
      return returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return false;
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
      return returnReasonListData['error'] is bool &&
          returnReasonListData['error'] as bool;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return false;
  }

  void createTicketDialog({ParentItemElement? order, bool fromItem = false}) {
    phoneNumberController.text = argumentData12.billingAddress?.telephone ?? '';
    urlOfImageController.clear();
    remarksController.clear();
    if (fromItem) {
      urlOfImageController.text =
          order?.extensionAttributess?.productImage ?? '';
    }
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CreateTicketDialog(
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
                    .map((e) => e.sku)
                    .toList()
                    .join(","),
          ),
          onTap: () async {
            String msg = '';
            if (fromItem) {
              msg = await createMyTicketForCancelItemOrder(order);
            } else {
              msg = await createMyTicketForCancelOrder();
            }
            Get.back();
            log(msg, name: "msg");
            Get.toNamed(RoutesConstants.requestReceivedScreen);
            // showTicketResponseDialog(Get.context!, msg);
          },
        );
      },
    );
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
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return '';
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
                  remarks: "",
                  langCode: localStore.currentCode,
                  customerId: localStore.userDetail.id,
                  ticketType: 3)
              .toJson()));
      debugPrint(
          "getStoreDataFromApi createMyTicketForCancelOrder -> $returnReasonListData");
      isLoading.value = false;
      debugPrint(
          "Cancel createMyTicketForCancelOrder list Get $cancelReasonList");
      return returnReasonListData['message'].toString();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
    return '';
  }
}

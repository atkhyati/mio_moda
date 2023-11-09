import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:suvandnat/app/controller/my_tickets/my_tickets_controller.dart';
import 'package:suvandnat/app/controller/my_tickets/widget/message_dialog_message_view.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/presentation/common_widget/screen_loading.dart';
import 'package:suvandnat/app/theme/colors.dart';

class MessageDialog extends StatelessWidget {
  MessageDialog({Key? key, required this.ticket}) : super(key: key);

  final MyTicketsController ticketsController = Get.find();
  final MyTicketList ticket;

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      backgroundColor: backGroundColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 10.0,
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      contentWidget: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: getHeight(context),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.close),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: ticketsController.messageController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: blackColor),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: blackColor),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  contentPadding: const EdgeInsets.fromLTRB(
                                    20,
                                    10,
                                    10,
                                    10,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: blackColor),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: blackColor),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  hintText: ticketsController
                                              .isButtonTap.value &&
                                          ticketsController
                                                  .messageController.text ==
                                              ''
                                      ? LanguageConstants.pleaseEnterMessage.tr
                                      : LanguageConstants.typeMessageHere.tr,
                                  hintStyle:
                                      const TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: appColorPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () async {
                                ticketsController.isButtonTap.value = true;
                                ticketsController.update();
                                FocusNode().unfocus();
                                if (ticketsController.messageController.text !=
                                    "") {
                                  await ticketsController
                                      .addMessageToTicket(ticket);
                                }
                              },
                              child: HeadlineBodyOneBaseWidget(
                                title: LanguageConstants.submitText.tr,
                                titleColor: Colors.white,
                                fontFamily: AppConstants.fontPoppins,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MessageDialogMessageView(
                          getTicketMessagesData:
                              ticketsController.getTicketMessagesData,
                        ),
                      ],
                    ),
                  ),
                ),
                ticketsController.dialogLoading.value
                    ? const ScreenLoading()
                    : const SizedBox.shrink()
              ],
            ),
          ],
        ),
      ),
    );
  }

  double getHeight(BuildContext context) {
    return ticketsController.getTicketMessagesData.value.messages != null
        ? (ticketsController.getTicketMessagesData.value.messages?.isNotEmpty ??
                false)
            ? MediaQuery.of(context).size.height / 2
            : MediaQuery.of(context).size.height / 5
        : MediaQuery.of(context).size.height / 5;
  }
}

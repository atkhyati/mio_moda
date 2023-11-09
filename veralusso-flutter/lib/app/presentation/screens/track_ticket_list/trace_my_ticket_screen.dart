import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/controller/track_your_ticket_mail/track_ticket_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class TrackTicketScreen extends GetView<TrackTicketController> {
  TrackTicketScreen({Key? key}) : super(key: key);

  @override
  final TrackTicketController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: commonAppbar(
        title: LanguageConstants.myTicketsText.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
            // border: Border.all(color: borderGrey, width: 2)
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                height: 40.w,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: blueTileColor,
                    border: Border.all(color: borderGrey, width: 1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(11),
                      topRight: Radius.circular(11),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        LanguageConstants.idText.tr,
                        style: AppTextStyle.textStyleUtils500_16(),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          LanguageConstants.nameChatText.tr,
                          style: AppTextStyle.textStyleUtils500_16(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          LanguageConstants.actionText.tr,
                          style: AppTextStyle.textStyleUtils500_16(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const Divider(
              //   color: borderGrey,
              //   height: 2,
              //   thickness: 2,
              // ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.trackTicketList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    TrackTicketModal ticket = controller.trackTicketList[index];
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: borderGrey,
                            width: 1,
                          ),
                          right: BorderSide(
                            color: borderGrey,
                            width: 1,
                          ),
                          left: BorderSide(
                            color: borderGrey,
                            width: 1,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            // flex: 2,
                            child: Text(
                              ticket.myticketsId ??
                                  LanguageConstants.toBeUpdated.tr,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.textStyleUtils400(),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: Text(
                              (ticket.keyword ?? '-').capitalizeFirst ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.textStyleUtils400(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // const SizedBox(width: 5),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                controller.isButtonTap.value = false;
                                controller.showDialogBoxOpen(MyTicketList(
                                    ticketCode: ticket.ticketCode,
                                    email: ticket.email));
                              },
                              child: const Icon(
                                Icons.visibility_outlined,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

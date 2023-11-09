import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestReceivedScreen extends StatelessWidget {
  const RequestReceivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(RoutesConstants.dashboardScreen);
        return true;
      },
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAllNamed(RoutesConstants.dashboardScreen);
            },
          ),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: whiteColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  requestReceivedWidget(),
                  const SizedBox(height: 15),
                  CommonThemeButton(
                    isOutLined: true,
                    buttonColor: whiteColor,
                    textColor: primary,
                    onTap: () {
                      Get.toNamed(RoutesConstants.myTicketScreen);
                    },
                    title:
                        LanguageConstants.myTicketsText.tr,
                    
                  ),
                  const SizedBox(height: 15),
                  CommonThemeButton(
                    onTap: () {
                      Get.offAllNamed(RoutesConstants.dashboardScreen);
                    },
                    title:
                        LanguageConstants.continueShopping.tr,
                     
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget requestReceivedWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Text(LanguageConstants.yourRequestHasBeenReceived.tr,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils500()),
          const SizedBox(height: 10),
          Text(LanguageConstants.youCanViewYourRequestsatMyTickets.tr,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils400()),
        ],
      ),
    );
  }
}

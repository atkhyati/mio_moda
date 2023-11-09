import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class RequestReceivedScreen extends StatelessWidget {
  const RequestReceivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(RoutesConstants.dashboardScreen);
        return true;
      },
      child: CommonBacground(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.offAllNamed(RoutesConstants.dashboardScreen);
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Text(
                          LanguageConstants.yourRequestHasBeenReceived.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(size: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          LanguageConstants
                              .youCanViewYourRequestsAtMyTickets.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  CommonThemeButton(
                    onTap: () {
                      Get.toNamed(RoutesConstants.myTickets);
                    },
                    title: LanguageConstants.myTicketsText.tr,
                  ),
                  const SizedBox(height: 10),
                  CommonThemeButton(
                    onTap: () {
                      Get.offAllNamed(RoutesConstants.dashboardScreen);
                    },
                    title: LanguageConstants.continueShopping.tr,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

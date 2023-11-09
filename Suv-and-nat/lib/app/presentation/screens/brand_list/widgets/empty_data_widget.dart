import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/brand_list/brand_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

import '../../../common_widget/common_animations/nothing_to_show_animation.dart';

class EmptyDataWidget extends GetView<BrandController> {
  const EmptyDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const NothigToShowAnimationWidget(),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                softWrap: true,
                textScaleFactor: 1,
                text: TextSpan(
                  text: LanguageConstants.itSeemsWeHaveNothingToShowFor.tr,
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: controller.searchController.text,
                      style: AppTextStyle.textStyleUtils700(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                softWrap: true,
                textScaleFactor: 1,
                text: TextSpan(
                  text: LanguageConstants
                      .ifYouWouldLikeToHaveMoreInformationAbout.tr,
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: controller.searchController.text,
                      style: AppTextStyle.textStyleUtils700(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                LanguageConstants.thenPleaseCreateATicket.tr,
                style: DefaultTextStyle.of(context).style,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  CommonThemeButton(
                    onTap: () {
                      Get.toNamed(
                        RoutesConstants.specialRequestScreen,
                        arguments: [
                          controller.searchController.text,
                          "brand",
                        ],
                      );
                    },
                    title: LanguageConstants.createTicket.tr,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  CommonThemeButton(
                    onTap: () {
                      controller.continueShoppingTap();
                    },
                    title: LanguageConstants.continueShopping.tr,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/controller/track_your_order_controller.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../core/utils/lang_directory/language_constant.dart';

class TrackYourOrderScreen extends GetView<TrackYourOrderController> {
  const TrackYourOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Column(
        children: [
          commonAppbar(
            title: LanguageConstants.trackYourOrder.tr,
          ),
          Expanded(
            child: Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: Container(
                        color: Colors.transparent,
                        child: const SpinKitThreeBounce(
                          color: darkBlue,
                          // size: 50.0,
                        ),
                      ),
                    )
                  : Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            localStore.isGuest
                                ? Column(
                                    children: [
                                      Text(
                                        LanguageConstants
                                            .registeredCustomers.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                          size: 16.sp,
                                        ).copyWith(decorationColor: darkBlue),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          LanguageConstants
                                              .ifYouHaveAnAccountSignInWithYourEmailAddress
                                              .tr,
                                          textAlign: TextAlign.center,
                                          style:
                                              AppTextStyle.textStyleUtils400()
                                                  .copyWith(
                                                      decorationColor:
                                                          darkBlue),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CommonThemeButton(
                                        onTap: () {
                                          Get.toNamed(
                                              RoutesConstants.loginScreen);
                                        },
                                        title: LanguageConstants.signInText.tr,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                LanguageConstants
                                    .pleaseEnterOrderNumberToTrackYourOrder.tr,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.textStyleUtils400(),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: GetBuilder<TrackYourOrderController>(
                                id: "Track",
                                builder: (controller) {
                                  return Form(
                                    key: controller.formKey,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10.w),
                                      width: 280.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border:
                                              Border.all(color: borderGrey)),
                                      child: TextFormField(
                                        cursorColor: darkBlue,
                                        controller:
                                            controller.orderNumberController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: (controller.isValid &&
                                                  controller
                                                          .orderNumberController
                                                          .value
                                                          .text ==
                                                      "")
                                              ? LanguageConstants
                                                  .enterOrderNumber.tr
                                              : LanguageConstants
                                                  .enteryOurOrderNumberHere.tr,
                                          labelStyle:
                                              AppTextStyle.textStyleUtils400(
                                                  color: Colors.black54),
                                          hintStyle:
                                              AppTextStyle.textStyleUtils400(),
                                          border: InputBorder.none,
                                        ),
                                        validator: (value) {
                                          if (value == null || value == '') {
                                            return null;
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Center(
                              child: SizedBox(
                                child: CommonThemeButton(
                                  onTap: () {
                                    controller.isValid = true;
                                    controller.update(["Track"]);
                                    if (controller
                                            .orderNumberController.value.text !=
                                        "") {
                                      controller.getTrackYourOrder();
                                    }
                                  },
                                  title: LanguageConstants.submitText.tr,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/screens/brand_list/widgets/brand_expand_detail_widget.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../controller/brand_controller.dart';
import '../../../core/utils/app_routes.dart';
import '../../../theme/colors.dart';

class BrandListPage extends GetView<BrandController> {
  const BrandListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // groupMyList();
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            Scaffold(
              backgroundColor: appBGColor,
              body: controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xff367587),
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 67.h,
                        ),
                        SizedBox(
                          width: 327.w,
                          child: TextFormField(
                              style: AppTextStyle.textStyleUtils400(
                                size: 12.sp,
                                color: Colors.black54,
                              ),
                              cursorColor: appTextColor,
                              controller: controller.searchController,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search_sharp,
                                  color: Colors.grey.shade300,
                                  size: 20,
                                ),
                                filled: true,
                                fillColor: whiteColor,
                                contentPadding: const EdgeInsets.only(
                                  bottom: 5,
                                  top: 12,
                                  left: 10,
                                ),
                                hintText: LanguageConstants.findBrandsText.tr,
                                hintStyle: AppTextStyle.textStyleUtils400(
                                  size: 12.sp,
                                  color: Colors.black54,
                                ),
                                errorStyle: AppTextStyle.textStyleUtils400(
                                  color: const Color(
                                    0xff367587,
                                  ),
                                  size: 12.sp,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                              ),
                              onChanged: (String value) {
                                if (value.isEmpty) {
                                  Future.delayed(
                                    const Duration(
                                      milliseconds: 500,
                                    ),
                                  ).then((value) {
                                    controller.filtersearchAlllist.value = [];
                                    controller.update();
                                    controller.isSearchEnable.value = false;
                                    controller.getBrandList();
                                  });
                                } else {
                                  controller.setSerchwithAlphabatic(
                                      value.toUpperCase());
                                }
                              }),
                        ),
                        Expanded(
                          child: controller.isLoading.value
                              ? const Center(
                                  child: SpinKitThreeBounce(
                                  color: appColor,
                                  // size: 50.0,
                                ))
                              : (controller.isSearchEnable.value == true
                                      ? controller
                                          .filtersearchAlllist.isNotEmpty
                                      : controller.filterAlllist.isNotEmpty)
                                  ? ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w),
                                      itemCount: controller
                                              .filtersearchAlllist.isNotEmpty
                                          ? controller
                                              .filtersearchAlllist.length
                                          : controller.filterAlllist.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final String brandsListCapital =
                                            controller.filtersearchAlllist
                                                    .isNotEmpty
                                                ? controller
                                                    .filtersearchAlllist[index]
                                                : controller
                                                    .filterAlllist[index]
                                                    .toString();
                                        return Container(
                                          margin: EdgeInsets.only(
                                              top: 8.h, bottom: 8.h),
                                          child: ListTileTheme(
                                            contentPadding: EdgeInsets.zero,
                                            minVerticalPadding: 10,
                                            dense: true,
                                            horizontalTitleGap: 1.2,
                                            minLeadingWidth: 10,
                                            child: BrandExpandDetailWidget(
                                              text: brandsListCapital,
                                              value: index + 1,
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : SingleChildScrollView(
                                      padding: const EdgeInsets.only(
                                        bottom: 50,
                                        left: 7,
                                        right: 7,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                text: LanguageConstants
                                                    .itSeemsWeHaveNothingToShowFor
                                                    .tr,
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        " ${controller.searchController.text}",
                                                    style: AppTextStyle
                                                        .textStyleUtils700(),
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
                                                    .ifYouWouldLikeToHaveMoreInformationAbout
                                                    .tr,
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        " ${controller.searchController.text}",
                                                    style: AppTextStyle
                                                        .textStyleUtils700(),
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
                                              LanguageConstants
                                                  .thenPleaseCreateATicket.tr,
                                              style: AppTextStyle
                                                  .textStyleUtils500(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                            ),
                                            child: Column(
                                              children: [
                                                CommonThemeButton(
                                                  isOutLined: true,
                                                  buttonColor: whiteColor,
                                                  textColor: primary,
                                                  onTap: () {
                                                    Get.toNamed(
                                                      RoutesConstants
                                                          .specialRequesScreen,
                                                      arguments: [
                                                        controller
                                                            .searchController
                                                            .text,
                                                        "brand",
                                                      ],
                                                    );
                                                  },
                                                  title: LanguageConstants
                                                      .createTicket.tr,
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                CommonThemeButton(
                                                  onTap: () {
                                                    controller
                                                        .continueShoppingTap();
                                                  },
                                                  title: LanguageConstants
                                                      .continueShopping.tr,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandDetail {
  String? name;
  String? id;

  BrandDetail({required this.name, required this.id});
}

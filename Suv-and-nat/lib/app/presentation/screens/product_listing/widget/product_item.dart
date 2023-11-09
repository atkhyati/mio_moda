import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/controller/product_listing/product_controller.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/screens/product_listing/product_filter.dart';
import 'package:suvandnat/app/presentation/screens/product_listing/product_list_add_dialog.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class ProductItemWidget extends GetView<ProductController> {
  const ProductItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
        child: controller.itemList.isNotEmpty
            ? Scaffold(
                backgroundColor: Colors.transparent,
                floatingActionButton: Container(
                  decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8,
                    ),
                    child: Text(
                      '${controller.productCount.value.toString()}/${(controller.productModel?.value.totalCount ?? 0).toString()}',
                      style: AppTextStyle.textStyleUtils400(
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.startDocked,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 47.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                          color: const Color(0xfff3eae7),
                          borderRadius: BorderRadius.circular(12)),
                      child: MaterialButton(
                        onPressed: () {
                          // Get.toNamed<dynamic>(RoutesConstants.filterScreen);
                          // controller.getSortedProducts();
                          showGeneralDialog(
                            context: context,
                            barrierColor: Colors.black12.withOpacity(0.6),
                            // Background color
                            barrierDismissible: false,
                            barrierLabel: 'Dialog',
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            pageBuilder: (_, __, ___) {
                              return const Scaffold(
                                  resizeToAvoidBottomInset: false,
                                  body: ProductFilter());
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppAsset.filter,
                              width: 18.0,
                              height: 18.0,
                              color: appColor,
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Text(
                              LanguageConstants.filter.tr,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        controller: controller.scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 12.5,
                          childAspectRatio: .80,
                        ),
                        itemCount: controller.itemList.length,
                        itemBuilder: (_, index) {
                          ProductItem? item = controller.itemList[index];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.productDetailsScreen,
                                  arguments: [item, Get.arguments[0]]);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(4.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Container(
                                            color: blackColor.withOpacity(.2),
                                            // decoration: BoxDecoration(),
                                            child: item.mediaGalleryEntries!
                                                        .isEmpty ||
                                                    item.mediaGalleryEntries![0]
                                                        .file!.isEmpty
                                                ? Center(
                                                    child: Image.asset(
                                                      AppAsset.logo,
                                                    ),
                                                  )
                                                : PageView.builder(
                                                    itemCount: controller
                                                        .productImageList[index]
                                                        .length,
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    onPageChanged:
                                                        (int index2) {
                                                      controller
                                                              .dotsList[index] =
                                                          List.generate(
                                                        controller
                                                            .dotsList[index]
                                                            .length,
                                                        (index) => false,
                                                      );
                                                      controller.dotsList[index]
                                                          [index2] = true;
                                                      controller.update(
                                                        [
                                                          'images_dots',
                                                          'back_button',
                                                          'next_button'
                                                        ],
                                                      );
                                                    },
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index2) {
                                                      return CachedNetworkImage(
                                                        imageUrl:
                                                            "${AppConstants.productImageUrl}${controller.productImageList[index][index2]}",
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        memCacheWidth: 200,
                                                        memCacheHeight: 150,
                                                        placeholder: (context,
                                                                url) =>
                                                            Container(
                                                                color:
                                                                    backGroundColor),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                          AppAsset.logo,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          left: 0,
                                          right: 0,
                                          child: Center(
                                            child: SizedBox(
                                              height: 5,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: controller
                                                    .dotsList[index].length,
                                                itemBuilder: (context, index2) {
                                                  return GetBuilder<
                                                      ProductController>(
                                                    id: "images_dots",
                                                    builder: (controller) {
                                                      return AnimatedContainer(
                                                        height: 5,
                                                        width: 5,
                                                        duration:
                                                            200.milliseconds,
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                          horizontal: 2,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: controller
                                                                      .dotsList[
                                                                  index][index2]
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    (item.name ?? '').toUpperCase(),
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle.textStyleUtils400_16()
                                        .copyWith(
                                            overflow: TextOverflow.ellipsis),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    item.extensionAttributes
                                            ?.convertedRegularPrice ??
                                        '',
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle.textStyleUtils600(
                                            size: 15)
                                        .copyWith(
                                            overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    controller.productLoading.value
                        ? const Center(
                            child: SpinKitThreeBounce(
                              color: appColorPrimary,
                              size: 20.0,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              )
            : Get.arguments != null && Get.arguments[0] == "brand"
                ? Padding(
                    padding:
                        const EdgeInsets.only(bottom: 50, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const NothigToShowAnimationWidget(),
                        Text(
                          LanguageConstants
                              .itSeemsLikeWeHaveNothingToShowForThisBrand.tr,
                          style: AppTextStyle.textStyleUtils500(),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CommonTextPoppins(
                            '${LanguageConstants.ifyouwouldlikeUsSendYouTheCollectionFrom.tr} ${Get.arguments[2]} \n${LanguageConstants.plsCreateATicketBelow.tr}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: CommonThemeButton(
                                isOutLined: true,
                                buttonColor: Colors.transparent,
                                textColor: primary,
                                onTap: () async {
                                  Get.toNamed(
                                      RoutesConstants.specialRequestScreen,
                                      arguments: [Get.arguments[2], "brand"]);
                                },
                                title: LanguageConstants.createTicket.tr,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: CommonThemeButton(
                                onTap: () async {
                                  Get.back();
                                  // Get.offAllNamed(
                                  //     RoutesConstants.dashboardScreen);
                                },
                                title: LanguageConstants.continueShopping.tr,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.w,
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(bottom: 50, left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const NothigToShowAnimationWidget(),
                        Text(
                          LanguageConstants
                              .itSeemsLikeWeHaveNothingToShowForThisCategory.tr,
                          style: AppTextStyle.textStyleUtils500(),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: CommonTextPoppins(
                            '${LanguageConstants.ifyouwouldlikeUsSendYouTheCollectionFrom.tr} ${Get.arguments[2]} ${LanguageConstants.plsCreateATicketBelow.tr}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: CommonThemeButton(
                                isOutLined: true,
                                buttonColor: Colors.transparent,
                                textColor: primary,
                                onTap: () async {
                                  Get.toNamed(
                                      RoutesConstants.specialRequestScreen,
                                      arguments: [
                                        Get.arguments[2],
                                        "category"
                                      ]);
                                },
                                title: LanguageConstants.createTicket.tr,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: CommonThemeButton(
                                onTap: () async {
                                  Get.offAllNamed(
                                      RoutesConstants.dashboardScreen);
                                },
                                title: LanguageConstants.continueShopping.tr,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        )
                      ],
                    ),
                  )));
  }

  Widget favoriteOrNot(ProductItem item) {
    return Obx(
      () => item.isWishList.value
          ? const Icon(
              Icons.favorite,
              color: appColorPrimary,
            )
          : SvgPicture.asset(
              AppAsset.heart,
              height: 14,
              color: appColorPrimary,
            ),
    );
  }

  void showAddDialog(BuildContext context, ProductItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ProductListAddDialog(
          item: item,
        );
      },
    );
  }
}

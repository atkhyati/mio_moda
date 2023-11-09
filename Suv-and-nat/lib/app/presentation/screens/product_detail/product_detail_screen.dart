import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:suvandnat/app/controller/my_orders/widgets/show_ticket_response.dart';
import 'package:suvandnat/app/controller/product_detail/product_detail_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/common_widget/screen_loading.dart';
import 'package:suvandnat/app/presentation/screens/product_detail/create_ticket_best_price_dialog.dart';
import 'package:suvandnat/app/presentation/screens/product_detail/product_details_outofstock.dart';
import 'package:suvandnat/app/presentation/screens/product_detail/widget/expand_detail_widget.dart';
import 'package:suvandnat/app/presentation/screens/product_detail/widget/prodct_detail_recommended.dart';
import 'package:suvandnat/app/presentation/screens/product_detail/widget/product_detail_image_carosal.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../../theme/app_asset.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          elevation: 0,
          title: Text(
            LanguageConstants.productDetails.tr,
            style: AppTextStyle.textStyleUtils400(),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            Obx(
              () => IconButton(
                onPressed: () {
                  if (controller.product!.value.isWishList.value == true) {
                    Get.rawSnackbar(message: 'Already added to wishlist');
                  } else {
                    controller.wishlistOnTap(context);
                  }
                },
                icon: Icon(
                  controller.product?.value.isWishList.value == true
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 25,
                  color: primary,
                ),
              ),
            ),
          ],
        ), // commonAppbar(title: "Product Details"),
        body: Obx(
          () => Stack(
            children: [
              controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: appColorPrimary,
                        // size: 50.0,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ProductImageCarosal(),
                            SizedBox(
                              height: 30.h,
                            ),

                            // const SizedBox(
                            //   height: 30,
                            // ),
                            // Text(
                            //   controller.getBrands(),
                            //   style: AppTextStyle.textStyleUtils500(size: 24.0),
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Column(
                                children: [
                                  Text(
                                    controller.product?.value.name ?? '',
                                    style: AppTextStyle.textStyleUtils500(
                                        size: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  ExpandDetailWidget(
                                    text: LanguageConstants.description.tr,
                                    child: Text(
                                      controller.product!.value
                                          .getProductDescription(),
                                      style: AppTextStyle.textStyleUtils400(
                                          size: 12.sp, color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  ExpandDetailWidget(
                                    text: LanguageConstants.details.tr,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonTextPoppins(
                                          "${LanguageConstants.composition.tr} : ${controller.product!.value.getComposition()}",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                        ),
                                        SizedBox(height: 8.h),
                                        if (controller.product!.value
                                                .getColor() !=
                                            '')
                                          CommonTextPoppins(
                                            "${LanguageConstants.color.tr} : ${controller.product!.value.getColor()}",
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showPriceMatch(context);
                                        },
                                        child: Text(
                                          LanguageConstants.priceMatch.tr,
                                          style: AppTextStyle
                                              .textStyleUtilsUnderLine(
                                                  color: appColorPrimary,
                                                  thickness: .6,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(20.w),
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller
                                                  .getConvertRegularPriceFromConfigurableProduct(),
                                              style: AppTextStyle
                                                  .textStyleUtils500(
                                                      size: 14.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        if (controller.estimatedTime.value !=
                                            "The product is out of stock.")
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 15.w),
                                            child: Text(
                                                "${LanguageConstants.estimatedDeliveryDate.tr}: ${controller.estimatedTime.value.split(':').last + ""}",
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyle
                                                    .textStyleUtils400(
                                                        size: 14.sp)),
                                          ),
                                        if (controller.product!.value.typeId ==
                                            'configurable')
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: const Color(
                                                          0xffF5FDFF)),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: DropdownButton(
                                                      alignment:
                                                          AlignmentDirectional
                                                              .center,
                                                      items: controller
                                                          .listOfChoose
                                                          .map(
                                                            (value) =>
                                                                DropdownMenuItem(
                                                              value: value,
                                                              child: Text(
                                                                  value.label ??
                                                                      ''),
                                                            ),
                                                          )
                                                          .toList(),
                                                      isExpanded: true,
                                                      hint:
                                                          controller.sizeList
                                                                  .isEmpty
                                                              ? SizedBox(
                                                                  width: 200.w,
                                                                  child: Text(
                                                                      LanguageConstants
                                                                          .chooseAnOption
                                                                          .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: AppTextStyle.textStyleUtils400(
                                                                          color:
                                                                              primary)),
                                                                )
                                                              : SizedBox(
                                                                  width: 200.w,
                                                                  child: Text(
                                                                    controller
                                                                            .sizeList
                                                                            .first
                                                                            .label ??
                                                                        '',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: AppTextStyle
                                                                        .textStyleUtils400(
                                                                            color:
                                                                                primary),
                                                                  ),
                                                                ),
                                                      icon: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        size: 22,
                                                        color: Colors.black,
                                                      ),
                                                      iconEnabledColor:
                                                          Colors.transparent,
                                                      onChanged: (SizeModel?
                                                          valueList) {
                                                        debugPrint("Val");
                                                        controller.sizeList
                                                            .clear();
                                                        controller.sizeList.add(
                                                            valueList ??
                                                                SizeModel());
                                                        if ((controller
                                                                    .sizeList
                                                                    .first
                                                                    .value ??
                                                                '') ==
                                                            "Missing") {
                                                          List productSizeList =
                                                              [];
                                                          for (var i = 0;
                                                              i <
                                                                  controller
                                                                          .listOfChoose
                                                                          .length -
                                                                      1;
                                                              i++) {
                                                            productSizeList.add(
                                                                controller
                                                                    .listOfChoose[i]);
                                                          }
                                                          controller.showDialogBoxOpen(
                                                              context, true,
                                                              productSizeList:
                                                                  productSizeList);
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              Visibility(
                                                visible: controller.product!
                                                        .value.typeId ==
                                                    'configurable',
                                                child: GestureDetector(
                                                    onTap: () {
                                                      imageDialog(
                                                          LanguageConstants
                                                              .sizeChart.tr,
                                                          controller
                                                              .product!.value
                                                              .getSizeChart(),
                                                          context);
                                                    },
                                                    child: Text(
                                                      LanguageConstants
                                                          .sizeChart.tr,
                                                      style: AppTextStyle
                                                          .textStyleUtilsUnderLine14(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        SizedBox(height: 10.h),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                  ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: whiteColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: BorderSide(
                                                  color: primary,
                                                  width: 2.sp))),
                                      onPressed: controller.productIsInStock()
                                          ? () async {
                                              await controller.addToCart();
                                            }
                                          : null,
                                      icon: SvgPicture.asset(
                                          AppAsset.svgAddtoCart),
                                      label: CommonTextPoppins(
                                        LanguageConstants.addToCart.tr,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: primary,
                                      )),
                                  ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: whiteColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: BorderSide(
                                                  color: primary,
                                                  width: 2.sp))),
                                      onPressed: () {
                                        if (controller.product!.value.isWishList
                                                .value ==
                                            true) {
                                          Get.rawSnackbar(
                                              message:
                                                  'Already added to wishlist');
                                        } else {
                                          controller.wishlistOnTap(context);
                                        }
                                      },
                                      icon: controller.product?.value.isWishList
                                                  .value ==
                                              false
                                          ? SvgPicture.asset(
                                              AppAsset.svgaddTowhishlist)
                                          : const Icon(Icons.favorite,
                                              size: 20, color: primary),
                                      label: CommonTextPoppins(
                                        LanguageConstants.addToWishlist.tr,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: primary,
                                      )),
                                  SizedBox(height: 10.h),
                                  controller.productIsInStock()
                                      ? SizedBox(
                                          height: 40.w,
                                          width: 250.w,
                                          child: CommonThemeButton(
                                              onTap: () async {
                                                controller.buyNowOnTap();
                                              },
                                              title:
                                                  LanguageConstants.buyNow.tr),
                                        )
                                      : InkWell(
                                          onTap: () async {
                                            Get.to(() => OutOfStock());
                                            /*  await controller
                                                  .notifyOnClick();*/
                                          },
                                          child: SizedBox(
                                            width: 160.w,
                                            child: Text(
                                              LanguageConstants
                                                  .notifyMeWhenThisProductIsInStock1
                                                  .tr,
                                              maxLines: 2,
                                              style: AppTextStyle
                                                  .textStyleUtilsUnderLine14(
                                                      fontWeight:
                                                          FontWeight.w300),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 40.h,
                                ),
                                Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        LanguageConstants.recommendation.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                            size: 14.sp),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                controller.itemsData.isEmpty
                                    ? const SizedBox.shrink()
                                    : controller.itemsData[0].imageUrl == null
                                        ? Center(
                                            child: Text(controller
                                                    .itemsData[0].message ??
                                                ''),
                                          )
                                        : const ProductDetailRecommendedProducts(),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ]),
                    ),
              controller.isAddToCartLoading.value
                  ? const ScreenLoading()
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  void imageDialog(text, path, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            insetPadding: const EdgeInsets.all(20),
            contentWidget: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$text',
                        style: AppTextStyle.textStyleUtils500_16(
                            color: const Color(0xff973133)),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 16,
                        ),
                        color: const Color(0xff973133),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    imagePreview('$path');
                  },
                  child: Image.network(
                    '$path',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future showPriceMatch(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            backgroundColor: backGroundColor,
            insetPadding: const EdgeInsets.all(10),
            contentWidget: Stack(children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        LanguageConstants.yourBestPriceAlways.tr,
                        style: AppTextStyle.textStyleUtilsUnderLine14(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        LanguageConstants.ifYourPreferredItemIsLowerMsg.tr,
                        style: AppTextStyle.textStyleUtils400(color: silver),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          showPriceMatchTicketDialog(false);
                        },
                        child: Text(
                          LanguageConstants.simplyLetUsKnowByClickingHere.tr,
                          style: AppTextStyle.textStyleUtilsUnderLine14(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          showPriceMatchTicketDialog(true);
                        },
                        child: Text(
                          LanguageConstants.alreadyMadeYourPurchase.tr,
                          style: AppTextStyle.textStyleUtilsUnderLine14(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesConstants.contactUsScreen);
                        },
                        child: Text(
                          LanguageConstants.dontWorryLetUsKnowByClickingMsg.tr,
                          style: AppTextStyle.textStyleUtilsUnderLine14(
                              color: silver),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesConstants.faqScreen);
                        },
                        child: Text(
                          LanguageConstants.pleaseSeeFAQsByClickingHere.tr,
                          style: AppTextStyle.textStyleUtilsUnderLine14(
                              color: silver),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
          );
        });
  }

  Future imagePreview(String imageUrl) {
    return showGeneralDialog(
      context: Get.context!,
      barrierColor: Colors.black12.withOpacity(0.6),
      // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Stack(
          children: [
            Center(
              child: Hero(
                  tag: "tag",
                  child: PhotoView(
                    customSize: MediaQuery.of(Get.context!).size,
                    initialScale: PhotoViewComputedScale.contained,
                    imageProvider: NetworkImage(imageUrl),
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 1.8,
                  )),
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 80,
                color: Colors.transparent,
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(
                  top: 44,
                  right: 30,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void showPriceMatchTicketDialog(bool isPurchased) {
    controller.firstNameController.text = localStore.userDetail.firstname ?? '';
    controller.lastNameController.text = localStore.userDetail.lastname ?? '';
    controller.productNameController.text =
        controller.product?.value.name ?? '';
    controller.styleController.text = controller.product?.value.sku ?? '';
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CreateTicketForBestPriceMatchDialog(
          phoneNumberController: controller.phoneNumberController,
          emailController:
              TextEditingController(text: localStore.userDetail.email),
          firstNameController: controller.firstNameController,
          lastNameController: controller.lastNameController,
          urlOfImageController: controller.urlOfImageController,
          remarksController: controller.remarksController,
          isProductAvailableController: controller.isProductAvailableController,
          priceController: controller.priceController,
          linkCheaperProductController: controller.linkCheaperProductController,
          urlOfWebsiteController: controller.urlOfWebsiteController,
          styleController: controller.styleController,
          productNameController: controller.productNameController,
          keywordController: controller.keywordController,
          onTap: () async {
            String msg =
                await controller.createMyTicketForCancelItemOrder(isPurchased);
            Get.back();
            showTicketResponseDialog(Get.context!, msg);
          },
        );
      },
    );
  }

  void showTicketResponseDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowTicketResponse(
          message: message,
        );
      },
    );
  }
}

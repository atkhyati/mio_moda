import 'package:avoirchic/app/controller/product_detail_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/screens/product_detail/widgets/prodct_detail_recommended.dart';
import 'package:avoirchic/app/presentation/screens/product_detail/widgets/product_detail_image_carosal.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/screen_loading.dart';
import 'package:avoirchic/app/presentation/screens/product_detail/widgets/create_ticket_best_price_dialog.dart';
import 'package:avoirchic/app/presentation/screens/product_detail/widgets/product_details_outofstoc.dart';
import 'package:avoirchic/app/presentation/screens/product_detail/widgets/show_ticket_response.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/lang_directory/language_constant.dart';
import '../../../main/main.common.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonTextPoppins(LanguageConstants.productDetails.tr),
        elevation: 0,
      ),
      body: Obx(
        () => Stack(
          children: [
            controller.isLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: Color(
                        0xff367587,
                      ),
                      // size: 50.0,
                    ),
                  )
                : SingleChildScrollView(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          indicatorColor: blackColor,
                          dividerColor: Colors.transparent),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // commonAppbar(
                          //     title: "Product Details",
                          //     appBarColor: Colors.transparent),
                          Column(
                            children: [
                              const ProductImageCarosal(),
                              SizedBox(
                                height: 24.w,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //     Text(
                                    //   controller.product!.value.getBrandName(),
                                    //   style: AppTextStyle.textStyleUtils300_16(),
                                    // ),
                                    // const SizedBox(
                                    //   height: 8,
                                    // ),
                                    Text(
                                      controller.product!.value.name ?? '',
                                      style: AppTextStyle.textStyleUtils500(
                                          size: 14.sp),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 20.w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: borderGrey),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: ExpansionTile(
                                        iconColor: primary,
                                        title: CommonTextPoppins(
                                          LanguageConstants.details.tr,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                          color: primary,
                                        ),
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${LanguageConstants.composition.tr} : ${controller.product!.value.getComposition()}",
                                                    style: AppTextStyle
                                                        .textStyleUtils300(
                                                      size: 12.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  if (controller.product!.value
                                                          .getColor() !=
                                                      null)
                                                    Text(
                                                      "${LanguageConstants.color.tr} : ${controller.product!.value.getColor()}",
                                                      style: AppTextStyle
                                                          .textStyleUtils300(
                                                        size: 12.sp,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  SizedBox(
                                                    height: 17.w,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: borderGrey),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: ExpansionTile(
                                        iconColor: primary,
                                        title: CommonTextPoppins(
                                          LanguageConstants.description.tr,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                          color: primary,
                                        ),
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller.product!.value
                                                        .getProductDescription(),
                                                    style: AppTextStyle
                                                        .textStyleUtils300(
                                                      size: 12.sp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 17.w,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.w,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller
                                              .getConvertRegularPriceFromConfigurableProduct(),
                                          style: AppTextStyle.textStyleUtils600(
                                              size: 12.sp),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showPriceMatch(context);
                                          },
                                          child: Text(
                                            LanguageConstants.priceMatch.tr,
                                            style: AppTextStyle
                                                .textStyleUtilsUnderLine(
                                                    size: 12.sp,
                                                    thickness: .6,
                                                    color: primary),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.w,
                                    ),
                                    Text(
                                      "${LanguageConstants.sku.tr.toUpperCase()}: ${controller.product!.value.sku}",
                                      style: AppTextStyle.textStyleUtils500(
                                          size: 14.sp, color: grey6D6D6D),
                                    ),
                                    SizedBox(
                                      height: 20.w,
                                    ),
                                    Visibility(
                                      visible: //true,
                                          controller.product!.value.typeId ==
                                              'configurable',
                                      child: SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Text(
                                            //   LanguageConstants.size.tr,
                                            //  style: AppTextStyle
                                            //       .textStyleUtils300(),
                                            // ),
                                            // const SizedBox(
                                            //   width: 10,
                                            // ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: borderGrey,
                                                    width: 1,
                                                  ),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    items:
                                                        controller.listOfChoose
                                                            .map(
                                                              (value) =>
                                                                  DropdownMenuItem(
                                                                value: value,
                                                                child: Text(
                                                                    value.label ??
                                                                        '',
                                                                    style: AppTextStyle.textStyleUtils400(
                                                                        color:
                                                                            primary,
                                                                        size: 12
                                                                            .sp)),
                                                              ),
                                                            )
                                                            .toList(),
                                                    isExpanded: true,
                                                    hint: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.w),
                                                      child: controller
                                                              .sizeList1.isEmpty
                                                          ? Text(
                                                              LanguageConstants
                                                                  .chooseAnOption
                                                                  .tr,
                                                              style: AppTextStyle
                                                                  .textStyleUtils400(
                                                                      color:
                                                                          primary,
                                                                      size: 12
                                                                          .sp))
                                                          : Text("${controller.sizeList1.first.label}",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: AppTextStyle
                                                                  .textStyleUtils400(
                                                                      color: primary,
                                                                      size: 12.sp)),
                                                    ),
                                                    icon: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        size: 22,
                                                        color: primary,
                                                      ),
                                                    ),
                                                    iconEnabledColor:
                                                        Colors.transparent,
                                                    onChanged:
                                                        (SizeModel? valueList) {
                                                      debugPrint(
                                                          "Val $valueList");
                                                      controller.sizeList1
                                                          .clear();
                                                      controller.sizeList1.add(
                                                          valueList ??
                                                              SizeModel());
                                                      if ((controller
                                                                  .sizeList1
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
                                                        controller
                                                            .showDialogBoxOpen(
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
                                              width: 10.w,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                imageDialog(
                                                  LanguageConstants
                                                      .sizeChart.tr,
                                                  controller.product!.value
                                                      .getSizeChart(),
                                                  context,
                                                );
                                              },
                                              child: Text(
                                                LanguageConstants.sizeChart.tr,
                                                style: AppTextStyle
                                                    .textStyleUtilsUnderLine(
                                                  color: primary,
                                                  size: 12.sp,
                                                  thickness: .6,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    controller.estimatedTime.value ==
                                            "The product is out of stock."
                                        ? const SizedBox()
                                        : SizedBox(
                                            width: MediaQuery.of(
                                                  context,
                                                ).size.width *
                                                0.9,
                                            child: Text(
                                              controller.estimatedTime.value,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyle
                                                  .textStyleUtils300(),
                                            ),
                                          ),
                                    SizedBox(height: 20.w),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: whiteColor,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      side: BorderSide(
                                                          color: primary,
                                                          width: 2.sp))),
                                              onPressed:
                                                  // !controller
                                                  //         .productIsInStock()
                                                  //     ? null
                                                  //     :
                                                  () {
                                                controller.addToCart();
                                              },
                                              icon: SvgPicture.asset(
                                                  AppAsset.svgAddtoCart),
                                              label: CommonTextPoppins(
                                                LanguageConstants.addToCart.tr,
                                                // overflow: TextOverflow.ellipsis,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: primary,
                                              )),
                                        ),
                                        SizedBox(width: 10.w),
                                        SizedBox(
                                          child: ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: whiteColor,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      side: BorderSide(
                                                          color: primary,
                                                          width: 2.sp))),
                                              onPressed: controller
                                                          .product!
                                                          .value
                                                          .isWishList
                                                          .value ==
                                                      false
                                                  ? () async {
                                                      await controller
                                                          .wishlistOnTap(
                                                              context);
                                                    }
                                                  : () {
                                                      Get.rawSnackbar(
                                                          message:
                                                              'Already added to wishlist');
                                                    },
                                              icon: controller.product?.value
                                                          .isWishList.value ==
                                                      false
                                                  ? SvgPicture.asset(
                                                      AppAsset.svgWhishlist)
                                                  : const Icon(Icons.favorite,
                                                      size: 20, color: primary),
                                              label: Center(
                                                child: CommonTextPoppins(
                                                  LanguageConstants
                                                      .addToWishlist.tr,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: primary,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 20.w),
                                    Center(
                                      child: !controller.productIsInStock()
                                          ? InkWell(
                                              onTap: () async {
                                                Get.to(
                                                    () => const OutOfStock());
                                                /* await controller
                                              .notifyWhenAvailableOnTap(
                                                  context);*/
                                              },
                                              child: Text(
                                                  LanguageConstants
                                                      .notifyMeWhenThisProductIsInStock1
                                                      .tr,
                                                  style: AppTextStyle
                                                      .textStyleUtilsUnderLine(
                                                          color: primary,
                                                          size: 12.sp,
                                                          thickness: .6)),
                                            )
                                          : SizedBox(
                                              height: 40.w,
                                              width: 250.w,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              primary,
                                                          elevation: 0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            // side: BorderSide(color: primary,width: 2.sp)
                                                          )),
                                                  onPressed: () async {
                                                    await controller
                                                        .buyNowOnTap();
                                                  },
                                                  child: CommonTextPoppins(
                                                    LanguageConstants.buyNow.tr,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: whiteColor,
                                                  )),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Center(
                                child: Text(
                                  LanguageConstants.recommendation.tr,
                                  style: AppTextStyle.textStyleUtils500(
                                      size: 14.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 230.w,
                                child: controller.itemsData.isEmpty
                                    ? const SizedBox.shrink()
                                    : controller.checkItemDataImageUrlIsEmpty()
                                        ? const ProductDetailRecommendedProducts()
                                        : Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40.w),
                                            child: Center(
                                              child: Text(
                                                controller.itemsData.first
                                                        .message ??
                                                    '',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
            controller.isScreenLoading.value
                ? const ScreenLoading()
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Future showPriceMatch(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            radius: 20,
            elevation: 6.0,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            contentWidget: Stack(
              children: [
                Container(
                  height: 350,
                  color: whiteColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 7,
                        ),
                        child: Text(
                          LanguageConstants.yourBestPriceAlways.tr,
                          style: AppTextStyle.textStyleUtils400(
                              size: 12.sp, color: primary),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          LanguageConstants.ifYourPreferredItemIsLowerMsg.tr,
                          style: AppTextStyle.textStyleUtils400(size: 12.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 7,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                            showPriceMatchTicketDialog(false);
                          },
                          child: Text(
                            LanguageConstants.simplyLetUsKnowByClickingHere.tr,
                            style: AppTextStyle.textStyleUtilsUnderLine(
                                size: 12.sp,
                                color: avoirChickTheme,
                                thickness: .6),
                            //  AppTextStyle.textStyleUtils400(
                            //     size: 12.sp, color: avoirChickTheme),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 7,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                            showPriceMatchTicketDialog(
                              true,
                            );
                          },
                          child: Text(
                            LanguageConstants.alreadyMadeYourPurchase.tr,
                            style: AppTextStyle.textStyleUtilsUnderLine(
                                size: 12.sp, color: primary, thickness: .6),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              RoutesConstants.contactUsScreen,
                            );
                          },
                          child: Text(
                            LanguageConstants
                                .dontWorryLetUsKnowByClickingMsg.tr,
                            style: AppTextStyle.textStyleUtilsUnderLine(
                                size: 12.sp,
                                color: avoirChickTheme,
                                thickness: .6),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.faqScreen, arguments: {
                              "name": LanguageConstants.myOrdersText.tr
                            });
                          },
                          child: Text(
                            LanguageConstants.pleaseSeeFAQsByClickingHere.tr,
                            style: AppTextStyle.textStyleUtilsUnderLine(
                                size: 12.sp,
                                color: avoirChickTheme,
                                thickness: .6),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -10,
                  top: -10,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: appTextColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void showPriceMatchTicketDialog(bool isPurchased) {
    controller.firstNameController.text = localStore.userDetail.firstname ?? '';
    controller.lastNameController.text = localStore.userDetail.lastname ?? '';
    controller.ticketEmailController.text = localStore.userDetail.email ?? '';
    controller.productNameController.text =
        controller.product?.value.name ?? '';
    controller.styleController.text = controller.product?.value.sku ?? '';
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CreateTicketForBestPriceMatchDialog(
          phoneNumberController: controller.phoneNumberController,
          emailController: controller.ticketEmailController,
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
          productDetailController: controller,
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

  Future imageDialog(text, path, BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          insetPadding: const EdgeInsets.all(
            20,
          ),
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
                        color: iconBlueColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        size: 16,
                      ),
                      color: iconBlueColor,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  imagePreview("$path");
                },
                child: Image.network(
                  '$path',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future imagePreview(String imageUrl) {
    return showGeneralDialog(
      context: Get.context!,
      barrierColor: Colors.black12.withOpacity(0.6),
      // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(
        milliseconds: 400,
      ),
      pageBuilder: (_, __, ___) {
        return SafeArea(
          child: Stack(
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
                    top: 30,
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
          ),
        );
      },
    );
  }
}

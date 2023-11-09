import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:veralusso/app/controller/cart/cart_controller.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/presentation/screens/cart/widget/confirmation_dialog_for_remove_cart_product.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../../../main/main.common.dart';

class CartScreen extends GetView<CartController> {
  bool refreshCart = false;
  RxBool isInValid = false.obs;

  @override
  final CartController controller = Get.put(CartController());

  CartScreen({Key? key}) : super(key: key) {
    refreshCart =
        Get.arguments != null && Get.arguments is bool && Get.arguments == true;
    if (refreshCart) {
      controller.refreshCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar:
            refreshCart ? commonAppbar(title: LanguageConstants.cart.tr) : null,
        body: controller.isMainLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Colors.black,
                ),
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // if (controller.donationList.isNotEmpty)
                        //   const Padding(
                        //       padding: EdgeInsets.symmetric(vertical: 14),
                        //       child: DonateDesign()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: textFieldBoarderColor, width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.w),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: CommonTextPoppins(
                                    LanguageConstants.itemText.tr,
                                    color: primary,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                              const Divider(
                                  color: borderGrey, height: 1, thickness: 1),
                              ListView.separated(
                                padding: EdgeInsets.all(20.w),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    controller.cartModel.value.items?.length ??
                                        0,
                                itemBuilder: (BuildContext context, int index) {
                                  final list =
                                      controller.cartModel.value.items?[index];
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.getProductDetail(index);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller
                                                    .getProductDetail(index);
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: SizedBox(
                                                  width: 91.w,
                                                  height: 97.w,
                                                  // padding: const EdgeInsets.only(
                                                  //   bottom: 15,
                                                  // ),
                                                  child: Stack(
                                                    children: [
                                                      controller.getProductImage(
                                                                  index) !=
                                                              ""
                                                          ? Center(
                                                              child:
                                                                  CachedNetworkImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                imageUrl: controller
                                                                    .getProductImage(
                                                                        index),
                                                                //  placeholder: (context, url) => const CircularProgressIndicator(),
                                                                progressIndicatorBuilder:
                                                                    (context,
                                                                            url,
                                                                            downloadProgress) =>
                                                                        Container(
                                                                  child: Lottie
                                                                      .asset(
                                                                    AppAsset
                                                                        .loader,
                                                                  ),
                                                                ),
                                                                errorWidget: (
                                                                  context,
                                                                  url,
                                                                  error,
                                                                ) =>
                                                                    const Icon(
                                                                  Icons.error,
                                                                ),
                                                              ),
                                                            )
                                                          : Expanded(
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                  6.0,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12)),
                                                                child: Text(
                                                                  LanguageConstants
                                                                      .noImageText
                                                                      .tr,
                                                                  style: AppTextStyle
                                                                      .textStyleUtils400(),
                                                                ),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller.getProductName(
                                                      index,
                                                    ),
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 2,
                                                    style: AppTextStyle
                                                        .textStyleUtils400(),
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  Text(
                                                    controller.getSku(index),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: AppStyle
                                                        .textStyleUtils300(
                                                      size: 12.w,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .getProductDetail(
                                                                  index);
                                                        },
                                                        child: Icon(
                                                          Icons.edit_outlined,
                                                          size: 25.r,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 8.w,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          confirmationDialogForRemoveCartProduct(
                                                              index,
                                                              context,
                                                              controller);
                                                        },
                                                        child: Icon(
                                                          Icons.delete_outlined,
                                                          size: 25.r,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 14.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            LanguageConstants.qtyText.tr,
                                            style:
                                                AppTextStyle.textStyleUtils500(
                                                    color: primary,
                                                    size: 14.sp),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (controller.cartModel.value
                                                      .items?[index].qty ==
                                                  1) {
                                                confirmationDialogForRemove(
                                                  index,
                                                  context,
                                                );
                                              } else {
                                                controller
                                                    .postRemoveFromCartData(
                                                  index,
                                                );
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(2.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: primary),
                                              child: Icon(
                                                Icons.remove,
                                                color: whiteColor,
                                                size: 20.r,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            list!.qty.toString(),
                                            style: AppTextStyle
                                                .textStyleUtils400(),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .increaseProductQty(index);
                                              // controller.
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(2.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: primary),
                                              child: Icon(
                                                Icons.add,
                                                color: whiteColor,
                                                size: 20.r,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: 100.w,
                                            child: Text(
                                              LanguageConstants.subTotal.tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.right,
                                              style: AppTextStyle
                                                  .textStyleUtils500(
                                                      color: primary,
                                                      size: 14.sp),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Text(
                                            localStore
                                                .getRegularPriceWithCurrency(
                                                    list.price.toString(),
                                                    list.price.toString(),
                                                    list.qty!),
                                            style:
                                                AppTextStyle.textStyleUtils600(
                                                    color: blackColor,
                                                    size: 14.sp),
                                          ),
                                        ],
                                      ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment
                                      //           .spaceBetween,
                                      //   children: [
                                      //     SizedBox(
                                      //       child: Column(
                                      //         children: [
                                      //           const SizedBox(
                                      //               height: 5),
                                      //           Text(
                                      //             localStore
                                      //                 .getRegularPriceWithCurrency(
                                      //               controller
                                      //                       .cartModel
                                      //                       .value
                                      //                       .items?[
                                      //                           index]
                                      //                       .price
                                      //                       .toString() ??
                                      //                   '',
                                      //               controller
                                      //                       .cartModel
                                      //                       .value
                                      //                       .items?[
                                      //                           index]
                                      //                       .price
                                      //                       .toString() ??
                                      //                   '',
                                      //             ),
                                      //             style: AppTextStyle
                                      //                 .textStyleUtils400(),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     SizedBox(
                                      //       child: Column(
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment
                                      //                 .center,
                                      //         children: [
                                      //           const SizedBox(
                                      //               height: 5),
                                      //           Row(
                                      //             children: [
                                      //               InkWell(
                                      //                 onTap: () {},
                                      //                 child:
                                      //                     const Icon(
                                      //                   Icons.remove,
                                      //                   color:
                                      //                       blackColor,
                                      //                   size: 20,
                                      //                 ),
                                      //               ),
                                      //               const SizedBox(
                                      //                 width: 14,
                                      //               ),
                                      //               Container(
                                      //                 width: 50,
                                      //                 height: 32,
                                      //                 alignment:
                                      //                     Alignment
                                      //                         .center,
                                      //                 child:
                                      //                     CartNumber(
                                      //                   index,
                                      //                 ),
                                      //               ),
                                      //               const SizedBox(
                                      //                 width: 14,
                                      //               ),
                                      //               InkWell(
                                      //                 onTap: () {
                                      //                   controller
                                      //                       .increaseProductQty(
                                      //                     index,
                                      //                   );
                                      //                   // controller.
                                      //                 },
                                      //                 child:
                                      //                     const Icon(
                                      //                   Icons.add,
                                      //                   color:
                                      //                       blackColor,
                                      //                   size: 20,
                                      //                 ),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     SizedBox(
                                      //       child: Column(
                                      //         children: [
                                      //           const SizedBox(
                                      //               height: 5),
                                      //           Text(
                                      //             "${localStore.currentCurrency} ${(list?.price * list?.qty)}",
                                      //             style: AppTextStyle
                                      //                 .textStyleUtils400(),
                                      //           )
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(height: 20);
                                },
                              ),
                              (controller.cartModel.value.items?.isEmpty ??
                                      false)
                                  ? Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 40,
                                        ),
                                        child: Text(
                                          LanguageConstants
                                              .youHaveNoItemsInYourShoppingCart
                                              .tr,
                                          textAlign: TextAlign.center,
                                          style:
                                              AppTextStyle.textStyleUtils400_16(
                                                  color: regularGrey),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        (controller.cartModel.value.items?.isEmpty ?? false)
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 30,
                                ),
                                child: CommonThemeButton(
                                  isOutLined: true,
                                  buttonColor: whiteColor,
                                  textColor: blackColor,
                                  onTap: () {
                                    Get.offAllNamed(
                                        RoutesConstants.dashboardScreen);
                                  },
                                  title: LanguageConstants.continueShopping.tr,
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: textFieldBoarderColor,
                                  ),
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w, vertical: 10.w),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: CommonTextPoppins(
                                            LanguageConstants.summaryText.tr,
                                            color: primary,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                          color: borderGrey,
                                          height: 1,
                                          thickness: 1),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(20.w),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    LanguageConstants
                                                        .subtotalText.tr,
                                                    style: AppStyle
                                                        .textStyleUtils600(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black,
                                                    )),
                                                Text(
                                                  controller.getTotalsData.value
                                                          .getSubTotal() ??
                                                      '',
                                                  style: AppTextStyle
                                                      .textStyleUtils400(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            const Divider(
                                              color: textFieldBoarderColor,
                                              thickness: 1,
                                            ),
                                            controller.showAppliedCoupons.value
                                                ? Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CommonTextPoppins(
                                                            controller.getTotalsData
                                                                        .value
                                                                        .getDiscountName() ==
                                                                    null
                                                                ? 'Discount(${controller.promoCodeController.text})'
                                                                : controller
                                                                    .getTotalsData
                                                                    .value
                                                                    .getDiscountName()!,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            textAlign:
                                                                TextAlign.left,
                                                            color: blackColor,
                                                          ),
                                                          CommonTextPoppins(
                                                            controller
                                                                    .getTotalsData
                                                                    .value
                                                                    .getDiscount() ??
                                                                '',
                                                            fontSize: 14.0,
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                            SizedBox(
                                              height: controller
                                                      .showAppliedCoupons.value
                                                  ? 14
                                                  : 0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  LanguageConstants.taxText.tr
                                                          .capitalizeFirst ??
                                                      '',
                                                  style: AppStyle
                                                      .textStyleUtils600(
                                                    fontWeight: FontWeight.w400,
                                                    size: 14.0,
                                                  ),
                                                ),
                                                Text(
                                                  controller.getTotalsData.value
                                                          .getTax() ??
                                                      '',
                                                  style: AppStyle
                                                      .textStyleUtils400(
                                                    size: 14.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Container(
                                              color: Colors.transparent,
                                              height: 1.2,
                                              width: double.infinity,
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color:
                                                          textFieldBoarderColor)),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: SizedBox(
                                                      child: Form(
                                                          key: controller
                                                              .formKey,
                                                          child: TextFormField(
                                                            cursorColor:
                                                                blackColor,
                                                            controller: controller
                                                                .promoCodeController,
                                                            validator: (value) {
                                                              if (Validators
                                                                      .validateRequired(
                                                                          value?.trim() ??
                                                                              '',
                                                                          '*') !=
                                                                  null) {
                                                                isInValid.value =
                                                                    true;
                                                              } else {
                                                                isInValid.value =
                                                                    false;
                                                              }
                                                              return null;
                                                            },
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              fillColor: Colors
                                                                  .transparent,
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                bottom: 10,
                                                                top: 10,
                                                                left: 3,
                                                              ),
                                                              hintText:
                                                                  LanguageConstants
                                                                      .enterDiscountCodeText
                                                                      .tr,
                                                              hintStyle: AppStyle
                                                                  .textStyleUtils400(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              labelStyle: AppTextStyle
                                                                  .textStyleUtils400(
                                                                      color: Colors
                                                                          .black54),
                                                              errorStyle: AppTextStyle
                                                                  .textStyleUtils400(
                                                                      color: Colors
                                                                          .red),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                        0.0,
                                                                      ),
                                                                      borderSide:
                                                                          BorderSide
                                                                              .none),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                        0.0,
                                                                      ),
                                                                      borderSide:
                                                                          BorderSide
                                                                              .none),
                                                              errorBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                      color:
                                                                          textFieldBoarderColor,
                                                                      style: BorderStyle
                                                                          .solid,
                                                                      width: 2),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12)),
                                                              suffixIcon: null,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide
                                                                        .none,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  0.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                    ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 112.w,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            elevation: 0,
                                                            backgroundColor:
                                                                blackColor,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12))),
                                                        onPressed: () {
                                                          if (controller
                                                              .showAppliedCoupons
                                                              .value) {
                                                            controller
                                                                .deleteAppliedCoupon();
                                                          } else {
                                                            if ((controller
                                                                        .formKey
                                                                        .currentState
                                                                        ?.validate() ??
                                                                    false) &&
                                                                isInValid
                                                                        .value ==
                                                                    false) {
                                                              controller
                                                                  .addCouponsToCartForField();
                                                            }
                                                          }
                                                        },
                                                        child:
                                                            CommonTextPoppins(
                                                          controller
                                                                  .showAppliedCoupons
                                                                  .value
                                                              ? LanguageConstants
                                                                  .removeCoupon
                                                                  .tr
                                                              : LanguageConstants
                                                                  .applyText.tr,
                                                          maxLine: 1,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (isInValid.value)
                                              _handleError(
                                                  context,
                                                  controller.promoCodeController
                                                      .text),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showAllCouponsList();
                                              },
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  LanguageConstants
                                                      .viewCouponList.tr,
                                                  style: AppTextStyle
                                                      .textStyleUtilsUnderLine14(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    LanguageConstants
                                                        .orderTotalText.tr,
                                                    style: AppStyle
                                                        .textStyleUtils600(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      size: 14.0,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    controller
                                                            .getTotalsData.value
                                                            .getGrandTotal() ??
                                                        '',
                                                    style: AppStyle
                                                        .textStyleUtils600(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      size: 14.0,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Obx(
                          () => SizedBox(
                            child: ((controller.cartModel.value.items?.length ??
                                        0) ==
                                    0)
                                ? Container()
                                : CommonThemeButton(
                                    onTap: () async {
                                      await Get.toNamed(
                                        RoutesConstants.checkoutOrderScreen,
                                        arguments: controller.cartModel.value,
                                      );
                                      controller.getTotals();
                                    },
                                    title: LanguageConstants.checkoutText.tr),
                          ),
                        )
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: InkWell(
                        //     child: Container(
                        //       height: 35,
                        //       width: 100,
                        //       alignment: Alignment.center,
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 5.0, vertical: 5.0),
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(20),
                        //           border: Border.all(color: blackColor)),
                        //       child: Text(
                        //         LanguageConstants.checkoutText.tr,
                        //         style: AppTextStyle.textStyleUtils500(),
                        //       ),
                        //     ),
                        //     onTap: () async {},
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  controller.isLoading.value
                      ? AbsorbPointer(
                          absorbing: true,
                          child: Center(
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                              child: const SpinKitThreeBounce(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
      ),
    );
  }

  Widget _handleError(BuildContext context, String value) {
    if (!isInValid.value) {
      return Container();
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        Validators.validateRequired(value.trim(), '*') as String,
        style: AppTextStyle.textStyleUtils400(size: 12.sp, color: Colors.red),
        textAlign: TextAlign.left,
      ),
    );
  }

  void showAllCouponsList() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return CommonAlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          radius: 20,
          contentWidget: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.clear,
                          size: 22,
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    LanguageConstants.allCouponsList.tr,
                    style: AppTextStyle.textStyleUtils400(),
                  ),
                ),
                SizedBox(
                  height: 350.w,
                  width: 250.w,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.couponCode.value.items?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      CouponItems? couponItems =
                          controller.couponCode.value.items?[index];
                      return InkWell(
                        onTap: () {
                          controller.promoCodeController.text =
                              controller.couponCode.value.items?[index].code ??
                                  "";
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 8.0,
                          ),
                          child: Container(
                            height: 40.w,
                            width: 200.w,
                            decoration: BoxDecoration(
                              color: blackColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: blackColor,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: CommonTextPoppins(
                                    '${LanguageConstants.coupons.tr} :',
                                    fontSize: 12.sp,
                                    textAlign: TextAlign.right,
                                    color: whiteColor,
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: CommonTextPoppins(
                                    '  ${couponItems?.code}',
                                    fontSize: 14.sp,
                                    overflow: TextOverflow.ellipsis,
                                    maxLine: 2,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.left,
                                    color: whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future confirmationDialogForRemove(
    int index,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (_) {
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 12,
          backgroundColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.w),
          titleWidget: Text(
            LanguageConstants.removeProduct.tr,
            style: AppTextStyle.textStyleUtils500(),
          ),
          contentWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                LanguageConstants.areYouSureWantToRemoveThisProductFromCart.tr,
                style: AppTextStyle.textStyleUtils400(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonThemeButton(
                    title: LanguageConstants.yes.tr.toUpperCase(),
                    onTap: () {
                      Get.back();
                      if (localStore.customerToken.toString() != "") {
                        controller.deleteCartProductContent(
                          index,
                          1,
                        );
                      } else {
                        controller.deleteCartProductContent(
                          index,
                          2,
                        );
                      }
                    },
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CommonThemeButton(
                    title: LanguageConstants.no.tr.toUpperCase(),
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Future confirmationDialogForAddToWishList(
    int index,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (_) {
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 12,
          backgroundColor: Colors.white,
          titleWidget: Text(
            LanguageConstants.addToWishlist.tr,
            style: AppTextStyle.textStyleUtils400(),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.w),
          contentWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                LanguageConstants.onceYouAddThisProductToWishlistText.tr,
                style: AppTextStyle.textStyleUtils400(),
              ),
              SizedBox(
                height: 20.w,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CommonThemeButton(
                  title: LanguageConstants.ok.tr.toUpperCase(),
                  onTap: () {
                    Get.back();
                    controller.postAddToWishlistData(
                      index,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CartNumber extends GetView<CartController> {
  final int index;
  @override
  final CartController controller = Get.find();

  CartNumber(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        "${controller.cartModel.value.items?[index].qty ?? ''}",
      ),
    );
  }
}

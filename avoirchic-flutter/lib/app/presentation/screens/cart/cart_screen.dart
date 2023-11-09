import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/screen_loading.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:meta_package/utils/validator.dart';

import '../../../controller/cart_controller.dart';
import '../../../theme/app_asset.dart';
import '../../common_widgets/common_widget/common_appbar.dart';

class CartScreen extends GetView<CartController> {
  bool refreshCart = false;
  RxBool isInValid = false.obs;

  CartScreen({Key? key}) : super(key: key) {
    refreshCart =
        Get.arguments != null && Get.arguments is bool && Get.arguments == true;
    if (refreshCart) {
      controller.refreshCart();
    }
  }

  String firstCapitalize(String name) {
    if (name != "") {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBGColor,
      appBar: commonAppbar(
        title: LanguageConstants.shippingCartText.tr,
        appBarColor: Colors.transparent,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(
                    0xff367587,
                  ),
                ),
              )
            : Stack(
                children: [
                  SafeArea(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.all(24.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            children: [
                              cartItem(),
                              !controller.isItemListEmpty()
                                  ? GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(top: 20),
                                        // ),
                                        child: Column(
                                          children: [
                                            const NothigToShowAnimationWidget(),
                                            Text(
                                              "You have no items in your shopping cart.",
                                              textAlign: TextAlign.center,
                                              style: AppTextStyle
                                                  .textStyleUtils400_16(),
                                            ),
                                            SizedBox(
                                              height: 10.w,
                                            ),
                                            CommonThemeButton(
                                              onTap: () {},
                                              title: LanguageConstants
                                                  .continueShopping.tr,
                                            ),
                                            SizedBox(
                                              height: 20.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: 20.w,
                              ),
                              controller.isItemListEmpty()
                                  ? discountWidget(context)
                                  : const SizedBox(),
                              SizedBox(
                                height: 20.h,
                              ),
                              controller.isItemListEmpty()
                                  ? cartSummary()
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: 30.h,
                              ),
                              // if (controller.donationList.isNotEmpty)
                              //   const CartDonation(),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
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

  void showAllCouponsList() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return CommonAlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: avoirChickLightBgTheme,
          radius: 20,
          contentWidget: Padding(
            padding: const EdgeInsets.all(8.0),
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
                  child: Text(LanguageConstants.allCouponsList.tr),
                ),
                SizedBox(
                  height: 400,
                  width: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.couponCode.value.items?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      CouponItems? couponItems =
                          controller.couponCode.value.items?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 8.0,
                        ),
                        child: InkWell(
                          onTap: () {
                            controller.promoCodeController.text =
                                couponItems?.code ?? "";
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: blackColor,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // SizedBox(height: 4,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: CommonTextPoppins(
                                    LanguageConstants.coupons.tr,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: CommonTextPoppins(
                                    couponItems?.code ?? '',
                                    fontSize: 14.0,
                                    overflow: TextOverflow.ellipsis,
                                    maxLine: 2,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
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

  Widget discountWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderGrey)),
          height: 40.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Form(
                  key: controller.formKey,
                  child: TextFormField(
                    cursorColor: appColor,
                    controller: controller.promoCodeController,
                    validator: (value) {
                      if (Validators.validateRequired(
                              value?.trim() ?? '', '*') !=
                          null) {
                        isInValid.value = true;
                      } else {
                        isInValid.value = false;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: LanguageConstants.enterDiscountCoupon.tr,
                      hintStyle:
                          AppTextStyle.textStyleUtils400_12(color: Colors.grey),
                      labelStyle: AppTextStyle.textStyleUtils400(
                          size: 12.sp, color: Colors.black54),
                      errorStyle: AppTextStyle.textStyleUtils400(
                          size: 12.sp, color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          borderSide: BorderSide.none),
                      suffixIcon: null,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.w,
                child: CommonThemeButton(
                  borderRadius: 12,
                  onTap: () {
                    if (controller.showAppliedCoupons.value) {
                      controller.deleteAppliedCoupon();
                    } else {
                      if ((controller.formKey.currentState?.validate() ??
                              false) &&
                          isInValid.value == false) {
                        controller.addCouponsToCartForField();
                      }
                    }
                  },
                  title: controller.showAppliedCoupons.value
                      ? LanguageConstants.removeCouponsolo.tr
                      : LanguageConstants.apply.tr,
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => isInValid.value == true
              ? _handleError(context, controller.promoCodeController.text)
              : Container(),
        ),
        SizedBox(
          height: 10.h,
        ),
        GestureDetector(
          onTap: () {
            showAllCouponsList();
          },
          child: Align(
            alignment: Alignment.center,
            child: Text(
              LanguageConstants.viewCouponList.tr,
              style: AppTextStyle.textStyleUtilsUnderLine(
                  color: primary, thickness: .6, size: 14.sp),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
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

  Widget cartSummary() {
    return Container(
      // padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1.0, color: borderGrey),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CommonTextPoppins(
                LanguageConstants.cartSummaryText.tr,
                color: primary,
                fontSize: 16.sp,
              ),
            ),
          ),
          const Divider(color: borderGrey, height: 1, thickness: 1),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstants.subtotalSpaceText.tr,
                      style: AppTextStyle.textStyleUtils400(),
                    ),
                    Text(
                      controller.getTotalsData.value.getSubTotal() ?? '',
                      style: AppTextStyle.textStyleUtils400(),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.w,
                ),
                controller.showAppliedCoupons.value
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonTextPoppins(
                                controller.getTotalsData.value
                                            .getDiscountName() ==
                                        null
                                    ? '${LanguageConstants.discount.tr}(${controller.promoCodeController.text})'
                                    : controller.getTotalsData.value
                                        .getDiscountName()!,
                                fontSize: 14.0,
                                textAlign: TextAlign.left,
                              ),
                              CommonTextPoppins(
                                controller.getTotalsData.value.getDiscount() ??
                                    '',
                                fontSize: 14.0,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      )
                    : const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstants.taxText.tr,
                      style: AppTextStyle.textStyleUtils400(),
                    ),
                    Text(
                      controller.getTotalsData.value.getTax() ?? '',
                      style: AppTextStyle.textStyleUtils400(),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstants.orderTotalText.tr,
                      style: AppTextStyle.textStyleUtils400(),
                    ),
                    Text(
                      controller.getTotalsData.value.getGrandTotal() ?? '',
                      style: AppTextStyle.textStyleUtils400(),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.w,
                ),
                CommonThemeButton(
                    onTap: () async {
                      await Get.toNamed(
                        RoutesConstants.checkoutOrderScreen,
                        arguments: controller.cartModel.value,
                      );
                      controller.getTotals();
                    },
                    title: LanguageConstants.processCheckOutText.tr)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cartItem() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderGrey, width: 1)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CommonTextPoppins(
                LanguageConstants.itemText.tr,
                color: primary,
                fontSize: 16.sp,
              ),
            ),
          ),
          const Divider(color: borderGrey, height: 1, thickness: 1),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.cartModel.value.items?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final list = controller.cartModel.value.items![index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.w),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(RoutesConstants.productDetailsScreen,
                            parameters: {
                              kRouteParameterProductSkuKey: controller
                                      .cartModel.value.items?[index].sku ??
                                  ''
                            })?.whenComplete(
                          () {
                            controller.getGenerateCart();
                          },
                        );
                      },
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                    left: 10.w,
                                    top: 10.w,
                                  ),
                                  width: 91.w,
                                  height: 97.w,
                                  // padding: const EdgeInsets.only(
                                  //   bottom: 15,
                                  // ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CachedNetworkImage(
                                    width: 65.w,
                                    fit: BoxFit.cover,
                                    imageUrl: controller.getProductImage(index),
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Lottie.asset(
                                      'assets/json/loader.json',
                                      width: 65,
                                    ),
                                    errorWidget: (context, url, error) => Image(
                                      image: AssetImage(AppAsset.logo),
                                    ),
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: cartAction(index, context),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                LanguageConstants.qtyText.tr,
                                style: AppTextStyle.textStyleUtils500(
                                    color: primary, size: 14.sp),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.checkForEmptyDeletation(
                                      index, context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: primary),
                                  child: Icon(Icons.remove,
                                      color: whiteColor, size: 20.r),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                list.qty.toString(),
                                style: AppTextStyle.textStyleUtils400(),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.increaseProductQty(index);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: primary),
                                  child: Icon(Icons.add,
                                      color: whiteColor, size: 20.r),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                LanguageConstants.subTotal.tr,
                                style: AppTextStyle.textStyleUtils500(
                                    color: primary, size: 14.sp),
                              ),
                              SizedBox(width: 15.w),
                              Text(
                                '${controller.cartModel.value.currency?.quoteCurrencyCode ?? ''} ${controller.getRegularPriceFun2(index)}',
                                style: AppTextStyle.textStyleUtils600(
                                    color: blackColor, size: 14.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget cartAction(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            firstCapitalize(
              controller.cartModel.value.items?[index].name?.toString() ?? '',
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: AppTextStyle.textStyleUtils500(size: 14.sp),
          ),
        ),
        Text(
          controller.cartModel.value.items?[index].sku?.toString() ?? '',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: AppTextStyle.textStyleUtils400(),
        ),
        Row(
          children: [
            const Spacer(),
            InkWell(
                onTap: () {
                  Get.toNamed(RoutesConstants.productDetailsScreen,
                      parameters: {
                        kRouteParameterProductSkuKey:
                            controller.cartModel.value.items?[index].sku ?? ''
                      })?.whenComplete(() {
                    controller.getGenerateCart();
                  });
                },
                child: const Icon(Icons.edit_outlined)),
            InkWell(
                onTap: () {
                  confirmationDialogForRemoveCartProduct(index, context);
                },
                child: const Icon(Icons.delete_outlined))
          ],
        )
      ],
    );
  }

  Future<void> confirmationDialogForRemoveCartProduct(
      int index, BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return CommonAlertDialog(
            elevation: 6.0,
            radius: 10,
            titleWidget: Text(LanguageConstants.areYouSureYouWantToRemove.tr,
                style: AppTextStyle.textStyleUtils700_16()),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            contentWidget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    LanguageConstants
                        .areYouSureWantToRemoveThisProductFromCart.tr,
                    style: AppTextStyle.textStyleUtils400_16()),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: appColor),
                        child: Text(
                          LanguageConstants.yes.tr,
                          style: AppTextStyle.textStyleUtils400(
                              size: 15, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        controller.deleteProductFun(index);
                      },
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: appColor),
                        child: Text(
                          LanguageConstants.no.tr,
                          style: AppTextStyle.textStyleUtils400(
                              size: 15, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

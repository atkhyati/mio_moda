import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/cart/cart_controller.dart';
import 'package:suvandnat/app/controller/wishlist/wishlist_controller.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/colors.dart';

class ProductDetailDialog {
  static void showDialogBox(
    BuildContext context,
    String productName,
    String customImage,
  ) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          contentPadding: const EdgeInsets.all(14.0),
          backgroundColor: backGroundColor,
          contentWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: const Icon(
                      Icons.clear,
                      size: 22,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
              Text(
                LanguageConstants.itemInCartText.tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: AppConstants.fontPoppins,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      height: 200.w,
                      width: 200.w,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            customImage,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "$productName  ${LanguageConstants.addedToYourCart.tr}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppConstants.fontPoppins,
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonThemeButton(
                            onTap: () async {
                              bool res = await Get.delete<CartController>();
                              if (res) {
                                Get.toNamed<dynamic>(RoutesConstants.cartScreen,
                                    arguments: true);
                              }
                            },
                            title: LanguageConstants.viewCartText.tr,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          CommonThemeButton(
                            onTap: () async {
                              Get.offAllNamed(RoutesConstants.dashboardScreen);
                            },
                            title: LanguageConstants.continueShoppingText.tr,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showWishlistDialog(
      BuildContext context, String product, String customImage,
      {WishlistController? wishlistController}) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          backgroundColor: backGroundColor,
          contentWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: const Icon(
                      Icons.clear,
                      size: 22,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.only(left: 8),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(
                        14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            customImage,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  LanguageConstants.wishListText.tr,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontPoppins,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                  "$product",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppConstants.fontPoppins,
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CommonThemeButton(
                                title: LanguageConstants.viewWishListText.tr,
                                onTap: () {
                                  debugPrint("click");
                                  if (wishlistController != null) {
                                    wishlistController.refreshWishlist();
                                  }
                                  Get.toNamed(
                                    RoutesConstants.wishlistScreen,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              CommonThemeButton(
                                onTap: () {
                                  Navigator.pop(
                                    context,
                                  );
                                },
                                title:
                                    LanguageConstants.continueShoppingText.tr,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

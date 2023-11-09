import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/cart/cart_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

import '../../../../main/main.common.dart';

Future confirmationDialogForRemoveCartProduct(
    int index, BuildContext context, CartController controller) async {
  showDialog(
    context: context,
    builder: (_) {
      return CommonAlertDialog(
        elevation: 6.0,
        radius: 12,
        backgroundColor: Colors.white,
        titleWidget: Text(
          LanguageConstants.removeProduct.tr,
          style: AppTextStyle.textStyleUtils500(),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.w),
        contentWidget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LanguageConstants.areYouSureWantToRemoveThisProductFromCart.tr,
              style: AppTextStyle.textStyleUtils400(),
            ),
            SizedBox(height: 20.w,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonThemeButton(
            title:
                LanguageConstants.yes.tr.toUpperCase(),
               
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
          SizedBox(width: 20.w,),
          CommonThemeButton(
            title:
                LanguageConstants.no.tr.toUpperCase(),
               
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

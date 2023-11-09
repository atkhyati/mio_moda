import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCouponSuccessfullyApplied extends StatelessWidget {
  const CartCouponSuccessfullyApplied({
    Key? key,
    required this.couponCode,
    required this.savedValue,
  }) : super(key: key);
  final String couponCode;
  final String savedValue;

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: avoirChickLightBgTheme,
      radius: 20,
      contentWidget: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.close,
                  size: 22,
                  color: Colors.transparent,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.close,
                      size: 22,
                      color: avoirChickTheme,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                '$couponCode ${LanguageConstants.cOUPONAPPLIEDSUCCESSFULLYYOUSAVED.tr}${localStore.currentCurrency} $savedValue ${LanguageConstants.oNTHISORDER.tr}',
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              child: CommonThemeButton(
                onTap: () {
                  Get.back();
                },
                title: LanguageConstants.okay.tr,
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

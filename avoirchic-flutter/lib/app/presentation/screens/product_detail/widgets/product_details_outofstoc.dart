import 'package:avoirchic/app/controller/product_detail_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../common_widgets/common_widget/common_theme_button.dart';

class OutOfStock extends GetView<ProductDetailController> {
  const OutOfStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        return controller.isScreenLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Colors.black,
                ),
              )
            : Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConstants.thankYou.tr,
                        style: AppTextStyle.textStyleUtilsUnderLine20(),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () async {
                            List productSizeList = [];
                            for (var i = 0;
                                i < controller.listOfChoose.length - 1;
                                i++) {
                              productSizeList.add(controller.listOfChoose[i]);
                            }
                            await controller.notifyWhenAvailableOnTap(context,
                                productSizeList: productSizeList);
                          },
                          child: Text.rich(
                            TextSpan(
                                text: LanguageConstants
                                    .notifyMeWhenThisProductIsInStock.tr,
                                style: AppTextStyle.textStyleUtils400_12(),
                                children: <InlineSpan>[
                                  const TextSpan(text: "  "),
                                  TextSpan(
                                      text: LanguageConstants.myTicket.tr,
                                      style: AppTextStyle.textStyleUtils400()
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline))
                                ]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CommonThemeButton(
                        onTap: () {
                          Get.back<dynamic>();
                        },
                        title: LanguageConstants.continueShopping.tr,
                      )
                    ],
                  ),
                ],
              );
      }),
    );
  }
}

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';

import '../../../../core/const/app_style.dart';

class OutOfStock extends GetView<ProductDetailController> {
  const OutOfStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: commonAppbar(title: ""),
      body: Obx(() {
        return controller.isAddToCartLoading.value
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
                      CommonTextOpenSans(
                        LanguageConstants.thankYou.tr,
                        textAlign: TextAlign.center,
                        color: Colors.black87,
                        fontSize: 16.0.sp,
                        height: 1.4,
                        decoration: TextDecoration.underline,
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
                            await controller.notifyOnClick(
                                productSizeList: productSizeList);
                          },
                          child: Text.rich(
                            TextSpan(
                                text: LanguageConstants
                                    .notifyMeWhenThisProductIsInStock.tr,
                                style:
                                    AppStyle.textStyleUtils400(size: 12.0.sp),
                                children: <InlineSpan>[
                                  const TextSpan(text: "  "),
                                  TextSpan(
                                    text: LanguageConstants.myTicket.tr,
                                    style: AppStyle.textStyleUtils400(
                                            size: 12.0.sp)
                                        .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                  )
                                ]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 160,
                        height: 41,
                        child: ElevatedButton(
                          onPressed: () {
                            FocusScope.of(Get.context!)
                                .requestFocus(FocusNode());
                            Get.back<dynamic>();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            backgroundColor: appColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: CommonTextOpenSans(
                              LanguageConstants.continueShopping.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
      }),
    );
  }
}

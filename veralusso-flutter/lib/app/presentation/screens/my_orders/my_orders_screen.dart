import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:veralusso/app/controller/my_orders/my_orders_controller.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'widgets/my_order_widget.dart';

class MyOrdersScreen extends GetView<MyOrdersController> {
  @override
  final MyOrdersController controller = Get.find();

  MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.white,
      appBar: commonAppbar(title: LanguageConstants.myOrdersText.tr),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: blackColor,
                ),
              )
            : SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    controller.myOrdersModel.value.items == null ||
                            (controller.myOrdersModel.value.items?.isEmpty ??
                                false)
                        ? Container(
                            alignment: Alignment.center,
                            height: Get.height / 1.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const NothigToShowAnimationWidget(),
                                SizedBox(
                                  height: 20.w,
                                ),
                                Text(
                                  LanguageConstants.youHaveNoOrders.tr,
                                  style: AppTextStyle.normalRegular14,
                                ),
                                SizedBox(
                                  height: 20.w,
                                ),
                                CommonThemeButton(
                                  onTap: () {
                                    Get.offAndToNamed(
                                        RoutesConstants.dashboardScreen);
                                  },
                                  title: LanguageConstants.continueShopping.tr,
                                ),
                                SizedBox(
                                  height: 60.w,
                                ),
                              ],
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 2, color: textFieldBoarderColor)),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),
                                  height: 40.w,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(11),
                                        topRight: Radius.circular(11),
                                      )),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      LanguageConstants.itemOrder.tr,
                                      style: AppStyle.textStyleUtils400(
                                          size: 14.sp, color: primary),
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: borderGrey,
                                  height: 2,
                                  thickness: 2,
                                ),
                                ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      height: 2,
                                      color: borderGrey,
                                      thickness: 2,
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    ParentItemElement item = (controller
                                                .myOrdersModel
                                                .value
                                                .items?[index]
                                                .items
                                                ?.isEmpty ==
                                            true)
                                        ? ParentItemElement()
                                        : controller.myOrdersModel.value
                                                .items?[index].items?.first ??
                                            ParentItemElement();
                                    MyOrdersDataItem? orderData = controller
                                        .myOrdersModel.value.items?[index];
                                    return MyOrderWidget(item, orderData);
                                  },
                                  itemCount: controller
                                          .myOrdersModel.value.items?.length ??
                                      0,
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:veralusso/app/controller/my_orders/my_orders_controller.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'order_data_widget.dart';

class MyOrderWidget extends GetView<MyOrdersController> {
  final ParentItemElement? item;
  final MyOrdersDataItem? orderData;
  @override
  final MyOrdersController controller = Get.find();

  MyOrderWidget(this.item, this.orderData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesConstants.orderDetailsScreen,
            arguments: [item, orderData]);
      },
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: item!.extensionAttributess?.productImage ?? '',
                    fit: BoxFit.cover,
                    height: 100.w,
                    width: 95.w,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item!.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.textStyleUtils500(size: 14.sp),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    RichText(
                      text: TextSpan(
                        text: LanguageConstants.quantity.tr,
                        style: AppTextStyle.textStyleUtils400(size: 12.sp),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' : ',
                              style:
                                  AppTextStyle.textStyleUtils400(size: 12.sp)),
                          TextSpan(
                              text: item!.qtyOrdered != null
                                  ? item!.qtyOrdered.toString()
                                  : '',
                              style:
                                  AppTextStyle.textStyleUtils400(size: 12.sp)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    RichText(
                      text: TextSpan(
                        text: LanguageConstants.price.tr,
                        style: AppTextStyle.textStyleUtils400(size: 12.sp),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' : ',
                              style:
                                  AppTextStyle.textStyleUtils400(size: 12.sp)),
                          TextSpan(
                              text:
                                  '${orderData?.subtotal?.toString() ?? '-'} ${orderData?.orderCurrencyCode?.toString() ?? ''}',
                              style:
                                  AppTextStyle.textStyleUtils400(size: 12.sp)),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
            const SizedBox(height: 10),
            OrderDataWidget(
              text: LanguageConstants.orderIdTitle.tr,
              data: orderData?.incrementId?.toString() ?? '',
            ),

            const SizedBox(height: 10),
            OrderDataWidget(
              text: LanguageConstants.shipHereText.tr,
              data:
                  '${orderData?.billingAddress?.firstname ?? ''} ${orderData?.billingAddress?.lastname ?? ''}',
            ),
            const SizedBox(height: 10),

            OrderDataWidget(
                text: LanguageConstants.status.tr,
                data: orderData?.status.toString() ?? ''),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonThemeButton(
                  buttonColor: primary,
                  onTap: () {
                    controller.onReturnTap(orderData);
                  },
                  title: LanguageConstants.returnItemText.tr,
                ),
                SizedBox(
                  width: 30.w,
                ),
                CommonThemeButton(
                  buttonColor: primary,
                  onTap: () {
                    controller.onCancelTap(orderData);
                  },
                  title: LanguageConstants.cancel.tr,
                )
              ],
            ),
            // const SizedBox(height: 20),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       width: Get.width / 3,
            //       child: Text(
            //         LanguageConstants.viewDetailsText.tr,
            //         style: AppStyle.textStyleUtils400(size: 12.sp),
            //       ),
            //     ),
            //     Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Container(
            //           color: Colors.transparent,
            //           child: const Icon(
            //             Icons.remove_red_eye_outlined,
            //             size: 20,
            //             color: blackColor,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

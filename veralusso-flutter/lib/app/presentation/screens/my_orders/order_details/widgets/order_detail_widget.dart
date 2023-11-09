import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_orders/order_details/order_details_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class OrderDetailWidget extends GetView<OrderDetailsController> {
  final int index;
  @override
  final OrderDetailsController controller = Get.find();

  OrderDetailWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 15.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: controller.getProductImage(index),
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
                        controller.myOrdersDataItem?.items?[index].name
                                .toString()
                                .capitalizeFirst ??
                            '',
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
                                style: AppTextStyle.textStyleUtils400(
                                    size: 12.sp)),
                            TextSpan(
                                text: controller
                                    .myOrdersDataItem?.items?[index].qtyOrdered
                                    .toString(),
                                style: AppTextStyle.textStyleUtils400(
                                    size: 12.sp)),
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
                                style: AppTextStyle.textStyleUtils400(
                                    size: 12.sp)),
                            TextSpan(
                                text: controller
                                        .myOrdersDataItem?.items?[index].price
                                        ?.toString() ??
                                    '',
                                style: AppTextStyle.textStyleUtils400(
                                    size: 12.sp)),
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 20.w,
              ),
              Row(
                children: [
                  CommonTextPoppins(
                    LanguageConstants.subTotal.tr,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  const Spacer(),
                  CommonTextPoppins(
                    controller.myOrdersDataItem?.items?[index].rowTotal
                            ?.toString() ??
                        '',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: primary,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CommonTextPoppins(
                    controller.getOrderCurrencyCode(index),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: primary,
                  ),
                ],
              ),
              SizedBox(
                height: 20.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonThemeButton(
                    buttonColor: primary,
                    onTap: () {
                      controller.returnOnTap(index);
                    },
                    title: LanguageConstants.returnItemText.tr,
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  CommonThemeButton(
                    buttonColor: primary,
                    onTap: () {
                      controller.cancelOnTap(index);
                    },
                    title: LanguageConstants.cancel.tr,
                  )
                ],
              ),
              SizedBox(
                height: 10.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

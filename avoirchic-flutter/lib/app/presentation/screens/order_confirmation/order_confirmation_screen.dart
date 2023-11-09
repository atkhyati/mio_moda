// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';

import 'package:avoirchic/app/core/utils/date_utils.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';

import '../../../controller/order_confirmation_controller.dart';
import '../../../core/utils/app_routes.dart';

class OrderConfirmationScreen extends GetView<OrderConfirmationController> {
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(
                RoutesConstants.dashboardScreen,
              );
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Obx(
        () => Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
            ),
            controller.isLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: blue367587,
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            LanguageConstants.orderConfirm.tr,
                            style: AppTextStyle.textStyleUtils500(size: 18.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: LanguageConstants.orderIdTitle.tr,
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 15.0),
                                ),
                                TextSpan(
                                  text: controller.orderConfirmationData.value
                                          .incrementId
                                          ?.toString() ??
                                      '',
                                  style:
                                      AppTextStyle.textStyleUtils500(size: 15),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            LanguageConstants.orderContain.tr,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.textStyleUtils400(size: 15.0),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: LanguageConstants.orderDateTitle.tr,
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 16.0),
                                ),
                                TextSpan(
                                  text: getDate(),
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 16.0),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      LanguageConstants.expectedShippingDate.tr,
                                  style: AppTextStyle.textStyleUtils400_16(),
                                ),
                                TextSpan(
                                  text: controller.orderConfirmationData.value
                                      .extensionAttributes?.estimatedShipping
                                      .toString(),
                                  style: AppTextStyle.textStyleUtils400_16(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: borderGrey, width: 2)),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10.w),
                                  height: 40.w,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      color: blueTileColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(11),
                                        topRight: Radius.circular(11),
                                      )),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      LanguageConstants.itemText.tr,
                                      style: AppTextStyle.textStyleUtils500(
                                          color: primary, size: 14.sp),
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
                                    return (controller
                                                .orderConfirmationData
                                                .value
                                                .items?[index]
                                                .parentItemId ==
                                            null)
                                        ? Divider(
                                            color: controller
                                                        .orderConfirmationData
                                                        .value
                                                        .items!
                                                        .length ==
                                                    (index - 1)
                                                ? Colors.transparent
                                                : borderGrey,
                                            height: 2,
                                            thickness: 2,
                                          )
                                        : const SizedBox();
                                  },
                                  itemCount: controller.orderConfirmationData
                                          .value.items?.length ??
                                      0,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    Items? items = controller
                                        .orderConfirmationData
                                        .value
                                        .items?[index];
                                    return (controller
                                                .orderConfirmationData
                                                .value
                                                .items?[index]
                                                .parentItemId ==
                                            null)
                                        ? Padding(
                                            padding: EdgeInsets.all(15.w),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Container(
                                                        height: 105,
                                                        width: 100,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: Image.network(
                                                          items?.extensionAttributess
                                                                  ?.productImage ??
                                                              '',
                                                          height: 100.w,
                                                          width: 95.w,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15.w,
                                                    ),
                                                    Expanded(
                                                        child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          items?.name
                                                                  .toString()
                                                                  .capitalizeFirst ??
                                                              '',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: AppTextStyle
                                                              .textStyleUtils500(
                                                                  size: 14.sp),
                                                        ),
                                                        SizedBox(
                                                          height: 8.w,
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            text:
                                                                LanguageConstants
                                                                    .quantity
                                                                    .tr,
                                                            style: AppTextStyle
                                                                .textStyleUtils400(
                                                                    size:
                                                                        12.sp),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                  text: ' : ',
                                                                  style: AppTextStyle
                                                                      .textStyleUtils400(
                                                                          size:
                                                                              12.sp)),
                                                              TextSpan(
                                                                  text: items
                                                                          ?.qtyOrdered
                                                                          ?.toString() ??
                                                                      '',
                                                                  style: AppTextStyle
                                                                      .textStyleUtils400(
                                                                          size:
                                                                              12.sp)),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8.w,
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            text:
                                                                LanguageConstants
                                                                    .price.tr,
                                                            style: AppTextStyle
                                                                .textStyleUtils400(
                                                                    size:
                                                                        12.sp),
                                                            children: <
                                                                TextSpan>[
                                                              TextSpan(
                                                                  text: ' : ',
                                                                  style: AppTextStyle
                                                                      .textStyleUtils400(
                                                                          size:
                                                                              12.sp)),
                                                              TextSpan(
                                                                  text:
                                                                      '${controller.orderConfirmationData.value.orderCurrencyCode ?? ''} ${items?.price?.toString() ?? '0'}',
                                                                  style: AppTextStyle
                                                                      .textStyleUtils400(
                                                                          size:
                                                                              12.sp)),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ))
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      LanguageConstants
                                                          .subTotal.tr,
                                                      style: AppTextStyle
                                                          .textStyleUtils400(
                                                              size: 12.sp),
                                                    ),
                                                    Text(
                                                      '${controller.orderConfirmationData.value.orderCurrencyCode ?? ''} ${items?.price?.toString() ?? '0'}',
                                                      style: AppTextStyle
                                                          .textStyleUtils400(
                                                              size: 12.sp),
                                                    )
                                                  ],
                                                ),
                                                // Container(
                                                //   padding:
                                                //       const EdgeInsets.symmetric(
                                                //           horizontal: 20,
                                                //           vertical: 20),
                                                //   margin:
                                                //       const EdgeInsets.symmetric(
                                                //           horizontal: 20),
                                                //   decoration: BoxDecoration(
                                                //     border: Border.all(
                                                //       color: blue367587,
                                                //       width: 2,
                                                //     ),
                                                //   ),
                                                //   child: Column(
                                                //     children: [
                                                //       Container(
                                                //         height: 100,
                                                //         width: 100,
                                                //         padding:
                                                //             const EdgeInsets.all(
                                                //                 8),
                                                //         decoration: BoxDecoration(
                                                //           border: Border.all(
                                                //             color: blue367587,
                                                //             width: 1.4,
                                                //           ),
                                                //         ),
                                                //         child: Column(
                                                //           mainAxisSize:
                                                //               MainAxisSize.min,
                                                //           children: [
                                                //             Row(
                                                //               mainAxisAlignment:
                                                //                   MainAxisAlignment
                                                //                       .spaceBetween,
                                                //               children: [
                                                //                 Image.asset(
                                                //                   AppAsset.logo,
                                                //                   width: 35,
                                                //                 ),
                                                //               ],
                                                //             ),
                                                //             const SizedBox(
                                                //                 height: 10),
                                                //             Image.network(
                                                //               items?.extensionAttributess
                                                //                       ?.productImage ??
                                                //                   '',
                                                //               height: 60,
                                                //               fit: BoxFit.cover,
                                                //               errorBuilder: (
                                                //                 BuildContext
                                                //                     context,
                                                //                 Object error,
                                                //                 StackTrace?
                                                //                     stackTrace,
                                                //               ) {
                                                //                 return Image
                                                //                     .asset(
                                                //                   AppAsset.logo,
                                                //                 );
                                                //               },
                                                //             ),
                                                //           ],
                                                //         ),
                                                //       ),
                                                //       const SizedBox(height: 10),
                                                //       Text(
                                                //         items?.name
                                                //                 .toString()
                                                //                 .capitalizeFirst ??
                                                //             '',
                                                //         style: AppTextStyle
                                                //             .textStyleUtils400(
                                                //                 size: 20),
                                                //       ),
                                                //       const SizedBox(height: 30),
                                                //       Row(
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .spaceBetween,
                                                //         children: [
                                                //           Text(
                                                //             LanguageConstants
                                                //                 .price.tr,
                                                //             style: AppTextStyle
                                                //                 .textStyleUtils400(
                                                //                     size: 15,
                                                //                     color: const Color(
                                                //                         0xFF6D6D6D)),
                                                //           ),
                                                //           Text(
                                                //             "       ${LanguageConstants.quantity.tr}",
                                                //             style: AppTextStyle
                                                //                 .textStyleUtils400(
                                                //                     size: 15,
                                                //                     color: const Color(
                                                //                         0xFF6D6D6D)),
                                                //           ),
                                                //           Text(
                                                //             LanguageConstants
                                                //                 .subTotal.tr,
                                                //             style: AppTextStyle
                                                //                 .textStyleUtils400(
                                                //                     size: 15,
                                                //                     color: const Color(
                                                //                         0xFF6D6D6D)),
                                                //           )
                                                //         ],
                                                //       ),
                                                //       const Divider(
                                                //         height: 9,
                                                //         color: Color(0xffCEAEA0),
                                                //         thickness: 1,
                                                //       ),
                                                //       Row(
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .spaceBetween,
                                                //         children: [
                                                //           Text(
                                                //             '${controller.orderConfirmationData.value.orderCurrencyCode ?? ''} ${items?.price?.toString() ?? '0'}',
                                                //             style: AppTextStyle
                                                //                 .textStyleUtils400(),
                                                //           ),
                                                //           Text(
                                                //             items?.qtyOrdered
                                                //                     ?.toString() ??
                                                //                 '',
                                                //             style: AppTextStyle
                                                //                 .textStyleUtils400(),
                                                //           ),
                                                //           Text(
                                                //             '${controller.orderConfirmationData.value.orderCurrencyCode ?? ''} ${items?.price?.toString() ?? '0'}',
                                                //             style: AppTextStyle
                                                //                 .textStyleUtils400(),
                                                //           )
                                                //         ],
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          )
                                        : const SizedBox();
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CommonThemeButton(
                            onTap: () {
                              controller.showOrderTrackingDialogBox(context);
                            },
                            title: LanguageConstants.trackOrderText.tr,
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          AddressTileWidget(
                            title: LanguageConstants.shippingAddressText.tr,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getAddress(),
                                  style: AppTextStyle.textStyleUtils400_16(),
                                ),
                                Text(
                                  "T: ${controller.address.value.telephone}",
                                  style: AppTextStyle.textStyleUtils400_16(
                                    color: grey6D6D6D,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          AddressTileWidget(
                            title: LanguageConstants.billingAddress.tr,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getBillingAddress(),
                                  style: AppTextStyle.textStyleUtils400_16(),
                                ),
                                Text(
                                  "T: ${controller.orderConfirmationData.value.billingAddress?.telephone}",
                                  style: AppTextStyle.textStyleUtils400_16(
                                    color: grey6D6D6D,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          AddressTileWidget(
                            title: LanguageConstants.paymentMethod.tr,
                            child: Text(
                              controller.orderConfirmationData.value.payment
                                      ?.additionalInformation?.first ??
                                  '',
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                          const SizedBox(height: 40),
                          CommonThemeButton(
                            onTap: () {
                              Get.offAllNamed(
                                RoutesConstants.dashboardScreen,
                              );
                            },
                            title: LanguageConstants.continueShopping.tr,
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  String getAddress() {
    return "${controller.address.value.street![0]}\n\n${controller.address.value.city}, ${controller.address.value.region}, ${controller.address.value.postcode}";
  }

  String getBillingAddress() {
    return "${controller.orderConfirmationData.value.billingAddress?.street![0]}\n\n${controller.orderConfirmationData.value.billingAddress?.city}, ${controller.orderConfirmationData.value.billingAddress?.postcode}";
  }

  String getDate() {
    DateTime? date = controller.dateVal.value.isNotEmpty
        ? DateParseUtils.dateTimeFromJsonUTC(
            controller.dateVal.value,
          )
        : null;
    return date != null ? DateFormat.yMMMMd().format(date) : '';
  }
}

class AddressTileWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const AddressTileWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderGrey, width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w),
            height: 40.w,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: blueTileColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11),
                  topRight: Radius.circular(11),
                )),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                LanguageConstants.contactInfo.tr,
                style:
                    AppTextStyle.textStyleUtils500(color: primary, size: 14.sp),
              ),
            ),
          ),
          const Divider(
            color: borderGrey,
            height: 2,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [child],
            ),
          )
        ],
      ),
    );
  }
}

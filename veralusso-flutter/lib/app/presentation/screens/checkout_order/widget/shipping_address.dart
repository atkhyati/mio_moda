import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/checkout_order/multi_address_model.dart';
import 'package:veralusso/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_divider.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'guest_shipping_address_form.dart';
import 'new_address_button.dart';

class ShippingAddress extends GetView<CheckoutOrderController> {
  @override
  final CheckoutOrderController controller = Get.find();

  ShippingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.multiAddressModel.value.addresses == null ||
            (controller.multiAddressModel.value.addresses?.isEmpty ?? false)
        ? localStore.isGuest
            ? GuestShippingAddressForm()
            : Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  NewAddressButton(),
                ],
              )
        : SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.w),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        controller.multiAddressModel.value.addresses?.length,
                    itemBuilder: (context, index) {
                      Address? address =
                          controller.multiAddressModel.value.addresses?[index];
                      return Obx(() => Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonTextMontserrat(
                                          "${address?.firstname} ${address?.lastname} ${address?.street?.join(",")} ${address?.city} ${address?.postcode}",
                                          textAlign: TextAlign.start,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.0,
                                          maxLine: 5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        CommonTextMontserrat(
                                          '${address?.telephone}',
                                          textAlign: TextAlign.start,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.0,
                                          maxLine: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 60.0,
                                  ),
                                  CommonThemeButton(
                                    isOutLined: true,
                                    buttonColor: whiteColor,
                                    textColor: blackColor,
                                    title:
                                        LanguageConstants.shipHereText.tr,
                                     
                                    onTap: () async {
                                      await controller.shipHereOnTap(
                                          index, address);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              (controller.multiAddressModel.value.addresses
                                                  ?.length ??
                                              0) -
                                          1 ==
                                      index
                                  ? Container()
                                  : Column(
                                      children: [
                                        CommonDivider(
                                          color: borderGrey,
                                          width: Get.width,
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                      ],
                                    ),
                            ],
                          ));
                    }),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: CommonThemeButton(
                        onTap: () {
                          controller.showDialogAddress(context);
                        },
                        title:
                          LanguageConstants.newAddressText.tr,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ));
  }
}

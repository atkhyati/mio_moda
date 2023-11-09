import 'package:avoirchic/app/controller/wishlist_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../theme/app_asset.dart';
import '../../../../theme/app_text_style.dart';

class WishlistDataItem extends GetView<WishlistController> {
  const WishlistDataItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: .50,
      ),
      itemBuilder: (_, index) {
        ItemProduct? item = controller.wishItemModel?.value.items?[index];
        return GestureDetector(
          onTap: () {
            Get.toNamed(RoutesConstants.productDetailsScreen, parameters: {
              kRouteParameterProductSkuKey:
                  controller.wishItemModel?.value.items?[index].product?.sku ??
                      ''
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: appBorderColor,
                      width: 6,
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: controller.productImage(index),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    memCacheWidth: 200,
                    memCacheHeight: 150,
                  ),
                ),
              ),
              // Container(
              //   // height: 100.w,
              //   // width: 100.w,

              //   alignment: Alignment.center,
              //   // padding: const EdgeInsets.all(
              //   //   14,
              //   // ),
              //   decoration: BoxDecoration(
              //     color: Colors.red,
              //     border: Border.all(
              //       color: const Color(0xFFbcbcbc),
              //     ),
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: NetworkImage(
              //         controller.productImage(index),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 8,
              ),
              Text(
                item?.product?.name ?? '',
                maxLines: 2,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis, fontSize: 16),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                controller.getProductPrice(index),
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils400_14(),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () async {
                        controller.getGenerateCart(index);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor: appTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: CommonTextOpenSans(
                        LanguageConstants.addTOCart.tr,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 10.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Container(
                    height: 16,
                    width: 32,
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: item?.product?.countController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.done,
                      style: AppTextStyle.textStyleUtils400(),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(left: 5, right: 5, bottom: 10)),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4), // for mobile
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.confirmationDialogForRemove(index, context);
                    },
                    child: Image(
                      image: AssetImage(AppAsset.deleteIcon),
                      color: blackColor,
                      height: 18,
                    ),
                  ),
                ],
              ),
              Obx(
                () => Visibility(
                  visible: controller
                          .wishItemModel?.value.items?[index].product?.typeId ==
                      'configurable',
                  child: Container(
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: backGroundColor,
                      border: Border.all(color: avoirChickLightBgTheme),
                    ),
                    child: item?.product?.sizeList?.isNotEmpty == true
                        ? DropdownButtonHideUnderline(
                            child: DropdownButton<SizeModel>(
                              items: item?.product?.sizeList!
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value.label.toString()),
                                    ),
                                  )
                                  .toList(),
                              isExpanded: true,
                              hint: Text(
                                LanguageConstants.chooseAnOption.tr,
                                style: const TextStyle(fontSize: 12),
                              ),
                              value:
                                  item?.product?.selectSizeValue?.value.value !=
                                          null
                                      ? item?.product?.selectSizeValue?.value
                                      : null,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 22,
                                color: Colors.black,
                              ),
                              iconEnabledColor: Colors.transparent,
                              onChanged: (valueList) {
                                item?.product?.selectSizeValue?.value =
                                    valueList ?? SizeModel();
                              },
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: controller.wishItemModel?.value.items?.length ?? 0,
    );
  }
}

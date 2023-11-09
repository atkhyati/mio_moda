import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:suvandnat/app/controller/cart/cart_controller.dart';
import 'package:suvandnat/app/controller/product_listing/product_controller.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/presentation/common_widget/screen_loading.dart';
import 'package:suvandnat/app/presentation/screens/product_listing/product_list_screen.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class ProductListAddDialog extends StatelessWidget {
  ProductListAddDialog({Key? key, required this.item}) : super(key: key);
  final ProductItem item;

  final ProductController productController = Get.find();
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      elevation: 6.0,
      radius: 0,
      contentPadding: const EdgeInsets.all(14.0),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      backgroundColor: backGroundColor,
      contentWidget: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.clear,
                              size: 22,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${item.name} ${LanguageConstants.addedToYourCart.tr}"
                            .toTitleCase(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400(size: 15),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${AppConstants.productImageUrl}${item.getProductImage()}",
                              errorWidget: (
                                BuildContext context,
                                String url,
                                dynamic error,
                              ) {
                                return Image.asset(AppAsset.logo);
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Visibility(
                            visible: item.typeId == 'configurable',
                            child: Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    decoration: BoxDecoration(
                                      color: backGroundColor,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<SizeModel>(
                                        dropdownColor: backGroundColor,
                                        items: productController.listOfChoose
                                            .map(
                                              (value) => DropdownMenuItem(
                                                value: value,
                                                child: Text(
                                                    value.label.toString()),
                                              ),
                                            )
                                            .toList(),
                                        isExpanded: true,
                                        hint: productController.sizeList.isEmpty
                                            ? Text(
                                                LanguageConstants
                                                    .specialSizeSelectSizeText
                                                    .tr,
                                              )
                                            : Text(
                                                "${productController.sizeList.first.label}",
                                                style: AppTextStyle
                                                    .textStyleUtils400(),
                                              ),
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 22,
                                          color: Colors.black,
                                        ),
                                        iconEnabledColor: Colors.transparent,
                                        onChanged: (valueList) {
                                          productController.sizeList.clear();
                                          productController.sizeList
                                              .add(valueList!);
                                          if (productController
                                                  .sizeList.first.value ==
                                              "Missing") {
                                            return;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          imageDialog(
                                            LanguageConstants.sizeChartText.tr,
                                            item.getSizeChart(),
                                            context,
                                          );
                                        },
                                        child: Text(
                                          LanguageConstants.sizeChartText.tr,
                                          style:
                                              AppTextStyle.textStyleUtils400(),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      productController.dropdownValidator.value
                                          ? Text(
                                              LanguageConstants
                                                  .selectSizeFirst.tr,
                                              style: AppTextStyle
                                                  .textStyleUtils400(
                                                color: Colors.red,
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          cartController.checkItemSkuEmptyData(item)
                              ? OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: appColorPrimary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await productController.addToCartPopUPTap(
                                        item, cartController);
                                  },
                                  child: HeadlineBodyOneBaseWidget(
                                    title: LanguageConstants.addTOCart.tr,
                                    titleColor: Colors.white,
                                    fontFamily: AppConstants.fontPoppins,
                                    fontSize: 14,
                                  ),
                                )
                              : Row(
                                  children: [
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: appColorPrimary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () async {
                                        Get.toNamed(
                                            RoutesConstants.checkoutOrderScreen,
                                            arguments:
                                                cartController.cartModel.value);
                                      },
                                      child: HeadlineBodyOneBaseWidget(
                                        title: LanguageConstants.buyNow.tr,
                                        titleColor: Colors.white,
                                        fontFamily: AppConstants.fontPoppins,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: appColorPrimary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () async {
                                        Get.back();
                                        Get.toNamed(RoutesConstants.cartScreen);
                                      },
                                      child: HeadlineBodyOneBaseWidget(
                                        title:
                                            LanguageConstants.viewCartText.tr,
                                        titleColor: Colors.white,
                                        fontFamily: AppConstants.fontPoppins,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: appColorPrimary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      child: HeadlineBodyOneBaseWidget(
                                        title: LanguageConstants
                                            .continueShoppingText.tr,
                                        titleColor: Colors.white,
                                        fontFamily: AppConstants.fontPoppins,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                      const SizedBox(height: 14.0),
                      Text(
                        LanguageConstants.recommendation.tr,
                        style: AppTextStyle.textStyleUtils400_16(),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: productController.recommendationList.isEmpty
                            ? 20
                            : 185,
                        child: productController.recommendationList.isEmpty
                            ? Container()
                            : productController
                                        .recommendationList[0].imageUrl ==
                                    null
                                ? Center(
                                    child: Text(productController
                                        .recommendationList[0].message
                                        .toString()),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: productController
                                        .recommendationList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () async {
                                          await productController
                                              .recommendationTap(
                                            index,
                                            cartController,
                                          );
                                        },
                                        child: SizedBox(
                                          width: 120,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 90,
                                                width: 100,
                                                margin: const EdgeInsets.only(
                                                  right: 5,
                                                  left: 5,
                                                  top: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: backGroundColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: blackColor
                                                          .withOpacity(0.30),
                                                      blurRadius: 8,
                                                    ),
                                                  ],
                                                  border: Border.all(
                                                    color: appColorPrimary,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Image(
                                                      width: 162,
                                                      image: NetworkImage(
                                                        productController
                                                            .recommendationList[
                                                                index]
                                                            .imageUrl
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                productController
                                                    .recommendationList[index]
                                                    .name
                                                    .toString()
                                                    .toTitleCase(),
                                                textAlign: TextAlign.center,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyle
                                                    .textStyleUtils400(
                                                        size: 11.0),
                                              ),
                                              Text(
                                                productController
                                                    .recommendationList[index]
                                                    .price
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle
                                                    .textStyleUtils400(
                                                        size: 11.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                      ),
                    ],
                  ),
                ),
                productController.dialogLoader.value
                    ? const ScreenLoading()
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void imageDialog(text, path, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          insetPadding: const EdgeInsets.all(20),
          contentWidget: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$text',
                      style: AppTextStyle.textStyleUtils500_16(
                          color: appColorPrimary),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        size: 16,
                      ),
                      color: appColorPrimary,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  imagePreview('$path');
                },
                child: CachedNetworkImage(
                  imageUrl: '$path',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future imagePreview(String imageUrl) {
    return showGeneralDialog(
      context: Get.context!,
      barrierColor: Colors.black12.withOpacity(0.6),
      // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Stack(
          children: [
            Center(
              child: Hero(
                  tag: "tag",
                  child: PhotoView(
                    customSize: MediaQuery.of(Get.context!).size,
                    initialScale: PhotoViewComputedScale.contained,
                    imageProvider: NetworkImage(imageUrl),
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 1.8,
                  )),
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 80,
                color: Colors.transparent,
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(
                  top: 44,
                  right: 30,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

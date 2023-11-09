import 'package:brandslabels/app/core/consts/app_style.dart';
import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';

class HomeMostPopularWidget extends StatelessWidget {
  final String id;
  final String title;
  final ProductModel? productModel;
  final bool isEmpty;
  const HomeMostPopularWidget(
      {Key? key,
      required this.id,
      required this.isEmpty,
      required this.title,
      required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? const SizedBox()
        : Padding(
            padding: EdgeInsets.symmetric( vertical: 10.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(title,
                        style: AppStyle.textStyleUtils600(
                            size: 18.w, color: primary)),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Get.toNamed<dynamic>(
                            RoutesConstants.productListScreen,
                            arguments: [
                              "dash",
                              id, // countryInsideList.attributeId, for designer brand
                              title, // brand name
                            ],
                          );
                        },
                        child: Text(
                          LanguageConstants.viewAll.tr,
                          style: AppStyle.textStyleUtils500_12(
                              color: primary),
                        )),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: productModel!.items!.length > 4
                        ? 4
                        : productModel!.items!.length,
                    padding: EdgeInsets.zero,
                    gridDelegate:
                         SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 8.w,
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                    ),
                    itemBuilder: (context, index) {
                      ProductItem? item = productModel!.items![index];
                      //trending product tile
                      return Padding(
                        padding: EdgeInsets.all(4.sp),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed<dynamic>(
                              RoutesConstants.productDetailScreen,
                              arguments: [item],
                            );
                          },
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 148.w,
                                  width: 156.w,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: CachedNetworkImage(
                                    imageUrl: "${AppConstants.productImageUrl}""${productModel!.items![index].mediaGalleryEntries!.isEmpty?'':productModel!.items![index].mediaGalleryEntries!.first.file}",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    memCacheWidth: 200,
                                    memCacheHeight: 150,
                                    placeholder: (context, url) => Container(
                                        color: whiteColor,),
                                    errorWidget: (context, url, error) =>
                                        SvgPicture.asset(AppAsset.appLogoSvg),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  productModel!.items![index].name!.toString(),
                                  style: AppStyle.textStyleUtils500(size: 12.sp),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  '\$ ${productModel!.items![index].price.toString()}',
                                  style: AppStyle.textStyleUtils600(size: 12.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
  }
}

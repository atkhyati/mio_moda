import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:veralusso/app/controller/product_listing/product_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import '../../../../theme/colors.dart';
import 'sort_widget.dart';
import 'package:meta_package/translations/translations.dart';

class FilterDropDown extends GetView<ProductController> {
  @override
  final ProductController controller = Get.find();

  FilterDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: primary, width: 2))),
              onPressed: () {
                showGeneralDialog(
                  context: Get.context!,
                  barrierColor: Colors.black12.withOpacity(0.6),
                  barrierDismissible: false,
                  barrierLabel: 'Dialog',
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (_, __, ___) {
                    return SortWidget();
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    AppAsset.svgSort,
                    height: 18.w,
                    width: 18.w,
                  ),
                  Text(
                    LanguageConstants.sort.tr.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.textStyleUtils500(),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {},
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: whiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: primary, width: 2))),
            onPressed: () async{
              dynamic result = await Get.toNamed(RoutesConstants.filterScreen,
                  arguments: Get.arguments[1]);
              if (result is ProductModel) {
                controller.productModel?.value = result;
              }
            },
            child: SizedBox(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  AppAsset.svgFilter,
                  width: 18.w,
                  height: 18.w,
                  color: Colors.black,
                ),
                Text(
                  LanguageConstants.filter.tr.toUpperCase(),
                  style: AppTextStyle.textStyleUtils500(),
                ),
              ],
            )),
          ),
        )
      ],
    );
  }
}

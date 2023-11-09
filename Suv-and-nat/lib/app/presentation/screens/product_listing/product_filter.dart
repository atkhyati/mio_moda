import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/product_listing/product_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
 import 'package:suvandnat/app/presentation/screens/product_listing/widget/filter_option_list.dart';
import 'package:suvandnat/app/theme/colors.dart';


class ProductFilter extends GetView<ProductController> {
  const ProductFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      height: Get.height,
      width: Get.width,
      color: backGroundColor,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonAppbarDialog(
                title: LanguageConstants.filtersText.tr,
                onTapRefresh: () {
                  Get.back<dynamic>();
                  controller.onInit();
                },
                color: appColorPrimary,
              ),
              const FilterOptionList(),
              SizedBox(
                height: 54.h,
              ),
              SizedBox(
                child: CommonThemeButton(
                  onTap: () {
                    controller.onFilterClick();
                  },
                  title: LanguageConstants.applyText.tr,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

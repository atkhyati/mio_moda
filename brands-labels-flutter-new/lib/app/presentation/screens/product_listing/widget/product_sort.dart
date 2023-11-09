import 'package:brandslabels/app/controller/product_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

class SortByWidget extends GetView<ProductController> {
  const SortByWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          color: profileTileBG,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: textfieldBorderGrey, width: 2),
        ),
        child: MaterialButton(
          onPressed: () {
            showGeneralDialog(
              context: Get.context!,
              barrierColor: Colors.black12.withOpacity(0.6),
              // Background color
              barrierDismissible: false,
              barrierLabel: 'Dialog',
              transitionDuration: const Duration(milliseconds: 400),
              pageBuilder: (_, __, ___) {
                return sort();
              },
            );
          },
          child: Row(
            children: [
              SvgPicture.asset(
                AppAsset.svgSort,
                width: 20.w,
                height: 20.w,
              ),
               SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Text(
                  LanguageConstants.sort.tr,
                  textAlign: TextAlign.center,

                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.textStyleUtils500_16(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sort() {
    return Scaffold(
      appBar: commonAppbar(title: LanguageConstants.sortBy.tr),



      body: Obx(() {
        return Column(
          children: [
            ...List.generate(
                controller.sortTypeList.length,
                (index) => InkWell(
                      onTap: () {
                        controller.selectedSortIndex.value = index;
                        controller.selectedSortVal.value =
                            controller.sortTypeList[index];
                        debugPrint(
                            "selected sort type -> ${controller.selectedSortVal.value.name}");
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          right: 30,
                          top: index == 0 ? 25 : 15,
                          bottom: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.sortTypeList[index].name ?? '',
                              style: AppTextStyle.textStyleUtils500(
                                  color: primary),
                            ),
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: primary, width: 2)),
                              child: Container(
                                margin: const EdgeInsets.all(2.2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.selectedSortIndex.value ==
                                          index
                                      ? primary
                                      : Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                    SizedBox(
                      child: CommonThemeButton(onTap: controller.onSortingClick, title: LanguageConstants.applyText.tr))
          
          ],
        );
      }),
    );
  }
}

import 'package:avoirchic/app/controller/home_controller.dart';
import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomwButtonListWidget extends GetView<HomeController> {
  const HomwButtonListWidget({
    Key? key,
  }) : super(key: key);

  static List<String> buttonName = ['Men', 'women', 'Kids', 'Home'];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.w),
          child: Row(
            children: List.generate(controller.activeChildrenData.length ?? 0,
                (index) {
              return SizedBox(
                height: 30.w,
                child: Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 24.w : 13.w),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: whiteColor),
                    child: CommonTextPoppins(
                      controller.activeChildrenData[index].name,
                      color: blackColor,
                      fontSize: 12.sp,
                    ),
                    onPressed: () {
                      Get.toNamed(
                        RoutesConstants.productListScreen,
                        arguments: [
                          "dash",
                          controller.activeChildrenData[index].id.toString(),
                          controller.activeChildrenData[index].name.toString(),
                        ],
                      );
                    },
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

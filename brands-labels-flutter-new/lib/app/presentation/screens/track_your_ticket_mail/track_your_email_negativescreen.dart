import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TrackYourTicketNoDataFound extends StatelessWidget {
  const TrackYourTicketNoDataFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "We Cannot Find Any Request Associated \nWith This Email.",
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils400(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              LanguageConstants.pleaseTryWithAnotherEmaiAddressMsg.tr,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils400(),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAndToNamed(RoutesConstants.dashboardScreen);
              },
              style: ElevatedButton.styleFrom(
                elevation: 1,
                backgroundColor: darkBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: CommonTextOpenSans(
                LanguageConstants.continueShopping.tr,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

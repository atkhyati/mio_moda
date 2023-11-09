import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../all_imports.dart';

class NewsLettersDesign extends StatelessWidget {
  NewsLettersDesign({Key? key}) : super(key: key);

  RxBool subscribed = false.obs;

  @override
  Widget build(BuildContext context) {
    subscribed.value =
        localStore.userDetail.extensionAttributes!.isSubscribed == true;
    return Container(
      decoration: BoxDecoration(
          color: homeBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: appTileBorderColor, width: 2)),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40.w,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: appTileBGcolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: CommonTextPoppins(LanguageConstants.newsLetters.tr,
                    fontSize: 14.sp,
                    color: appColorPrimary,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.only(left: 20.w, bottom: 20.w),
              child: CommonTextPoppins(
                subscribed.value == true
                    ? "You are subcribed to NewsLetter"
                    : LanguageConstants.newsLettersContain.tr,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: SizedBox(
              child: CommonThemeButton(
                onTap: () {
                  Get.toNamed<dynamic>(RoutesConstants.newsLetterScreen)
                      ?.whenComplete(
                    () {
                      subscribed.value = localStore
                              .userDetail.extensionAttributes!.isSubscribed ==
                          true;
                    },
                  );
                },
                title: LanguageConstants.edit.tr,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}

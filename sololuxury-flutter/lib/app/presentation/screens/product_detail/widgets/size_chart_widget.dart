import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';

import '../../../../../all_imports.dart';

class SizeChartWidget extends GetView<ProductDetailController> {
  const SizeChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        imageDialog(
          LanguageConstants.sizeChartText.tr,
          controller.product?.value.getSizeChart() ?? '',
          context,
        );
      },
      child: CommonTextPoppins(
        LanguageConstants.sizeChartText.tr,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w400,
        color: appColorButton,
        fontSize: 14.sp,
      ),
    );
  }
}

void imageDialog(String text, String path, BuildContext context) {
  showDialog<dynamic>(
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
                    text,
                    style: AppStyle.textStyleUtils500_16(color: appColor),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 16,
                    ),
                    color: appColor,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                imagePreview("$path");
              },
              child: CachedNetworkImage(
                  imageUrl: path,
                  fit: BoxFit.cover,
                  placeholder: (
                    BuildContext context,
                    String url,
                  ) {
                    return Container(
                      height: 300,
                      width: double.maxFinite,
                      color: grey.withOpacity(0.5),
                    );
                  },
                  errorWidget: (
                    BuildContext context,
                    String url,
                    dynamic error,
                  ) {
                    return Image.asset(AppAsset.logo);
                  }),
            ),
          ],
        ),
      );
    },
  );
}

Future<void> imagePreview(String imageUrl) {
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
            //hero => tag: "tag",
            child: PhotoView(
              customSize: MediaQuery.of(Get.context!).size,
              initialScale: PhotoViewComputedScale.contained,
              imageProvider: NetworkImage(imageUrl),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 1.8,
            ),
          ),
          GestureDetector(
            onTap: () => Get.back<dynamic>(),
            child: Container(
              height: 80,
              color: Colors.transparent,
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(
                top: 45,
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

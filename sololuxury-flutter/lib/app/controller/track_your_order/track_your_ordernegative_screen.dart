import 'package:solo_luxury/all_imports.dart';

import '../../presentation/common_widget/common_widget/common_theme_button.dart';

class TrackYourRequestNegative extends StatelessWidget {
  const TrackYourRequestNegative({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LanguageConstants.weCannotFindAnyOrdersAssociatedWithThisEmail.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: AppConstants.fontOpenSans,
                  color: Colors.black,
                  fontSize: 14),
            ),
            const SizedBox(height: 10),
            Text(
              LanguageConstants.pleaseTryWithAnotherEmailAddress.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: AppConstants.fontOpenSans,
                  color: Colors.black,
                  fontSize: 14),
            ),
            const SizedBox(height: 16),
            CommonThemeButton(
              onTap: () {
                Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
              },
              title: LanguageConstants.continueShopping.tr,
            ),
          ],
        ),
      ),
    );
  }
}

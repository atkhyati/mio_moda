import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:veralusso/app/controller/dashboard/dashboard_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/presentation/common_widget/no_network_widget/no_network_widget.dart';
import 'package:veralusso/app/presentation/screens/dashboard/widget/appbar_with_header.dart';
import 'package:veralusso/app/presentation/screens/dashboard/widget/drawer_widget.dart';
import 'package:veralusso/app/presentation/screens/dashboard/widget/navbar_widget.dart';
import 'package:veralusso/app/presentation/screens/search/search_screen.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../brand_list/brand_list_page.dart';
import '../cart/cart_screen.dart';
import '../home/home_screen.dart';
import '../my_account/my_account_menu_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  @override
  final DashboardController controller = Get.find();

  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isConnected.value
        ? Scaffold(
            key: const Key('Scaffold'),
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                const AppBarWithHeaderWidget(),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top + 60),
                  child: Scaffold(
                    key: controller.scaffoldkey,
                    drawer: const DrawerWidget(),
                    body: Stack(
                      children: [
                        TabBarView(
                            controller: controller.tabController!.value,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              //TODO: PAGES
                              HomeScreen(),
                              BrandListPage(),
                              SearchScreen(),
                              MyAccountMenuPage(),
                              CartScreen()
                            ]),
                        Align(
                          alignment: const Alignment(1, .4),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(
                                  RoutesConstants.specialRequestScreen,
                                  arguments: ['', "category"],
                                );
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                width: 130.w,
                                height: 35.w,
                                child: Center(
                                    child: CommonTextPoppins(
                                  LanguageConstants.specialRequest.tr,
                                  fontSize: 12.sp,
                                  color: whiteColor,
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: NavbarWidget())
        : const NoNetworkWidget());
  }
}

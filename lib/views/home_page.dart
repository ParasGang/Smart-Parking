import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:cerebro_smart_parking/controller/bottom_nav_bar_controller.dart';
import 'package:cerebro_smart_parking/shared/size_config.dart';
import 'package:cerebro_smart_parking/views/bookings.dart';
import 'package:cerebro_smart_parking/views/maps_page.dart';
import 'package:cerebro_smart_parking/views/my_account.dart';

class HomePage extends StatelessWidget {
  BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              bottomNavBarController.page.value == 3
                  ? MyAccount()
                  : bottomNavBarController.page.value == 2
                      ? Bookings()
                      : MapsPage(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      SizeConfig.safeBlockVertical * 70,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(0, SizeConfig.safeBlockVertical * 3),
                          blurRadius: SizeConfig.safeBlockVertical * 6)
                    ],
                  ),
                  margin: EdgeInsets.only(
                    bottom: SizeConfig.safeBlockVertical * 27,
                    left: SizeConfig.safeBlockHorizontal * 35,
                    right: SizeConfig.safeBlockHorizontal * 35,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 7,
                  ),
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(
                              FontAwesome.map,
                              color: bottomNavBarController.page.value == 1
                                  ? Color(0xff4688FF)
                                  : Color(0xffC4C4C4),
                              size: SizeConfig.safeBlockVertical * 28,
                            ),
                            onPressed: () {
                              bottomNavBarController.changePage(1);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Ionicons.ios_notifications,
                              color: bottomNavBarController.page.value == 2
                                  ? Color(0xff4688FF)
                                  : Color(0xffC4C4C4),
                              size: SizeConfig.safeBlockVertical * 35,
                            ),
                            onPressed: () {
                              bottomNavBarController.changePage(2);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Ionicons.md_settings,
                              color: bottomNavBarController.page.value == 3
                                  ? Color(0xff4688FF)
                                  : Color(0xffC4C4C4),
                              size: SizeConfig.safeBlockVertical * 35,
                            ),
                            onPressed: () {
                              bottomNavBarController.changePage(3);
                            },
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ParkingAvailableContainer(BuildContext context) {
    return Container();
  }
}

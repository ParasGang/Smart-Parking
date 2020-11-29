import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:cerebro_smart_parking/shared/size_config.dart';
import 'dart:math' as math;

import 'package:cerebro_smart_parking/views/my_profile.dart';

class MyAccount extends StatelessWidget {
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 35),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: SizeConfig.safeBlockVertical * 25,
          ),
          Text(
            "My Account",
            style: TextStyle(
              fontSize: SizeConfig.safeBlockVertical * 26,
              color: Color(0xff222831),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: SizeConfig.safeBlockVertical * 25,
          ),
          GestureDetector(
            onTap: () {
              Get.to(MyProfile());
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  SizeConfig.safeBlockVertical * 20,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    offset: Offset(0, SizeConfig.safeBlockVertical * 2),
                    blurRadius: SizeConfig.safeBlockVertical * 5,
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 15,
              ),
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 15,
                horizontal: SizeConfig.safeBlockHorizontal * 18,
              ),
              child: Row(
                children: [
                  Container(
                    height: SizeConfig.safeBlockVertical * 50,
                    width: SizeConfig.safeBlockVertical * 50,
                    color: Color(0xff2185C8).withOpacity(0.2),
                    child: Icon(
                      Ionicons.ios_person,
                      color: Color(0xff2185C8),
                      size: SizeConfig.safeBlockVertical * 35,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 30,
                  ),
                  Text(
                    "My Profile",
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 24,
                      color: Color(0xff222831),
                      fontWeight: FontWeight.w100,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  SizeConfig.safeBlockVertical * 20,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    offset: Offset(0, SizeConfig.safeBlockVertical * 2),
                    blurRadius: SizeConfig.safeBlockVertical * 5,
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 15,
              ),
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 15,
                horizontal: SizeConfig.safeBlockHorizontal * 18,
              ),
              child: Row(
                children: [
                  Container(
                    height: SizeConfig.safeBlockVertical * 50,
                    width: SizeConfig.safeBlockVertical * 50,
                    color: Color(0xff2185C8).withOpacity(0.2),
                    child: Icon(
                      Icons.help,
                      color: Color(0xff2185C8),
                      size: SizeConfig.safeBlockVertical * 35,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 30,
                  ),
                  Text(
                    "Help",
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 24,
                      color: Color(0xff222831),
                      fontWeight: FontWeight.w100,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _logout();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  SizeConfig.safeBlockVertical * 20,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    offset: Offset(0, SizeConfig.safeBlockVertical * 2),
                    blurRadius: SizeConfig.safeBlockVertical * 5,
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 15,
              ),
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 15,
                horizontal: SizeConfig.safeBlockHorizontal * 18,
              ),
              child: Row(
                children: [
                  Container(
                    height: SizeConfig.safeBlockVertical * 50,
                    width: SizeConfig.safeBlockVertical * 50,
                    color: Color(0xff2185C8).withOpacity(0.2),
                    child: Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: Icon(
                        Icons.logout,
                        color: Color(0xff2185C8),
                        size: SizeConfig.safeBlockVertical * 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 30,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 24,
                      color: Color(0xff222831),
                      fontWeight: FontWeight.w100,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

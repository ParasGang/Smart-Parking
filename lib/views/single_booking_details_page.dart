import 'dart:ui';

import 'package:cerebro_smart_parking/controller/bottom_nav_bar_controller.dart';
import 'package:cerebro_smart_parking/shared/size_config.dart';
import 'package:cerebro_smart_parking/views/home_page.dart';
import 'package:cerebro_smart_parking/views/maps_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class SingleBookingDetailsPage extends StatefulWidget {
  final e;

  SingleBookingDetailsPage({this.e, this.gate});
  bool gate;
  @override
  _SingleBookingDetailsPageState createState() =>
      _SingleBookingDetailsPageState();
}

class _SingleBookingDetailsPageState extends State<SingleBookingDetailsPage> {
  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: scaffoldState,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 20,
                vertical: SizeConfig.safeBlockVertical * 20,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Ionicons.ios_arrow_round_back,
                      color: Color(0xff222831),
                      size: SizeConfig.safeBlockVertical * 40,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Booking Details",
                        style: TextStyle(
                          color: Color(0xff222831),
                          fontSize: SizeConfig.safeBlockVertical * 26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 30,
              ),
              child: Text(
                "Parking Info",
                style: TextStyle(
                  color: Color(0xff222831),
                  fontSize: SizeConfig.safeBlockVertical * 26,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 30,
                vertical: SizeConfig.safeBlockVertical * 17,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 10,
                  vertical: SizeConfig.safeBlockVertical * 4),
              decoration: BoxDecoration(
                color: Color(0xff393E46),
                borderRadius: BorderRadius.circular(
                  SizeConfig.safeBlockVertical * 20,
                ),
              ),
              child: Text(
                "Parking Ongoing",
                style: TextStyle(
                  color: Color(0xffF6f6f6),
                  fontSize: SizeConfig.safeBlockVertical * 14,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 30,
                top: SizeConfig.safeBlockVertical * 10,
                bottom: SizeConfig.safeBlockVertical * 5,
              ),
              child: Text(
                "${widget.e['location']}",
                style: TextStyle(
                  color: Color(0xff222831),
                  fontSize: SizeConfig.safeBlockVertical * 40,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 30,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: Color(0xff707070),
                    size: SizeConfig.safeBlockVertical * 25,
                  ),
                  Text(
                    "${widget.e['address']}",
                    style: TextStyle(
                      color: Color(0xff707070),
                      fontSize: SizeConfig.safeBlockVertical * 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 30,
                vertical: SizeConfig.safeBlockVertical * 35,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.date_range,
                    color: Color(0xff222831),
                    size: SizeConfig.safeBlockHorizontal * 40,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Thu 04 Nov",
                        style: TextStyle(
                          color: Color(0xff393E46),
                          fontSize: SizeConfig.safeBlockHorizontal * 16,
                        ),
                      ),
                      Text(
                        "${widget.e['startTime']}",
                        style: TextStyle(
                          color: Color(0xffC8C8C8),
                          fontSize: SizeConfig.safeBlockHorizontal * 12,
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Icon(
                    Ionicons.ios_arrow_round_forward,
                    color: Color(0xffA5A5A5),
                    size: SizeConfig.safeBlockHorizontal * 40,
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Thu 04 Nov",
                        style: TextStyle(
                          color: Color(0xff393E46),
                          fontSize: SizeConfig.safeBlockHorizontal * 16,
                        ),
                      ),
                      Text(
                        "${widget.e['endTime']}",
                        style: TextStyle(
                          color: Color(0xffC8C8C8),
                          fontSize: SizeConfig.safeBlockHorizontal * 12,
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 30,
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  SizeConfig.safeBlockVertical * 20,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    offset: Offset(0, SizeConfig.safeBlockVertical * 3),
                    blurRadius: SizeConfig.safeBlockVertical * 6,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 15,
                      vertical: SizeConfig.safeBlockVertical * 7,
                    ),
                    child: Row(
                      children: [
                        Text("2 Hour Parking",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize: SizeConfig.safeBlockVertical * 18)),
                        Spacer(),
                        Text("₹40",
                            style: TextStyle(
                                color: Color(0xff393E46),
                                fontSize: SizeConfig.safeBlockVertical * 18)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 15,
                      vertical: SizeConfig.safeBlockVertical * 7,
                    ),
                    child: Row(
                      children: [
                        Text("Service fee",
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize: SizeConfig.safeBlockVertical * 18)),
                        Spacer(),
                        Text("₹ 0",
                            style: TextStyle(
                                color: Color(0xff393E46),
                                fontSize: SizeConfig.safeBlockVertical * 18)),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    color: Color(0xff393E46),
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 10,
                      vertical: SizeConfig.safeBlockVertical * 7,
                    ),
                    height: SizeConfig.safeBlockVertical * 1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 15,
                      vertical: SizeConfig.safeBlockVertical * 7,
                    ),
                    child: Row(
                      children: [
                        Text("Trip Total",
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockVertical * 18)),
                        Spacer(),
                        Text("₹ 40",
                            style: TextStyle(
                                color: Color(0xff393E46),
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockVertical * 18)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                if (widget.gate == false) {
                  CollectionReference collectionReference =
                      FirebaseFirestore.instance.collection("parkingGate");
                  await collectionReference
                      .doc("gate")
                      .set({'gate_open': true})
                      .then((value) => print("Gate Opened"))
                      .catchError((e) => print("Failed to open gate: $e"));
                  Get.snackbar("Parking Gate", "Parking Gate Opened",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.grey);

                  setState(() {
                    widget.gate = true;
                  });
                } else {
                  Get.snackbar("Parking Gate", "Parking Gate is Disabled",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.grey);
                }
              },
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: widget.gate == true ? Colors.grey : Color(0xff2185C8),
                  borderRadius: BorderRadius.circular(
                    SizeConfig.safeBlockVertical * 20,
                  ),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 40,
                  horizontal: SizeConfig.safeBlockHorizontal * 35,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 15,
                  horizontal: SizeConfig.safeBlockHorizontal * 22,
                ),
                child: Center(
                  child: Text(
                    "Open Gate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.safeBlockVertical * 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

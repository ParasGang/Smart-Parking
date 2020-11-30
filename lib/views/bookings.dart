import 'package:cerebro_smart_parking/controller/user_controller.dart';
import 'package:cerebro_smart_parking/models/booking.dart';
import 'package:cerebro_smart_parking/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Bookings extends StatelessWidget {
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
            "My Bookings",
            style: TextStyle(
              fontSize: SizeConfig.safeBlockVertical * 26,
              color: Color(0xff222831),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: SizeConfig.safeBlockVertical * 15,
          ),
          Container(
            height: SizeConfig.safeBlockVertical * 750,
            width: double.infinity,
            // color: Colors.red,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('booking')
                    .where('uid',
                        isEqualTo: Get.find<UserController>().uid.value)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  var item = snapshot.hasData ? snapshot.data.docs : [];

                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView(
                      children: item.map((e) {
                        return Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.symmetric(
                            vertical: SizeConfig.safeBlockVertical * 10,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                SizeConfig.safeBlockVertical * 25,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(
                                      0, SizeConfig.safeBlockVertical * 3),
                                  blurRadius: SizeConfig.safeBlockVertical * 6,
                                ),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.safeBlockHorizontal * 20,
                                      vertical:
                                          SizeConfig.safeBlockVertical * 17,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.safeBlockHorizontal * 10,
                                        vertical:
                                            SizeConfig.safeBlockVertical * 4),
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFF2D2),
                                      borderRadius: BorderRadius.circular(
                                        SizeConfig.safeBlockVertical * 20,
                                      ),
                                    ),
                                    child: Text(
                                      "Parking Ongoing",
                                      style: TextStyle(
                                        color: Color(0xffFFB300),
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 14,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right:
                                          SizeConfig.safeBlockHorizontal * 20,
                                    ),
                                    child: Text(
                                      "₹${e['price']}",
                                      style: TextStyle(
                                        color: Color(0xff222831),
                                        // fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 35,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.safeBlockHorizontal * 22,
                                ),
                                child: Text(
                                  "${e['location']}",
                                  style: TextStyle(
                                    color: Color(0xff222831),
                                    fontSize: SizeConfig.safeBlockVertical * 26,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.safeBlockHorizontal * 22,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: Color(0xffD2D2D2),
                                      size: SizeConfig.safeBlockVertical * 16,
                                    ),
                                    Text(
                                      "${e['address']}",
                                      style: TextStyle(
                                        color: Color(0xffD2D2D2),
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.safeBlockHorizontal * 20,
                                  vertical: SizeConfig.safeBlockVertical * 20,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: Color(0xff222831),
                                      size: SizeConfig.safeBlockHorizontal * 40,
                                    ),
                                    Spacer(flex: 2),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Thu 04 Nov",
                                          style: TextStyle(
                                            color: Color(0xff393E46),
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    12,
                                          ),
                                        ),
                                        Text(
                                          "${e['startTime']}",
                                          style: TextStyle(
                                            color: Color(0xffC8C8C8),
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(flex: 1),
                                    Icon(
                                      Ionicons.ios_arrow_round_forward,
                                      color: Color(0xffA5A5A5),
                                      size: SizeConfig.safeBlockHorizontal * 40,
                                    ),
                                    Spacer(flex: 1),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Thu 04 Nov",
                                          style: TextStyle(
                                            color: Color(0xff393E46),
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    12,
                                          ),
                                        ),
                                        Text(
                                          "${e['endTime']}",
                                          style: TextStyle(
                                            color: Color(0xffC8C8C8),
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(flex: 10),
                                    Icon(
                                      FontAwesome.qrcode,
                                      color: Color(0xff222831),
                                      size: SizeConfig.safeBlockHorizontal * 40,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

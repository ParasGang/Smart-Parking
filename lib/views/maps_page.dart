import 'package:cerebro_smart_parking/controller/bookings_controller.dart';
import 'package:cerebro_smart_parking/controller/parking_controller.dart';
import 'package:cerebro_smart_parking/controller/user_controller.dart';
import 'package:cerebro_smart_parking/shared/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  Location location = Location();
  BookingsController bookingsController = Get.put(BookingsController());
  Parkingcontroller parkingcontroller = Get.put(Parkingcontroller());
  GoogleMapController mapController;
  BitmapDescriptor customIcon;
  BitmapDescriptor customIcon1;
  Set<Marker> markers;
  LocationData position;

  getCurrentLocation() async {
    position = await location.getLocation();
    print(position.latitude);
    print(position.longitude);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    markers = Set.from([]);
    getCurrentLocation();
  }

  createParkingMarker(context) {
    if (customIcon == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(
              configuration, 'assets/parking_marker.png')
          .then((icon) {
        setState(() {
          customIcon1 = icon;
          Marker m = Marker(
              markerId: MarkerId('1'),
              icon: customIcon1,
              position: LatLng(21.144576, 72.758002),
              onTap: () {},
              infoWindow: InfoWindow(
                  title: "VR MALL",
                  snippet: "Dumas Road, Surat",
                  onTap: () {
                    showBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return BookingsBottomSheet();
                        });
                  }));

          markers.add(m);
        });
      });
    }
  }

  createMarker(context) {
    if (customIcon == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(configuration, 'assets/car1.png')
          .then((icon) {
        setState(() {
          customIcon = icon;
          Marker m = Marker(
              markerId: MarkerId('2'),
              icon: customIcon,
              position: LatLng(position.latitude, position.longitude),
              rotation: 90.0);
          markers.add(m);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    createParkingMarker(context);
    createMarker(context);
    return Stack(
      children: [
        GoogleMap(
          myLocationButtonEnabled: false,
          mapToolbarEnabled: false,
          initialCameraPosition: CameraPosition(
            target: LatLng(21.1896496, 72.858426),
            zoom: 11,
          ),
          myLocationEnabled: true,
          markers: markers,
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          onTap: (pos) {
            print(pos);
          },
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 35,
            vertical: SizeConfig.safeBlockVertical * 20,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 5,
            vertical: SizeConfig.safeBlockVertical * 7,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              SizeConfig.safeBlockVertical * 20,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: Offset(
                  0,
                  SizeConfig.safeBlockVertical * 3,
                ),
                blurRadius: SizeConfig.safeBlockVertical * 6,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 10,
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 20,
                      color: Color(0xff222831),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(bottom: 7, top: 11, right: 15),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(
                  SizeConfig.safeBlockVertical * 10,
                ),
                decoration: BoxDecoration(
                  color: Color(0xff4688FF),
                  borderRadius: BorderRadius.circular(
                    SizeConfig.safeBlockVertical * 20,
                  ),
                ),
                child: Icon(
                  Ionicons.ios_search,
                  color: Colors.white,
                  size: SizeConfig.safeBlockVertical * 38,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class BookingsBottomSheet extends StatefulWidget {
  @override
  _BookingsBottomSheetState createState() => _BookingsBottomSheetState();
}

class _BookingsBottomSheetState extends State<BookingsBottomSheet> {
  BookingsController bookingsController = Get.find();
  DateTime todayDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  int totalHoursParking = 0;
  List<int> _price = [
    25,
    25,
    50,
    70,
    90,
    110,
    130,
    150,
    170,
    185,
    200,
    215,
    230,
    245,
    260,
    275,
    290,
    310,
    325,
    340,
    355,
    370,
    385,
    400,
  ];
  List<String> _months = [
    "Months",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  Future<Null> _selectTodayDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: todayDate,
        lastDate: DateTime(2101));
    if (picked != null && picked != todayDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _selectStartTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: startTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        });
    if (picked != null)
      setState(() {
        startTime = picked;
        totalHoursParking =
            calculateTotalParkingTime(end: endTime, start: startTime);
        print(totalHoursParking);
      });
  }

  Future<Null> _selectEndTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: endTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        });
    if (picked != null)
      setState(() {
        endTime = picked;
        totalHoursParking =
            calculateTotalParkingTime(end: endTime, start: startTime);
      });
  }

  int calculateTotalParkingTime({TimeOfDay end, TimeOfDay start}) {
    double _doubleYourTime = end.hour.toDouble() + (end.minute.toDouble() / 60);
    double _doubleNowTime =
        start.hour.toDouble() + (start.minute.toDouble() / 60);

    double _timeDiff = _doubleYourTime - _doubleNowTime;

    int _hr = _timeDiff.truncate();
    int _minute = ((_timeDiff - _timeDiff.truncate()) * 60).truncate();

    print('Here your Happy $_hr Hour and also $_minute min');
    if (_minute < 30) {
      if (_hr < 0) {
        _hr *= -1;
        return _hr;
      } else {
        print(_hr);
        return _hr;
      }
    } else {
      if (_hr < 0) {
        _hr *= -1;
        return ++_hr;
      } else {
        return ++_hr;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('booking')
            .where('date1', isEqualTo: selectedDate.day)
            .where('month', isEqualTo: _months[selectedDate.month])
            .where('start', isEqualTo: startTime.hour)
            .where('end', isEqualTo: endTime.hour)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          var emptySlots =
              snapshot.hasData ? (40 - snapshot.data.docs.length) : 40;

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 20,
                horizontal: SizeConfig.safeBlockHorizontal * 20,
              ),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    SizeConfig.safeBlockVertical * 55,
                  ),
                  topRight: Radius.circular(
                    SizeConfig.safeBlockVertical * 55,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Color(0xffA2C3FF),
                    height: SizeConfig.safeBlockVertical * 5,
                    width: SizeConfig.safeBlockHorizontal * 50,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "VR Mall",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockVertical * 40,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Color(0xffADAAAA),
                        size: SizeConfig.safeBlockVertical * 20,
                      ),
                      Text(
                        "University Road, Surat",
                        style: TextStyle(
                          color: Color(0xffADAAAA),
                          fontSize: SizeConfig.safeBlockVertical * 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 15,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: SizeConfig.safeBlockHorizontal * 8,
                        ),
                        padding: EdgeInsets.all(
                          SizeConfig.safeBlockVertical * 3,
                        ),
                        color: Color(0xff68C3FF),
                        child: Icon(
                          Icons.local_parking_outlined,
                          size: SizeConfig.safeBlockVertical * 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "$emptySlots Spots Available",
                        style: TextStyle(
                          color: Color(0xff4DB200),
                          fontSize: SizeConfig.safeBlockVertical * 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Ionicons.ios_videocam,
                        color: Color(0xffFFB554),
                        size: SizeConfig.safeBlockVertical * 40,
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 20,
                      ),
                      Icon(
                        FontAwesome.wheelchair,
                        color: Color(0xffFF4D4D),
                        size: SizeConfig.safeBlockVertical * 30,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectTodayDate(context);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical * 20,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 15,
                        vertical: SizeConfig.safeBlockVertical * 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.safeBlockVertical * 15),
                        border: Border.all(
                          color: Color(0xff707070),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "${selectedDate.day} ${_months[selectedDate.month]} ${selectedDate.year}",
                            style: TextStyle(
                                color: Color(0xff222831),
                                fontSize: SizeConfig.safeBlockVertical * 22,
                                fontWeight: FontWeight.w100),
                          ),
                          Spacer(),
                          Icon(FontAwesome.calendar_o),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _selectStartTime(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 15,
                              vertical: SizeConfig.safeBlockVertical * 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.safeBlockVertical * 15),
                              border: Border.all(
                                color: Color(0xff707070),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${startTime.format(context)}",
                                style: TextStyle(
                                  color: Color(0xff222831),
                                  fontSize: SizeConfig.safeBlockVertical * 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 7,
                      ),
                      Text(
                        "-",
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockVertical * 40,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 7,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _selectEndTime(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 15,
                              vertical: SizeConfig.safeBlockVertical * 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.safeBlockVertical * 15),
                              border: Border.all(
                                color: Color(0xff707070),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${endTime.format(context)}",
                                style: TextStyle(
                                  color: Color(0xff222831),
                                  fontSize: SizeConfig.safeBlockVertical * 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 15,
                  ),
                  // Container(
                  //   width: SizeConfig.safeBlockHorizontal * 412,
                  //   height: 60,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: 4,
                  //       itemBuilder: (context, index) {
                  //         return Container(
                  //           height: SizeConfig.safeBlockVertical * 60,
                  //           width: SizeConfig.safeBlockHorizontal * 100,
                  //           margin: EdgeInsets.symmetric(
                  //             horizontal: SizeConfig.safeBlockHorizontal * 10,
                  //           ),
                  //           decoration: BoxDecoration(
                  //               border: Border.all(
                  //             color: Color(0xff222831),
                  //           )),
                  //           child: Column(
                  //             children: [Text("1 Hour")],
                  //           ),
                  //         );
                  //       }),
                  // ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Parking Payment",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockVertical * 20,
                        color: Color(0xff222831),
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      bookingsController.booking.value.location = "VR Mall";
                      bookingsController.booking.value.address =
                          "University Road, Surat";
                      bookingsController.booking.value.date = selectedDate;
                      bookingsController.booking.value.endTime =
                          endTime.format(context);
                      bookingsController.booking.value.price =
                          _price[totalHoursParking];
                      bookingsController.booking.value.uid =
                          Get.find<UserController>().uid.value;
                      bookingsController.booking.value.startTime =
                          startTime.format(context);
                      bookingsController.booking.value.totalHours =
                          totalHoursParking;
                      bookingsController.booking.value.locationid = 1;
                      bookingsController.booking.value.year = selectedDate.year;
                      bookingsController.booking.value.date1 = selectedDate.day;
                      bookingsController.booking.value.month =
                          _months[selectedDate.month];
                      bookingsController.booking.value.start = startTime.hour;
                      bookingsController.booking.value.end = endTime.hour;
                      bookingsController.createBooking();
                      Get.back();
                    },
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Color(0xff4688FF),
                        borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockVertical * 20,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical * 10,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical * 15,
                        horizontal: SizeConfig.safeBlockHorizontal * 22,
                      ),
                      child: Center(
                        child: Text(
                          "Book For ₹${_price[totalHoursParking]}",
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
            );
          }
        });
  }
}

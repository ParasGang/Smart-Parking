import 'package:cerebro_smart_parking/controller/user_controller.dart';
import 'package:cerebro_smart_parking/main.dart';
import 'package:cerebro_smart_parking/views/checking.dart';
import 'package:cerebro_smart_parking/views/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cerebro_smart_parking/shared/size_config.dart';
import 'package:get/get.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OtpVerification extends StatefulWidget {
  final String verificationId;
  OtpVerification({this.verificationId});
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  Future<void> signIn(String oTP) async {
    print(otp);
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: oTP,
        ))
        .then((value) => Get.offAll(Checking()));
  }

  List otp = [];
  @override
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.safeBlockVertical * 20,
              horizontal: SizeConfig.safeBlockHorizontal * 10,
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: IconButton(
                  icon: Icon(
                    Ionicons.ios_arrow_round_back,
                    color: Colors.black,
                    size: SizeConfig.safeBlockHorizontal * 40,
                  ),
                  onPressed: null),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 35,
            ),
            child: Text(
              "Enter your code",
              style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.safeBlockVertical * 26,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 35,
            ),
            child: Text(
              "Please type the code we sent to",
              style: TextStyle(
                color: Color(0xff393E46),
                fontSize: SizeConfig.safeBlockVertical * 20,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 35,
            ),
            child: Text(
              "+91 9998985488",
              style: TextStyle(
                color: Color(0xff393E46),
                fontSize: SizeConfig.safeBlockVertical * 20,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 35,
              vertical: SizeConfig.safeBlockVertical * 20,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: SizeConfig.safeBlockVertical * 70,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: Colors.grey,
                        width: 3,
                      )),
                    ),
                    child: Center(
                      child: Text(
                        otp.length <= 0 ? '' : otp[0],
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.safeBlockHorizontal * 15),
                Expanded(
                  child: Container(
                    height: SizeConfig.safeBlockVertical * 70,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: Colors.grey,
                        width: 3,
                      )),
                    ),
                    child: Center(
                      child: Text(
                        otp.length <= 1 ? "" : otp[1],
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.safeBlockHorizontal * 15),
                Expanded(
                  child: Container(
                    height: SizeConfig.safeBlockVertical * 70,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: Colors.grey,
                        width: 3,
                      )),
                    ),
                    child: Center(
                      child: Text(
                        otp.length <= 2 ? "" : otp[2],
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.safeBlockHorizontal * 15),
                Expanded(
                  child: Container(
                    height: SizeConfig.safeBlockVertical * 70,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: Colors.grey,
                        width: 3,
                      )),
                    ),
                    child: Center(
                      child: Text(
                        otp.length <= 3 ? "" : otp[3],
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.safeBlockHorizontal * 15),
                Expanded(
                  child: Container(
                    height: SizeConfig.safeBlockVertical * 70,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: Colors.grey,
                        width: 3,
                      )),
                    ),
                    child: Center(
                      child: Text(
                        otp.length <= 4 ? "" : otp[4],
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.safeBlockHorizontal * 15),
                Expanded(
                  child: Container(
                    height: SizeConfig.safeBlockVertical * 70,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: Colors.grey,
                        width: 3,
                      )),
                    ),
                    child: Center(
                      child: Text(
                        otp.length <= 5 ? "" : otp[5],
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              var otpVerify = otp[0].toString() +
                  otp[1].toString() +
                  otp[2].toString() +
                  otp[3].toString() +
                  otp[4].toString() +
                  otp[5].toString();
              print(otpVerify);
              print(otpVerify.runtimeType);
              signIn(otpVerify);
            },
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xff2185C8),
                borderRadius: BorderRadius.circular(
                  SizeConfig.safeBlockVertical * 20,
                ),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 35,
                vertical: SizeConfig.safeBlockVertical * 20,
              ),
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical * 15,
                horizontal: SizeConfig.safeBlockHorizontal * 22,
              ),
              child: Center(
                child: Text(
                  "Let's Go",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.safeBlockVertical * 22,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OtpButton(
                  text: "1",
                  onTap: () {
                    if (otp.length <= 5) {
                      setState(
                        () {
                          otp.add("1");
                        },
                      );
                    }
                  },
                ),
                OtpButton(
                  text: "2",
                  onTap: () {
                    if (otp.length <= 5) {
                      setState(
                        () {
                          otp.add("2");
                        },
                      );
                    }
                  },
                ),
                OtpButton(
                  text: "3",
                  onTap: () {
                    if (otp.length <= 5) {
                      setState(
                        () {
                          otp.add("3");
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OtpButton(
                  text: "4",
                  onTap: () {
                    if (otp.length <= 5) {
                      setState(
                        () {
                          otp.add("4");
                        },
                      );
                    }
                  },
                ),
                OtpButton(
                  text: "5",
                  onTap: () {
                    if (otp.length <= 5) {
                      setState(
                        () {
                          otp.add("5");
                        },
                      );
                    }
                  },
                ),
                OtpButton(
                  text: "6",
                  onTap: () {
                    if (otp.length <= 5) {
                      setState(
                        () {
                          otp.add("6");
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OtpButton(
                  text: "7",
                  onTap: () {
                    if (otp.length <= 5) {
                      setState(
                        () {
                          otp.add("7");
                        },
                      );
                    }
                  },
                ),
                OtpButton(
                  text: "8",
                  onTap: () {
                    if (otp.length <= 5) {
                      setState(
                        () {
                          otp.add("8");
                        },
                      );
                    }
                  },
                ),
                OtpButton(
                  text: "9",
                  onTap: () {
                    if (otp.length <= 5) {
                      setState(
                        () {
                          otp.add("9");
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OtpButton(
                  text: "",
                  onTap: () {},
                ),
                OtpButton(
                  text: "0",
                  onTap: () {
                    if (otp.length <= 5) {
                      setState(
                        () {
                          otp.add("0");
                        },
                      );
                    }
                  },
                ),
                FlatButton(
                    onPressed: () {
                      if (otp.length >= 0) {
                        setState(() {
                          otp.removeLast();
                        });
                      }
                    },
                    child: Icon(Icons.backspace))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OtpButton extends StatelessWidget {
  final Function onTap;
  final text;
  OtpButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Text(
        text,
        textScaleFactor: 3.0,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:smart_parking/shared/size_config.dart';

// class Otp extends StatefulWidget {
//   @override
//   _OtpState createState() => _OtpState();
// }

// class _OtpState extends State<Otp> {
//   TextEditingController _first = TextEditingController();

//   TextEditingController _second = TextEditingController();

//   TextEditingController _third = TextEditingController();

//   TextEditingController _fourth = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     print(_second.text.length);
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 vertical: SizeConfig.safeBlockVertical * 20,
//                 horizontal: SizeConfig.safeBlockHorizontal * 10,
//               ),
//               child: IconButton(
//                   icon: Icon(
//                     Ionicons.ios_arrow_round_back,
//                     color: Colors.black,
//                     size: SizeConfig.safeBlockHorizontal * 40,
//                   ),
//                   onPressed: null),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: SizeConfig.safeBlockHorizontal * 35,
//               ),
//               child: Text(
//                 "Enter your code",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: SizeConfig.safeBlockVertical * 26,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: SizeConfig.safeBlockVertical * 5,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: SizeConfig.safeBlockHorizontal * 35,
//               ),
//               child: Text(
//                 "Please type the code we sent to",
//                 style: TextStyle(
//                   color: Color(0xff393E46),
//                   fontSize: SizeConfig.safeBlockVertical * 20,
//                   fontWeight: FontWeight.w100,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: SizeConfig.safeBlockHorizontal * 35,
//               ),
//               child: Text(
//                 "+91 9998985488",
//                 style: TextStyle(
//                   color: Color(0xff393E46),
//                   fontSize: SizeConfig.safeBlockVertical * 20,
//                   fontWeight: FontWeight.w100,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: SizeConfig.safeBlockVertical * 20,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: SizeConfig.safeBlockHorizontal * 35,
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       maxLength: 1,
//                       onChanged: (val) {
//                         setState(() {});
//                       },
//                       decoration: InputDecoration(
//                         counter: Offstage(),
//                       ),
//                       autofocus: _first.text.length == 0 ? false : true,
//                       enabled: _first.text.length == 1 ? false : true,
//                       controller: _first,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: SizeConfig.safeBlockVertical * 30,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: SizeConfig.safeBlockHorizontal * 15),
//                   Expanded(
//                       child: TextField(
//                     controller: _second,
//                     maxLength: 1,
//                     onChanged: (val) {
//                       setState(() {});
//                     },
//                     decoration: InputDecoration(
//                       counter: Offstage(),
//                     ),
//                     autofocus: _first.text.length == 0
//                         ? false
//                         : _second.text.length == 0
//                             ? true
//                             : false,
//                     enabled: _first.text.length == 0
//                         ? false
//                         : _second.text.length == 0
//                             ? true
//                             : false,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: SizeConfig.safeBlockVertical * 30,
//                     ),
//                   )),
//                   SizedBox(width: SizeConfig.safeBlockHorizontal * 15),
//                   Expanded(
//                       child: TextField(
//                     controller: _third,
//                   )),
//                   SizedBox(width: SizeConfig.safeBlockHorizontal * 15),
//                   Expanded(
//                       child: TextField(
//                     controller: _fourth,
//                   )),
//                 ],
//               ),
//             ),
//             Container(
//               width: double.maxFinite,
//               decoration: BoxDecoration(
//                 color: Color(0xff2185C8),
//                 borderRadius: BorderRadius.circular(
//                   SizeConfig.safeBlockVertical * 20,
//                 ),
//               ),
//               margin: EdgeInsets.symmetric(
//                 horizontal: SizeConfig.safeBlockHorizontal * 35,
//                 vertical: SizeConfig.safeBlockVertical * 30,
//               ),
//               padding: EdgeInsets.symmetric(
//                 vertical: SizeConfig.safeBlockVertical * 15,
//                 horizontal: SizeConfig.safeBlockHorizontal * 22,
//               ),
//               child: Center(
//                 child: Text(
//                   "Let's Go",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: SizeConfig.safeBlockVertical * 22,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

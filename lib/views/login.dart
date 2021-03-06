import 'package:cerebro_smart_parking/controller/user_controller.dart';
import 'package:cerebro_smart_parking/main.dart';
import 'package:cerebro_smart_parking/views/checking.dart';
import 'package:cerebro_smart_parking/views/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cerebro_smart_parking/services/phone_verification.dart';
import 'package:cerebro_smart_parking/shared/size_config.dart';
import 'package:cerebro_smart_parking/views/otp.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class Login extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String verificationId;
  Future<void> verifyPhoneNumber(
      BuildContext context, String phoneNumber) async {
    print("Hello World");
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential authCredential) async {
        print("Your account is successfully verified");
        print(authCredential.token);
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(authCredential);
        Get.find<UserController>().uid.value = userCredential.user.uid;
        Get.offAll(Checking());
      },
      verificationFailed: (FirebaseAuthException authException) {
        print("Authentication failed");
        print(authException.code);
      },
      codeSent: (String verId, [int forceCodeResent]) {
        verificationId = verId;
        print("OTP has been successfully send");
        readOtp();
        Get.to(OtpVerification());
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        print("Timeout");
      },
    );
  }

  void readOtp() async {
    String otpa = await SmsRetrieved.startListeningSms();
    Get.find<UserController>().otp.value = otpa;
  }

  TextEditingController _mobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: SizeConfig.safeBlockVertical * 870,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Image(
                    image: AssetImage("assets/logo.png"),
                  ),
                  Text(
                    "PARK AT HERE   ",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Color(0xff222831),
                        fontSize: SizeConfig.safeBlockVertical * 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: SizeConfig.safeBlockVertical * 30,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Color(0xff393E46),
                      fontSize: SizeConfig.safeBlockVertical * 48,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Enter your mobile number to login",
                    style: TextStyle(
                      color: Color(0xff8E8E8E),
                      fontSize: SizeConfig.safeBlockVertical * 18,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 15,
                  ),
                  Container(
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
                      horizontal: SizeConfig.safeBlockHorizontal * 35,
                      vertical: SizeConfig.safeBlockVertical * 10,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical * 12,
                      horizontal: SizeConfig.safeBlockHorizontal * 22,
                    ),
                    child: Row(
                      children: [
                        Flag(
                          "IN",
                          height: SizeConfig.safeBlockVertical * 24,
                          width: SizeConfig.safeBlockHorizontal * 36,
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 25,
                        ),
                        Expanded(
                          child: Text(
                            "India",
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockVertical * 20,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          size: SizeConfig.safeBlockVertical * 40,
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                      horizontal: SizeConfig.safeBlockHorizontal * 35,
                      vertical: SizeConfig.safeBlockVertical * 10,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical * 2,
                      horizontal: SizeConfig.safeBlockHorizontal * 22,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "+91",
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockVertical * 20,
                              color: Color(0xff8E8E8E)),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 25,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              return value.length != 10
                                  ? "Enter valid mobile number"
                                  : null;
                            },
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            controller: _mobile,
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockVertical * 20,
                            ),
                            decoration: InputDecoration(
                              counter: Offstage(),
                              hintText: "Mobile Number",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  bottom: 7, top: 11, right: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        String a = "+91 ";
                        a = a + _mobile.text;

                        verifyPhoneNumber(context, a);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff2185C8),
                        borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockVertical * 20,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 35,
                        vertical: SizeConfig.safeBlockVertical * 10,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical * 12,
                        horizontal: SizeConfig.safeBlockHorizontal * 22,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: SizeConfig.safeBlockVertical * 30,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 5,
                          ),
                          Text(
                            "Send Code",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockVertical * 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cerebro_smart_parking/controller/user_controller.dart';
import 'package:cerebro_smart_parking/views/add_vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cerebro_smart_parking/shared/size_config.dart';

class Register extends StatelessWidget {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController(text: "+91 ");
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: SizeConfig.safeBlockVertical * 870,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 35,
              ),
              child: Column(
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Color(0xff222831),
                        fontSize: SizeConfig.safeBlockVertical * 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Let's create your account",
                      style: TextStyle(
                        color: Color(0xffADA9A9),
                        fontSize: SizeConfig.safeBlockVertical * 18,
                      ),
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
                      vertical: SizeConfig.safeBlockVertical * 10,
                    ),
                    padding: EdgeInsets.symmetric(
                      //vertical: SizeConfig.safeBlockVertical * 5,
                      horizontal: SizeConfig.safeBlockHorizontal * 18,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.ios_person,
                          color: Color(0xff2185C8),
                          size: SizeConfig.safeBlockVertical * 30,
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _name,
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockVertical * 20,
                            ),
                            decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(color: Color(0xffA1A1A1)),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  bottom: 11, top: 11, right: 15),
                            ),
                          ),
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
                      vertical: SizeConfig.safeBlockVertical * 10,
                    ),
                    padding: EdgeInsets.symmetric(
                      //vertical: SizeConfig.safeBlockVertical * 5,
                      horizontal: SizeConfig.safeBlockHorizontal * 18,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.ios_mail,
                          color: Color(0xff2185C8),
                          size: SizeConfig.safeBlockVertical * 30,
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _email,
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockVertical * 20,
                            ),
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: Color(0xffA1A1A1)),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                bottom: 11,
                                top: 11,
                                right: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(
                  //       SizeConfig.safeBlockVertical * 20,
                  //     ),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.12),
                  //         offset: Offset(0, SizeConfig.safeBlockVertical * 2),
                  //         blurRadius: SizeConfig.safeBlockVertical * 5,
                  //       ),
                  //     ],
                  //   ),
                  //   margin: EdgeInsets.symmetric(
                  //     vertical: SizeConfig.safeBlockVertical * 10,
                  //   ),
                  //   padding: EdgeInsets.symmetric(
                  //     //vertical: SizeConfig.safeBlockVertical * 5,
                  //     horizontal: SizeConfig.safeBlockHorizontal * 18,
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.phone,
                  //         color: Color(0xff2185C8),
                  //         size: SizeConfig.safeBlockVertical * 30,
                  //       ),
                  //       SizedBox(
                  //         width: SizeConfig.safeBlockHorizontal * 20,
                  //       ),
                  //       Expanded(
                  //         child: TextFormField(
                  //           controller: _mobile,
                  //           style: TextStyle(
                  //             fontSize: SizeConfig.safeBlockVertical * 20,
                  //           ),
                  //           decoration: InputDecoration(
                  //             labelText: "Mobile Number",
                  //             labelStyle: TextStyle(color: Color(0xffA1A1A1)),
                  //             border: InputBorder.none,
                  //             focusedBorder: InputBorder.none,
                  //             enabledBorder: InputBorder.none,
                  //             errorBorder: InputBorder.none,
                  //             disabledBorder: InputBorder.none,
                  //             contentPadding: EdgeInsets.only(
                  //               bottom: 11,
                  //               top: 11,
                  //               right: 15,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  GestureDetector(
                    onTap: () {
                      UserController userController = Get.find();
                      userController.changeName(_name.text);
                      userController.changeEmail(_email.text);
                      Get.to(AddVehicle());
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
                        vertical: SizeConfig.safeBlockVertical * 10,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical * 15,
                        horizontal: SizeConfig.safeBlockHorizontal * 22,
                      ),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockVertical * 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

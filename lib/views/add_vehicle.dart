import 'package:cerebro_smart_parking/controller/user_controller.dart';
import 'package:cerebro_smart_parking/shared/size_config.dart';
import 'package:cerebro_smart_parking/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class AddVehicle extends StatelessWidget {
  TextEditingController _type = TextEditingController(text: "Car");
  TextEditingController _liscence_number = TextEditingController();
  TextEditingController _car_model = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 20,
                    vertical: SizeConfig.safeBlockVertical * 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Ionicons.ios_arrow_round_back,
                        color: Color(0xff222831),
                        size: SizeConfig.safeBlockVertical * 40,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Add Vehicle",
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
                Image(
                  height: SizeConfig.safeBlockVertical * 145,
                  width: SizeConfig.safeBlockHorizontal * 210,
                  image: AssetImage("assets/car.png"),
                ),
                SizedBox(
                  width: double.infinity,
                  height: SizeConfig.safeBlockVertical * 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 34,
                    ),
                    child: Text(
                      "Vehicle Details",
                      style: TextStyle(
                        color: Color(0xff222831),
                        fontSize: SizeConfig.safeBlockVertical * 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 34,
                    ),
                    child: Text(
                      "Add your vehicle details below",
                      style: TextStyle(
                        color: Color(0xffADA9A9),
                        fontSize: SizeConfig.safeBlockVertical * 18,
                      ),
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
                    horizontal: SizeConfig.safeBlockHorizontal * 35,
                  ),
                  padding: EdgeInsets.symmetric(
                    //vertical: SizeConfig.safeBlockVertical * 5,
                    horizontal: SizeConfig.safeBlockHorizontal * 18,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesome.car,
                        color: Color(0xff2185C8),
                        size: SizeConfig.safeBlockVertical * 30,
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          enabled: false,
                          controller: _type,
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockVertical * 20,
                          ),
                          decoration: InputDecoration(
                            labelText: "Type",
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
                    horizontal: SizeConfig.safeBlockHorizontal * 35,
                  ),
                  padding: EdgeInsets.symmetric(
                    //vertical: SizeConfig.safeBlockVertical * 5,
                    horizontal: SizeConfig.safeBlockHorizontal * 18,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesome.hashtag,
                        color: Color(0xff2185C8),
                        size: SizeConfig.safeBlockVertical * 30,
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _liscence_number,
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockVertical * 20,
                          ),
                          textCapitalization: TextCapitalization.characters,
                          decoration: InputDecoration(
                            labelText: "LICENSE PLATE NO",
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
                    horizontal: SizeConfig.safeBlockHorizontal * 35,
                  ),
                  padding: EdgeInsets.symmetric(
                    //vertical: SizeConfig.safeBlockVertical * 5,
                    horizontal: SizeConfig.safeBlockHorizontal * 18,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Ionicons.ios_settings,
                        color: Color(0xff2185C8),
                        size: SizeConfig.safeBlockVertical * 30,
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _car_model,
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockVertical * 20,
                          ),
                          decoration: InputDecoration(
                            labelText: "Car model",
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
                GestureDetector(
                  onTap: () async {
                    UserController userController = Get.find();

                    userController.changeCarModel(_car_model.text);
                    userController.changeLicenseNumber(_liscence_number.text);
                    print(userController.carModel);
                    await userController.registerUser();
                    Get.offAll(HomePage());
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
                        "Add Vehicle",
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
        ),
      ),
    );
  }
}

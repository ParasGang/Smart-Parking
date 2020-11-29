import 'package:cerebro_smart_parking/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:cerebro_smart_parking/shared/size_config.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  UserController userController = Get.find();

  TextEditingController _name = TextEditingController();

  TextEditingController _email = TextEditingController();
  TextEditingController _liscenceNumber = TextEditingController();
  TextEditingController _carModel = TextEditingController();

  @override
  void initState() {
    _name.text = userController.name.value;
    _email.text = userController.email.value;
    _liscenceNumber.text = userController.liscenseNumber.value;
    _carModel.text = userController.carModel.value;
    print(userController.liscenseNumber.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: userController.updateUserLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
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
                                "My Profile",
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
                    Spacer(
                      flex: 2,
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
                            Ionicons.ios_person,
                            color: Color(0xff2185C8),
                            size: SizeConfig.safeBlockVertical * 30,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              // initialValue: userController.name.value,
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
                        horizontal: SizeConfig.safeBlockHorizontal * 35,
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
                              // initialValue: userController.email.value,
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
                              controller: _liscenceNumber,
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
                              controller: _carModel,
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
                      onTap: () {
                        userController.changeName(_name.text);
                        userController.changeEmail(_email.text);
                        userController
                            .changeLicenseNumber(_liscenceNumber.text);
                        userController.changeCarModel(_carModel.text);
                        userController.updateUser();
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
                          horizontal: SizeConfig.safeBlockHorizontal * 35,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 15,
                          horizontal: SizeConfig.safeBlockHorizontal * 22,
                        ),
                        child: Center(
                          child: Text(
                            "Update Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockVertical * 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                ),
        );
      }),
    );
  }
}

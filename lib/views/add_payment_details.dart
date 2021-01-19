import 'package:cerebro_smart_parking/controller/payment_controller.dart';
import 'package:cerebro_smart_parking/controller/user_controller.dart';
import 'package:cerebro_smart_parking/shared/size_config.dart';
import 'package:cerebro_smart_parking/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class AddPaymentDetails extends StatelessWidget {
  TextEditingController _cardHolderName = TextEditingController();
  TextEditingController _cardNumber = TextEditingController();
  TextEditingController _expiryDate = TextEditingController();
  TextEditingController _cvv = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Form(
            key: _formKey,
            child: Column(
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
                            "Add Payment Info",
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
                  image: AssetImage("assets/parking.png"),
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
                      "Add Credit/Debit Card",
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
                      "Please add your card details",
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
                        Ionicons.ios_person,
                        color: Color(0xff2185C8),
                        size: SizeConfig.safeBlockVertical * 30,
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          validator: (val) {
                            return _cardHolderName.text.length == 0
                                ? "Enter Card Holder Name"
                                : null;
                          },
                          controller: _cardHolderName,
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockVertical * 20,
                          ),
                          decoration: InputDecoration(
                            labelText: "Card Holder Name",
                            labelStyle: TextStyle(color: Color(0xffA1A1A1)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(bottom: 11, top: 11, right: 15),
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
                          validator: (val) {
                            Pattern pattern = r'^[0-9]{4}[0-9]{4}[0-9]{4}$';
                            RegExp regex = new RegExp(pattern);
                            if (!regex.hasMatch(val))
                              return 'Enter Valid Card Number';
                            else
                              return null;
                          },
                          controller: _cardNumber,
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockVertical * 20,
                          ),
                          textCapitalization: TextCapitalization.characters,
                          decoration: InputDecoration(
                            labelText: "Card Number",
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              SizeConfig.safeBlockVertical * 20,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.12),
                                offset:
                                    Offset(0, SizeConfig.safeBlockVertical * 2),
                                blurRadius: SizeConfig.safeBlockVertical * 5,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(
                            top: SizeConfig.safeBlockVertical * 10,
                            bottom: SizeConfig.safeBlockVertical * 10,
                            right: SizeConfig.safeBlockHorizontal * 15,
                            left: SizeConfig.safeBlockHorizontal * 35,
                          ),
                          padding: EdgeInsets.symmetric(
                            //vertical: SizeConfig.safeBlockVertical * 5,
                            horizontal: SizeConfig.safeBlockHorizontal * 18,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal * 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _expiryDate,
                                  style: TextStyle(
                                    fontSize: SizeConfig.safeBlockVertical * 20,
                                  ),
                                  validator: (val) {
                                    return _expiryDate.text.length == 0
                                        ? "Enter Expiry Date"
                                        : null;
                                  },
                                  maxLength: 5,
                                  decoration: InputDecoration(
                                    labelText: "Expiry Date",
                                    counter: Offstage(),
                                    labelStyle:
                                        TextStyle(color: Color(0xffA1A1A1)),
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
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              SizeConfig.safeBlockVertical * 20,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.12),
                                offset:
                                    Offset(0, SizeConfig.safeBlockVertical * 2),
                                blurRadius: SizeConfig.safeBlockVertical * 5,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(
                            top: SizeConfig.safeBlockVertical * 10,
                            bottom: SizeConfig.safeBlockVertical * 10,
                            right: SizeConfig.safeBlockHorizontal * 35,
                            left: SizeConfig.safeBlockHorizontal * 15,
                          ),
                          padding: EdgeInsets.symmetric(
                            //vertical: SizeConfig.safeBlockVertical * 5,
                            horizontal: SizeConfig.safeBlockHorizontal * 18,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal * 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  validator: (val) {
                                    return _cvv.text.length != 3
                                        ? "Enter a valid CVV Number"
                                        : null;
                                  },
                                  controller: _cvv,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    fontSize: SizeConfig.safeBlockVertical * 20,
                                  ),
                                  obscureText: true,
                                  obscuringCharacter: "*",
                                  maxLength: 3,
                                  decoration: InputDecoration(
                                    labelText: "CVV",
                                    counter: Offstage(),
                                    labelStyle:
                                        TextStyle(color: Color(0xffA1A1A1)),
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
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      Get.find<PaymentController>().payment.value = true;
                      Get.back();
                    }
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Ionicons.ios_wallet,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 5,
                        ),
                        Text(
                          "Link Wallet",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockVertical * 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

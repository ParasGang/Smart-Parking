import 'package:cerebro_smart_parking/controller/user_controller.dart';
import 'package:cerebro_smart_parking/views/home_page.dart';
import 'package:cerebro_smart_parking/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checking extends StatefulWidget {
  @override
  _CheckingState createState() => _CheckingState();
}

class _CheckingState extends State<Checking> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return userController.loading.value == true
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : userController.registered == true
              ? HomePage()
              : Register();
    });
  }
}

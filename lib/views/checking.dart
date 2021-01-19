import 'package:cerebro_smart_parking/controller/user_controller.dart';
import 'package:cerebro_smart_parking/views/add_payment_details.dart';
import 'package:cerebro_smart_parking/views/home_page.dart';
import 'package:cerebro_smart_parking/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checking extends StatelessWidget {
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    print("Checking Page");

    return Obx(() {
      return userController.loading.value == true
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : userController.registered.value == true
              ? HomePage()
              : Register();
    });
  }
}

import 'package:cerebro_smart_parking/views/checking.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cerebro_smart_parking/views/add_vehicle.dart';
import 'package:cerebro_smart_parking/views/home_page.dart';
import 'package:cerebro_smart_parking/views/login.dart';
import 'package:cerebro_smart_parking/views/my_account.dart';
import 'package:cerebro_smart_parking/views/my_profile.dart';
import 'package:cerebro_smart_parking/views/otp.dart';
import 'package:cerebro_smart_parking/views/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: Color(0xffF6F6F6),
        ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return Checking();
            } else if (userSnapshot.hasError) {
              return CircularProgressIndicator();
            }
            return Login();
          },
        ));
  }
}

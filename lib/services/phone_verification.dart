import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cerebro_smart_parking/views/otp.dart';

class PhoneVerification {
  String verificationId;
  Future<void> verifyPhoneNumber(
      BuildContext context, String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 15),
      verificationCompleted: (AuthCredential authCredential) {
        print("Your account is successfully verified");
      },
      verificationFailed: (FirebaseAuthException authException) {
        print("Authentication failed");
      },
      codeSent: (String verId, [int forceCodeResent]) {
        verificationId = verId;
        print("OTP has been successfully send");
        Get.to(OtpVerification());
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        print("Timeout");
      },
    );
  }

  Future<void> signIn(String otp) async {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var uid = "".obs;
  var name = "".obs;
  var mobile = "".obs;
  var email = "".obs;
  var liscenseNumber = "".obs;
  var carModel = "".obs;
  var loading = true.obs;
  var updateUserLoading = false.obs;
  var registered = false.obs;

  @override
  void onInit() async {
    User user = await FirebaseAuth.instance.currentUser;
    print(user.uid);
    uid.value = user.uid;
    mobile.value = user.phoneNumber;
    print(user.uid);
    await getUserDetails();

    loading.value = false;
    super.onInit();
  }

  getUserDetails() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");
    DocumentSnapshot documentSnapshot =
        await collectionReference.doc(uid.value).get();

    if (documentSnapshot.exists) {
      registered.value = true;
      name.value = documentSnapshot.data()['name'];
      email.value = documentSnapshot.data()['email'];
      carModel.value = documentSnapshot.data()['carModel'];
      liscenseNumber.value = documentSnapshot.data()['licenseNumber'];
    } else {
      registered.value = false;
    }
  }

  registerUser() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");
    await collectionReference
        .doc(uid.value)
        .set({
          'name': name.value,
          'email': email.value,
          'carModel': carModel.value,
          'licenseNumber': liscenseNumber.value
        })
        .then((value) => print("New User Registered"))
        .catchError((e) => print("Failed to add user: $e"));
  }

  updateUser() async {
    updateUserLoading.value = true;
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");
    await collectionReference
        .doc(uid.value)
        .update({
          'name': name.value,
          'email': email.value,
          'carModel': carModel.value,
          'licenseNumber': liscenseNumber.value
        })
        .then((value) => print("User Details Updated"))
        .catchError((e) => print("Failed to add user: $e"));
    updateUserLoading.value = false;
  }

  void changeUid(String id) {
    uid.value = id;
  }

  void changeName(String a) {
    name.value = a;
  }

  void changeEmail(String mail) {
    email.value = mail;
  }

  void changePhoneNumber(String phone) {
    mobile.value = phone;
  }

  void changeLicenseNumber(String number) {
    liscenseNumber.value = number;
  }

  void changeCarModel(String model) {
    carModel.value = model;
  }
}

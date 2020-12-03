import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Parkingcontroller extends GetxController {
  var emptySlots = 0.obs;
  BuildContext context;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  getSlotsDetails(BuildContext context) async {
    StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('parking')
          .where('locationid', isEqualTo: 1)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        emptySlots.value = snapshot.data.docs[0]['emptySlots'];
      },
    );
  }
}

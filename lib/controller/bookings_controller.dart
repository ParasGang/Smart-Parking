import 'package:cerebro_smart_parking/models/booking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BookingsController extends GetxController {
  Rx<Booking> booking = Booking().obs;

  createBooking() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("booking");
    await collectionReference
        .add({
          'uid': booking.value.uid,
          'date': booking.value.date,
          'startTime': booking.value.startTime,
          'endTime': booking.value.endTime,
          'totalHours': booking.value.totalHours,
          'location': booking.value.location,
          'address': booking.value.address,
          'price': booking.value.price,
          'locationId': booking.value.locationid,
          'month': booking.value.month,
          'year': booking.value.year,
          'date1': booking.value.date1,
          'start': booking.value.start,
          'end': booking.value.end,
        })
        .then((value) => print("New Booking Created"))
        .catchError((e) => print("Failed to create booking: $e"));
  }
}

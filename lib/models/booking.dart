import 'package:cerebro_smart_parking/views/bookings.dart';

class Booking {
  String uid;
  DateTime date;
  var startTime;
  var endTime;
  int totalHours;
  String location;
  String address;
  int price;
  int locationid;
  int date1;
  String month;
  int year;
  Booking(
      {this.uid,
      this.date,
      this.address,
      this.endTime,
      this.location,
      this.price,
      this.startTime,
      this.totalHours,
      this.locationid,
      this.date1,
      this.month,
      this.year});
}

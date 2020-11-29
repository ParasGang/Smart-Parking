import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var page = 1.obs;
  void changePage(int p) {
    page.value = p;
  }
}

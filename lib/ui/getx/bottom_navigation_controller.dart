import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  int selectedIndex = 0;
  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }
}

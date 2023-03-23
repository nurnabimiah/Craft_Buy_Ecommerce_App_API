import 'package:craft_buy/ui/getx/auth_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  //new add this line
  final AuthController authController = Get.put(AuthController());

  int selectedIndex = 0;
  void changeIndex(int index) {
    //new code add
    if (index == 2 || index == 3) {
      //jodi login kora thake tahole jabe na hole take seikhan
      // thekhe return kore dibe
      if (!authController.cheackAuthState()) {
        return;
      }
    }
    // change the index
    selectedIndex = index;
    update();
  }
}

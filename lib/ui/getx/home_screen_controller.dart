import 'package:craft_buy/data/models/product_slider_model.dart';
import 'package:craft_buy/data/network_utils.dart';
import 'package:craft_buy/data/urls.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ProductSliderModel productSliderModel = ProductSliderModel();
  bool getProgressSliderInprogress = false;

  Future<bool> getProductSliderList() async {
    getProgressSliderInprogress = true;
    update();
    final result = await NetworkUtils().getMethod(Urls.productSliderUrl);
    getProgressSliderInprogress = false;
    if (result != null) {
      productSliderModel = ProductSliderModel.fromJson(result);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}

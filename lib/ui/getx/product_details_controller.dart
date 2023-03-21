import 'package:craft_buy/data/models/product_details_model.dart';
import 'package:craft_buy/data/network_utils.dart';
import 'package:craft_buy/data/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsModel productDetailsModel = ProductDetailsModel();
  bool getProuctDetailsInprogress = false;

  Future<bool> getProductDetailsById(int id) async {
    getProuctDetailsInprogress = true;
    update();
    final response =
        await NetworkUtils().getMethod(Urls.productDetailsByIdUrl(id));
    getProuctDetailsInprogress = false;

    if (response != null && response['msg'] == 'success') {
      productDetailsModel = ProductDetailsModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}

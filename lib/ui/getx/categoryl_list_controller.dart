import 'package:craft_buy/data/models/category_list_model.dart';
import 'package:craft_buy/data/network_utils.dart';
import 'package:craft_buy/data/urls.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  CategoryListModel categoryListModel = CategoryListModel();
  bool getCategoryInprogress = false;

  Future<bool> getCategories() async {
    getCategoryInprogress = true;
    update();
    final response =
        await NetworkUtils().getMethod(Urls.productCategoryListUrl);
    if (response != null) {
      getCategoryInprogress = false;
      categoryListModel = CategoryListModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}

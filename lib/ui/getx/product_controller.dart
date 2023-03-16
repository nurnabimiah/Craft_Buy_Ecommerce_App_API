import 'dart:developer';

import 'package:craft_buy/data/models/product_model.dart';
import 'package:craft_buy/data/network_utils.dart';
import 'package:craft_buy/data/urls.dart';
import 'package:get/get.dart';

///.....enum ekta data type j kina predefine value golo k diye dei
///........jokhn enum data typer er mddde kono  value k assign kora hobe
///........tokhn eder mddde jekono ekta k diye ditei hobe
/*
enum ProductRemarks {
  popular,
  special,
  new
};
*/

class ProductController extends GetxController {
  ProductModel popularProductModel = ProductModel();
  ProductModel specialProductModel = ProductModel();
  ProductModel newProductModel = ProductModel();

  bool popularInProgress = false;
  bool specialInProgress = false;
  bool newInProgress = false;

  /// .......pupular.............

  Future<bool> getPopularProducts() async {
    popularInProgress = true;
    update();
    final response =
        await NetworkUtils().getMethod(Urls.productByRemarksUrl('popular'));
    log(response.runtimeType.toString());
    popularInProgress = false;
    if (response != null && response['msg'] == 'success') {
      popularProductModel = ProductModel.fromJson(response);
      update();
      return true;
    } else {
      log(response);
      update();
      return false;
    }
  }

  ///.................new.........

  Future<bool> getNewProducts() async {
    newInProgress = true;
    update();
    final response =
        await NetworkUtils().getMethod(Urls.productByRemarksUrl('new'));
    newInProgress = false;
    if (response != null && response['msg'] == 'success') {
      newProductModel = ProductModel.fromJson(response);
      update();
      return true;
    } else {
      log(response);
      update();
      return false;
    }
  }

  ///....................special......................

  Future<bool> getSpecialProducts() async {
    specialInProgress = true;
    update();
    final response =
        await NetworkUtils().getMethod(Urls.productByRemarksUrl('special'));
    specialInProgress = false;
    if (response != null && response['msg'] == 'success') {
      specialProductModel = ProductModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  /*Future<bool> getProductsByCategory(String categoryId) async {
    productByCategoryInProgress = true;
    update();
    final response =
    await NetworkUtils().getMethod(Urls.productByCategoryUrl(categoryId));
    productByCategoryInProgress = false;
    if (response != null && response['msg'] == 'success') {
      productByCategoryModel = ProductModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }*/
}

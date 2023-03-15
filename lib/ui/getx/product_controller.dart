import 'package:craft_buy/data/models/product_model.dart';
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


  Future<bool> getProductByRemarks(String productRemarks) async{

    final response =

  }


}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/product_details_model.dart';
import '../getx/product_details_controller.dart';
import '../reusable_widgets/app_elevated_button.dart';
import '../reusable_widgets/increment_decremetns_fileds.dart';
import '../reusable_widgets/product_details/product_image_slider.dart';
import '../utils/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController =
      Get.put(ProductDetailsController());

  Color? selectedColor;
  String? selectedSize;
  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productDetailsController.getProductDetailsById(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black54,
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.getProuctDetailsInprogress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final ProductDetialsData productDetailsData =
              productDetailsController.productDetailsModel.data!.first;

          final List<Color> avialAbleColor =
              getColorFromString(productDetailsData.color ?? '');

          final List<String> avilAbleSizes =
              getSizesFromString(productDetailsData.size ?? '');

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageSlider(
                        sliders: [
                          productDetailsData.img1 ?? '',
                          productDetailsData.img2 ?? '',
                          productDetailsData.img3 ?? '',
                          productDetailsData.img4 ?? '',
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    productDetailsData.product?.title ?? '',
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54),
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  child: IncDecFormFiled(),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text((productDetailsData.product?.star ?? 0.0)
                                    .toStringAsFixed(1)),
                                const SizedBox(
                                  width: 8,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Reviews',
                                    style:
                                        TextStyle(color: AppColor.primaryColor),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              'Color',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 8,
                            ),

                            ///....................color.....................
                            ///........not clear the concept.......
                            Row(
                              children: [
                                for (int i = 0; i < avialAbleColor.length; i++)

                                  ///jokhon tap korbe selected color ta select hoye
                                  ///jabe
                                  GestureDetector(
                                    onTap: () {
                                      selectedColor = avialAbleColor[i];
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: avialAbleColor[i],
                                          child:
                                              selectedColor == avialAbleColor[i]
                                                  ? Icon(Icons.check)
                                                  : null),
                                    ),
                                  )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const SizedBox(
                              height: 16,
                            ),

                            /// ................size..............part

                            const Text(
                              'Size',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),

                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                for (int i = 0; i < avilAbleSizes.length; i++)
                                  GestureDetector(
                                    onTap: () {
                                      selectedSize = avilAbleSizes[i];
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color:
                                                selectedSize == avilAbleSizes[i]
                                                    ? AppColor.primaryColor
                                                        .withOpacity(0.8)
                                                    : null,
                                            border: Border.all(
                                                color: Colors.black54,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text(avilAbleSizes[i]),
                                      ),
                                    ),
                                  )
                              ],
                            ),

                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              'Description',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              productDetailsData.des ?? '',
                              style: const TextStyle(
                                  fontSize: 13,
                                  letterSpacing: 0.2,
                                  color: Colors.black54),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.20),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Price',
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                        Text(
                          '\$1200',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                        width: 120,
                        child:
                            AppElevatedBtn(text: 'Add to Cart', onTap: () {})),
                  ],
                ),
              )
            ],
          );
        }
      }),
    );
  }

  /// .............we spearate  to clor from api..........
  /// ............we convert to hexacolor
  /// ............every api color store in this element
  List<Color> getColorFromString(String colors) {
    List<Color> hexaColor = [];
    final List<String> allColors = colors.split(',');
    for (var element in allColors) {
      hexaColor.add(HexColor(element));
    }

    return hexaColor;
  }

  ///..........size method create

  List<String> getSizesFromString(String sizes) {
    return sizes.split(',');
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

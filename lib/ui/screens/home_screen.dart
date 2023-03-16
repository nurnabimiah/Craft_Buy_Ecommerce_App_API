import 'package:carousel_slider/carousel_slider.dart';
import 'package:craft_buy/ui/getx/bottom_navigation_controller.dart';
import 'package:craft_buy/ui/getx/categoryl_list_controller.dart';
import 'package:craft_buy/ui/getx/home_screen_controller.dart';
import 'package:craft_buy/ui/getx/product_controller.dart';
import 'package:craft_buy/ui/screens/produt_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../reusable_widgets/category_item_widget.dart';
import '../reusable_widgets/home/home_banner_slider.dart';
import '../reusable_widgets/home/section_header.dart';
import '../reusable_widgets/product__preview_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BottomNavigationBarController bottomNavigationController =
      Get.put(BottomNavigationBarController());

  final CarouselController _carouselController = CarouselController();
  final ValueNotifier<int> _currentSelectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset('assests/images/logo_nav.png'),
        actions: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              Icons.person,
              size: 18,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              Icons.call,
              size: 18,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              Icons.notifications_active,
              size: 18,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(

                    ///.....if we want to decrease the textform filed size
                    ///.....we use to the content padding ....
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              const SizedBox(
                height: 16,
              ),

              GetBuilder<HomeController>(
                ///......this home controller intstace = HomeController
                /// ....ei builder er kaj holo jokhon notun kono value update hobe
                ///  ....mane jokhon amra update methhod ta call kori tokhon value ta update hoy
                ///   .....
                builder: (homeController) {
                  if (homeController.getProgressSliderInprogress) {
                    return CircularProgressIndicator();
                  } else {
                    return HomeBannerSlider(
                      productSliderModel: homeController.productSliderModel,
                    );
                  }
                },
              ),

              const SizedBox(
                height: 48,
              ),

              ///........categories...........
              SectionHeader(
                headerName: 'Categories',
                onTapSeeAll: () {
                  bottomNavigationController.changeIndex(1);
                },
              ),

              GetBuilder<CategoryListController>(
                builder: (conroller) {
                  if (conroller.getCategoryInprogress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SizedBox(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              conroller.categoryListModel.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return CategoryItemWidget(
                              categoryItemName: conroller.categoryListModel
                                      .data![index].categoryName ??
                                  '',
                              image: conroller.categoryListModel.data![index]
                                      .categoryImg ??
                                  '',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductListScreen(
                                              categoryId:
                                                  "${conroller.categoryListModel.data![index].id ?? '1'}",
                                              categoryName: conroller
                                                      .categoryListModel
                                                      .data![index]
                                                      .categoryName ??
                                                  '',
                                            )));
                              },
                            );
                          }),
                    );
                  }
                },
              ),

              ///.........popular .........

              const SizedBox(
                height: 48,
              ),

              SectionHeader(
                headerName: 'Popular',
                onTapSeeAll: () {},
              ),
              GetBuilder<ProductController>(builder: (productController) {
                if (productController.popularInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        productController.popularProductModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ProductItemPreviewCard(
                        productData:
                            productController.popularProductModel.data![index],
                      );
                    },
                  ),
                );
              }),

              ///.....special............
              const SizedBox(
                height: 48,
              ),
              SectionHeader(
                headerName: 'Special',
                onTapSeeAll: () {},
              ),
              GetBuilder<ProductController>(builder: (productController) {
                if (productController.specialInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        productController.specialProductModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ProductItemPreviewCard(
                        productData:
                            productController.specialProductModel.data![index],
                      );
                    },
                  ),
                );
              }),

              ///............new.........
              const SizedBox(
                height: 48,
              ),
              SectionHeader(
                headerName: 'New',
                onTapSeeAll: () {},
              ),

              GetBuilder<ProductController>(builder: (productController) {
                if (productController.newInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        productController.newProductModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ProductItemPreviewCard(
                        productData:
                            productController.newProductModel.data![index],
                      );
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

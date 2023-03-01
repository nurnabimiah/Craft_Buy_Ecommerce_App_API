import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
              HomeBannerSlider(
                  carouselController: _carouselController,
                  currentSelectedIndex: _currentSelectedIndex),
              const SizedBox(
                height: 48,
              ),
              SectionHeader(
                headerName: 'Categories',
                onTapSeeAll: () {},
              ),
              /*ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (_, __) {
                    return CategoryItemWidget(
                      CategoryItemName: 'Electronics',
                      icon: Icons.computer,
                      onTap: () {},
                    );
                  }),*/
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryItemWidget(
                      CategoryItemName: 'Electronics',
                      icon: Icons.computer,
                      onTap: () {},
                    ),
                    CategoryItemWidget(
                      CategoryItemName: 'Watch',
                      icon: Icons.watch,
                      onTap: () {},
                    ),
                    CategoryItemWidget(
                      CategoryItemName: 'Book',
                      icon: Icons.book,
                      onTap: () {},
                    ),
                    CategoryItemWidget(
                      CategoryItemName: 'tools',
                      icon: Icons.add_business,
                      onTap: () {},
                    ),
                    CategoryItemWidget(
                      CategoryItemName: 'Electronics',
                      icon: Icons.computer,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              ///.........popular .........
              const SizedBox(
                height: 48,
              ),
              SectionHeader(
                headerName: 'Popular',
                onTapSeeAll: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    ProductItemPreviewCard(),
                    SizedBox(
                      width: 5,
                    ),
                    ProductItemPreviewCard(),
                    SizedBox(
                      width: 5,
                    ),
                    ProductItemPreviewCard(),
                    SizedBox(
                      width: 5,
                    ),
                    ProductItemPreviewCard(),
                    SizedBox(
                      width: 5,
                    ),
                    ProductItemPreviewCard(),
                  ],
                ),
              ),

              ///.....special............
              const SizedBox(
                height: 48,
              ),
              SectionHeader(
                headerName: 'Special',
                onTapSeeAll: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    ProductItemPreviewCard(),
                    SizedBox(
                      width: 5,
                    ),
                    ProductItemPreviewCard(),
                    SizedBox(
                      width: 5,
                    ),
                    ProductItemPreviewCard(),
                    SizedBox(
                      width: 5,
                    ),
                    ProductItemPreviewCard(),
                    SizedBox(
                      width: 5,
                    ),
                    ProductItemPreviewCard(),
                  ],
                ),
              ),

              ///............new.........
              const SizedBox(
                height: 48,
              ),
              SectionHeader(
                headerName: 'New',
                onTapSeeAll: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    ProductItemPreviewCard(),
                    SizedBox(
                      width: 5,
                    ),
                    ProductItemPreviewCard(),
                    SizedBox(
                      width: 5,
                    ),
                    ProductItemPreviewCard(),
                    SizedBox(
                      width: 5,
                    ),
                    ProductItemPreviewCard(),
                    SizedBox(
                      width: 5,
                    ),
                    ProductItemPreviewCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

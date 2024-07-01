import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dummy_product.dart';
import '../utils/app_colors.dart';
import '../widget/product_slider.dart';
import '../widget/product_tab.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primarycolor,
        title: Text(
          'Subscriptions Product',
          style: TextStyle(fontSize: 21, color: Colors.white.withOpacity(0.8)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            ProductSlider(),

            SizedBox(
              height: 10.h,
            ),

            DefaultTabController(
              length: getUniqueCategories().length,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    indicatorWeight: 2.0,
                    indicatorColor: AppColors.primarycolor,
                    labelColor: Colors.black,
                    tabs: getUniqueCategories().map((category) {
                      return Tab(
                        text: category,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 400.h,
                    child:  TabBarView(
                      children: getUniqueCategories().map((category) {

                        return ProductTab(category:category);
                      }).toList(),
                    ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Set<String> getUniqueCategories() {
  Set<String> categories = Set<String>();
  for (var product in productJSON) {
    categories.add(product['category'] as String);
  }
  return categories;
}

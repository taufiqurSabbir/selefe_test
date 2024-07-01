import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:selefe_test/view/utils/app_colors.dart';
import 'package:selefe_test/view/widget/product_discount.dart';
import 'package:selefe_test/view/widget/product_image.dart';
import 'package:selefe_test/view/widget/small_button.dart';

import '../dummy_product.dart';
import '../screens/daily_plan.dart';
import '../screens/product_details.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  late List<Map<String, dynamic>> categoryProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    categoryProducts = productJSON
        .where((product) => product['category'] == widget.category)
        .toList();
    print('category product ==== ${categoryProducts}');

  }



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categoryProducts.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> product = categoryProducts[index];
          String image = product['image'] ?? '';
          String name = product['name'] ?? '';
          String weight = product['minorder'].toString() ?? '';
          String price = product['price'].toString() ?? '';
          bool havediscount = product['ishavediscount'] ?? false ;
          String discount = product['discountamount'].toString() ?? '';
        return Column(
          children: [
            SizedBox(height: 20.h,),
            InkWell(
              onTap: (){
                Get.to(ProductDetails(selectedProduct: product,));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  productImage(image: image, havediscount: havediscount, discount: discount),
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "${weight} kg",
                        style: TextStyle(color: Colors.black.withOpacity(0.9)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SmallButton(
                        title: 'Subscribe',
                        onTap: () {
                          Get.to(DailyPlan(product:product));
                        },
                      )
                    ],
                  ),
                  Divider(),
                  Text(
                    'TK ${price}',
                    style: TextStyle(
                        color: AppColors.primarycolor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Divider(),
                ],
              ),
            ),
            if (index == categoryProducts.length - 1) SizedBox(height: 40.h),
          ],
        );
      }
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:selefe_test/view/utils/app_colors.dart';
import 'package:selefe_test/view/widget/product_discount.dart';
import 'package:selefe_test/view/widget/small_button.dart';

import '../dummy_product.dart';
import '../screens/product_details.dart';

class SuscribeProduct extends StatefulWidget {
  const SuscribeProduct({Key? key, required this.selectedProduct})
      : super(key: key);
  final Map<String, dynamic> selectedProduct;

  @override
  State<SuscribeProduct> createState() => _SuscribeProductState();
}

class _SuscribeProductState extends State<SuscribeProduct> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> product = widget.selectedProduct;
    String image = product['image'] ?? '';
    String name = product['name'] ?? '';
    String weight = product['minorder'].toString() ?? '';
    String price = product['price'].toString() ?? '';
    bool havediscount = product['ishavediscount'] ?? false;
    String discount = product['discountamount'].toString() ?? '';
    String subscribe = product['subscribed'].toString() ?? '';
    String oldprice = product['oldPrice'].toString() ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            Get.to(ProductDetails(
              selectedProduct: product,
            ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              Container(
                height: 100.h,
                width: 110.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange.shade200, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.network(fit: BoxFit.cover, image),
                  ),
                ),
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "${weight} kg",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 16),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),

                  Row(
                    children: [
                      Text(
                        'TK ${price}',
                        style: TextStyle(
                            color: AppColors.primarycolor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,),
                      ),

                      SizedBox(width: 10.w,),
                      Text(
                        'TK ${oldprice}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough
                        ),
                      ),

                    ],
                  ),
                  havediscount
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text('Save ${discount} % off'),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Text(
                  '${subscribe} Subscribed',
                  style: TextStyle(
                      color: AppColors.primarycolor, fontWeight: FontWeight.w500),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}

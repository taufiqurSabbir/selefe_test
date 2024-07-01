import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selefe_test/view/widget/product_discount.dart';

class productImage extends StatelessWidget {
  const productImage({
    super.key,
    required this.image,
    required this.havediscount,
    required this.discount,
  });

  final String image;
  final bool havediscount;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [


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
              child: Image.network(
                  fit: BoxFit.cover,
                  image),
            ),
          ),
        ),


        havediscount ?   ProductDiscount(discount: discount,) : SizedBox(),

      ],
    );
  }
}


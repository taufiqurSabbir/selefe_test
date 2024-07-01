import 'package:flutter/material.dart';

class ProductDiscount extends StatelessWidget {
  const ProductDiscount({
    super.key, required this.discount,
  });
final String discount;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -10,
      left: 15,
      right: 15,
      child: Container(
        height: 22,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          'Save ${discount}% off',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selefe_test/view/utils/app_colors.dart';
import '../widget/subscribe_product.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.selectedProduct});

  final Map<String, dynamic> selectedProduct;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Set<int> expandedTiles = Set<int>(); // Track expanded tiles by index

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> product = widget.selectedProduct;
    String image = product['image'] ?? '';
    String name = product['name'] ?? '';
    String weight = product['minorder'].toString() ?? '';
    String price = product['price'].toString() ?? '';
    bool havediscount = product['ishavediscount'] ?? false;
    String discount = product['discountamount'].toString() ?? '';
    String details = product['details'].toString() ?? '';
    List<Map<String, String>> faq =
        List<Map<String, String>>.from(product['FAQ'] ?? []);
    double rating = product['review']?['rating']?.toDouble() ?? 0.0;
    int reviewCount = product['review']?['count']?.toInt() ?? 0;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            'Details For Subscribe',
            style: TextStyle(fontSize: 21, color: Colors.white),
          ),
          backgroundColor: AppColors.primarycolor,
        ),
        body: Column(
          children: [
            SizedBox(height: 20.h),
            SuscribeProduct(selectedProduct: product),
            TabBar(
              indicatorColor: AppColors.primarycolor,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                    text: 'Details',),
                Tab(text: 'Review ${rating} ⭐ (120+)'),
              ],
            ),
            Expanded(
              child: TabBarView(

                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(details),
                          SizedBox(height: 20.h),
                          Text(
                            'Faq About This product',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          ...List.generate(faq.length, (index) {
                            return ExpansionTile(
                              trailing: Icon(
                                expandedTiles.contains(index)
                                    ? Icons.minimize
                                    : Icons.add,
                                size: 24,
                              ),
                              shape: Border(),
                              onExpansionChanged: (bool expanded) {
                                setState(() {
                                  if (expanded) {
                                    expandedTiles.add(index);
                                  } else {
                                    expandedTiles.remove(index);
                                  }
                                });
                              },
                              title: Text(faq[index]['question'] ?? ''),
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(faq[index]['answer'] ?? ''),
                                ),
                              ],
                            );
                          }),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Select Your Plan Type',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                        SizedBox(height: 5.h,),

                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primarycolor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Text('Daily'),
                                ),
                              ),
                              SizedBox(width: 20.w,),
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.primarycolor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Text('Weekly'),
                                ),
                              ),
                              SizedBox(width: 20.w,),
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.primarycolor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Text('Custom'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rating & Reviews',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 24.sp),
                            SizedBox(width: 5.w),
                            Text(
                              '$rating',
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              '($reviewCount reviews)',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

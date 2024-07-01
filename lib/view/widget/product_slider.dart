import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selefe_test/view/utils/app_colors.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({super.key});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  ValueNotifier<int> _selected_slider = ValueNotifier(0);
  List items = [
    'https://wallpapers.com/images/featured/garlic-png-k9gli6gidj3p1439.jpg',
    'https://pngfre.com/wp-content/uploads/potato-29-1024x947.png',
    'https://www.freepnglogos.com/uploads/tomato-png/tomato-and-kidney-stone-everyday-life-23.png',
    'https://freepngdownload.com/image/thumb/milk-png-free-download-71.png',
    'https://purepng.com/public/uploads/large/purepng.com-orangeorangefruitfoodtastydeliciousorangecolor-331522582560lu0u4.png',
  ];

  List slidecolor = [
    Colors.green.shade100,
    Colors.orange.shade100,
    Colors.red.shade100,
    Colors.blue.shade100,
    Colors.orange.shade100
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            viewportFraction: 0.9,
            autoPlayInterval: const Duration(seconds: 10),
            onPageChanged: (int page, _) {
              _selected_slider.value = page;
            },
          ),


          items: items.asMap().entries.map((entry) {
            int index = entry.key;
            String i = entry.value;
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    color: slidecolor[index],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10),

                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      SizedBox(width: 10.w,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30,),
                              Text(
                                'Get 20% off Your First Subscribe',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,

                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Subscribe Now',
                                style: TextStyle(
                                  color: AppColors.primarycolor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Image.network(
                          i.toString(),
                          height: 150,
                          width: 150,
                        ),
                        Divider(),
                      ],
                    )
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 5,
        ),
        ValueListenableBuilder(
          valueListenable: _selected_slider,
          builder: (context, value, _) {
            List<Widget> list = [];
            for (int i = 0; i < items.length; i++) {
              list.add(Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: value == i ? Colors.blue : null,
                ),
              ));
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list,
            );
          },
        )
      ],
    );
  }
}
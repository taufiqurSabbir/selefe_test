import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/app_colors.dart';
import '../widget/product_image.dart';

class DailyPlan extends StatefulWidget {
  const DailyPlan({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  State<DailyPlan> createState() => _DailyPlanState();
}

class _DailyPlanState extends State<DailyPlan> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> product = widget.product;
    String image = product['image'] ?? '';
    String name = product['name'] ?? '';
    String weight = product['minorder'].toString() ?? '';
    bool havediscount = product['ishavediscount'] ?? false;
    String discount = product['discountamount'].toString() ?? '';
    int price = product['price'];
    int oldPrice = product['oldPrice'];
    String saving = (oldPrice - price).toString() ?? '0';
    CalendarFormat _calendarFormat = CalendarFormat.month;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Daily Plan',
          style: TextStyle(fontSize: 21, color: Colors.white),
        ),
        backgroundColor: AppColors.primarycolor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Divider(),
                productImage(image: image, havediscount: false, discount: discount),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${weight}kg', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                  ],
                ),
                SizedBox(width: 100.w),
              ],
            ),
            SizedBox(height: 25.h),
            Text('Select Start Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.h),
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime(2101),
              focusedDay: _focusedDate,
              calendarFormat: _calendarFormat,
              availableCalendarFormats: const { CalendarFormat.month: 'Month' }, // Only show the month format
              selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                  _focusedDate = focusedDay; // update focused day to selected day
                });
              },
            ),
            SizedBox(height: 25.h),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.primarycolor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'You are one step away from saving ${saving} TK daily',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add your subscription logic here
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Confirm for subscribe',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

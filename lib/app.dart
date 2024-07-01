import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:selefe_test/view/screens/home.dart';
import 'package:get/get.dart';
import 'package:selefe_test/view/utils/app_colors.dart';


class selefe extends StatefulWidget {
  const selefe({super.key});

  @override
  State<selefe> createState() => _selefeState();
}

class _selefeState extends State<selefe> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 640),
    builder: (context, child)=> GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Selefe Test',
      theme: ThemeData(

          brightness: Brightness.light,
          primaryColor: AppColors.primarycolor,
          primarySwatch: Colors.green,
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),



          textTheme: TextTheme(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.black,
                  letterSpacing: 0.5
              )
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primarycolor,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              )
          )
      ),

      themeMode: ThemeMode.light,
      home:  HomeScreen(),
      initialBinding: ControllerBinding(),
    )
    );
  }
}


class ControllerBinding extends Bindings{
  @override
  void dependencies() {

  }

}
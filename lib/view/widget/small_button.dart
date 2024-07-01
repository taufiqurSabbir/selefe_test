import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key, required this.title, required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primarycolor,width: 2),
          borderRadius: BorderRadius.circular(10),

        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
           title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primarycolor
            ),
          ),
        ),
      ),
    );
  }
}

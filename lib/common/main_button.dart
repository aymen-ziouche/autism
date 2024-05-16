import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert_autism/common/custom_theme.dart';
import 'package:xpert_autism/common/my_colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final bool blue;
  final Function onTap;
  const MainButton({super.key, required this.text, required this.onTap, required this.blue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: blue ? MyColors.mainColor : MyColors.backgroundColors,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: blue ? AppTheme.buttonText : AppTheme.buttonTextBlue,
          ),
        ),
      ),
    );
  }
}

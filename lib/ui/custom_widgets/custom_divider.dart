import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/constants/colors.dart';

class CustomDivider extends StatelessWidget {
 final double width;
 final double height;
 CustomDivider({this.width = 165, this.height=0.5 });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      width: width.w,
      height: height.h,
      color: light_black.withOpacity(0.5),);
  }
}

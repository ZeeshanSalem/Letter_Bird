import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/constants/colors.dart';

import 'image_container.dart';

class IconRoundedButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final String iconPath;
  final Color buttonColor;
  final Color textColor;
  final double width;
  IconRoundedButton({required this.onTap,required this.iconPath,required this.text, this.width = 314, this.buttonColor = Colors.white, this.textColor = light_black});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: 60.h,
      margin: EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(1.0),
          primary: Colors.white,
          // textStyle: const TextStyle(fontSize: textSize),
        ),
        onPressed: onTap!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageContainer(
              height: 24.h,
              width: 24.w,
              assets: iconPath,
              radius: 0.r,
            ),
            SizedBox(width: 22.w,),
            Text(
              text!,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w400, fontSize: 14.sp),
            ),
          ],
        ),




      ),
    );
  }
}
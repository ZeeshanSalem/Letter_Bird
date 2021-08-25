import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';

class WriteScreenEditTile extends StatelessWidget {
  final  VoidCallback press;

  WriteScreenEditTile(this.press);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          Container(
            width: 112.w,
            height: 41.h,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12 ),
            decoration: BoxDecoration(
              color: Color(0xffF2F2F2),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageContainer(
                  width: 19.w,
                  height: 19.h,
                  assets: IconsPath.paint_icon,
                  radius: 0.r,
                ),
                SizedBox(width: 5.w,),
                Text("Brown", style: kufamTextStyle.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),),
                SizedBox(width: 8.w,),
                ImageContainer(
                  width: 14.w,
                  height: 9.h,
                  assets: IconsPath.drop_down_arrow_icon,
                  radius: 0.r,
                ),
              ],
            ),

          ),

          SizedBox(width: 8.w,),

          Container(
            width: 120.w,
            height: 41.h,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12 ),
            decoration: BoxDecoration(
              color: Color(0xffF2F2F2),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageContainer(
                  width: 19.w,
                  height: 19.h,
                  assets: IconsPath.font_icon,
                  radius: 0.r,
                ),
                SizedBox(width: 5.w,),
                Text("Font 001", style: kufamTextStyle.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),),
                SizedBox(width: 8.w,),
                ImageContainer(
                  width: 14.w,
                  height: 9.h,
                  assets: IconsPath.drop_down_arrow_icon,
                  radius: 0.r,
                ),
              ],
            ),
          ),

          SizedBox(width: 15.w,),

          GestureDetector(
            child: ImageContainer(
              width: 14.w,
              height: 14.h,
              assets: IconsPath.full_screen_icon,
              radius: 0.r,
            ),
            onTap: press,
          ),

        ],
      ),
    );
  }
}

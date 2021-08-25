import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';

class ShareMyIdDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        height: 413.h,
        width: 413.w,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [

            ImageContainer(
              height: 132.h,
              width: 132.w,
              assets: ImagesPath.puzzle,
              radius: 0.r,
            ),

            SizedBox(height: 30.h,),

            RichText(text: TextSpan(
              text: "You can send letter to mi via",
              style: kufamTextStyle.copyWith(fontSize: 14.sp,),
              children: [
                TextSpan(
                  text: "letterbird.",
                  style: kufamTextStyle.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w700),
                ),
              ]
            ),),

            SizedBox(height: 10.h,),

            Text("My letterbird ID: TR34FV",
              textAlign: TextAlign.center,
              style: kufamTextStyle.copyWith(fontSize: 14.sp,),

            ),
            Spacer(),

            Row(
              children: [
                ImageContainer(
                  height: 80.h,
                  width: 80.w,
                  assets: ImagesPath.letter_bird_vector,
                  radius: 0.r,
                ),

                Spacer(),

                ImageContainer(
                  height: 36.h,
                  width: 103.w,
                  assets: ImagesPath.google_play,
                  radius: 0.r,
                ),

                SizedBox(width: 10.w,),

                ImageContainer(
                  height: 36.h,
                  width: 103.w,
                  assets: ImagesPath.apple_store,
                  radius: 0.r,
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}

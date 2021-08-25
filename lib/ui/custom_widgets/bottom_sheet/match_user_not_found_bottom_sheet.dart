import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';

import '../image_container.dart';
import '../rounded_button.dart';

class MatchUserNotFoundBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 445.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric//            Text("Age Range", style: kufamTextStyle.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),),

//            SizedBox(height: 76.h,),

//            SliderTheme(
//              data: SliderThemeData(
////                valueIndicatorColor: light_red_color,
////                valueIndicatorShape: SliderComponentShape.noOverlay,
////                showValueIndicator: ShowValueIndicator.always,
////                inactiveTrackColor: backgroundColor,
////                activeTrackColor: dark_red_color,
////                thumbColor: dark_red_color,
////
////                overlayColor: light_red_color.withOpacity(0.2),
//
//
//              ),
//              child: RangeSlider(
//                  values: rangeValue,
//                  min: 0,
//                  max: 100,
//                  divisions: 100,
//
//                  labels: RangeLabels(rangeValue.start.toInt().toString(), rangeValue.end.toInt().toString()),
//                  onChanged: (value){
//                    setState(() {
//                      rangeValue = value;
//                    });
//                  }
//
//
//              ),
//            ),

(vertical: 40, horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h,),

          ImageContainer(
            height: 81.h,
            width: 69.w,
            assets: ImagesPath.shield_fail,
            radius: 0.r,
          ),

          SizedBox(height: 40.h,),

          Expanded(child: Text("No such a user with your search criteria, widen your search options and try again.", style: subtitleTextStyle1,)),

          RoundedButton(
              press: (){
              },
              text: "Go to match settings",
              color: light_red_color,
              textColor: Colors.white , width: double.infinity.w),




        ],
      ),
    );;
  }
}

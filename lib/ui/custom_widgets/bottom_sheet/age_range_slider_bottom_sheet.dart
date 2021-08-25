import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';

import '../rounded_button.dart';

class AgeRangesSliderBottomSheet extends StatefulWidget {
  @override
  _AgeRangesSliderBottomSheetState createState() => _AgeRangesSliderBottomSheetState();
}

class _AgeRangesSliderBottomSheetState extends State<AgeRangesSliderBottomSheet> {
  var rangeValue = RangeValues(13.0, 43.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 414.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(vertical: 23, horizontal: 43),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text("Age Range", style: kufamTextStyle.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),),

            SizedBox(height: 76.h,),

            SliderTheme(
              data: SliderThemeData(
                valueIndicatorColor: light_red_color,
                valueIndicatorShape: SliderComponentShape.noOverlay,
                showValueIndicator: ShowValueIndicator.always,
                inactiveTrackColor: backgroundColor,
                activeTrackColor: dark_red_color,
                thumbColor: dark_red_color,

                overlayColor: light_red_color.withOpacity(0.2),


              ),
              child: RangeSlider(
                  values: rangeValue,
                  min: 0,
                  max: 100,
                  divisions: 100,

                  labels: RangeLabels(rangeValue.start.toInt().toString(), rangeValue.end.toInt().toString()),
                  onChanged: (value){
                    setState(() {
                      rangeValue = value;
                    });
                  }


                  ),
            ),

            Spacer(),

            RoundedButton(
              width: double.infinity.w,
              textColor: Colors.white,
              text: "Done",
              color: blue,
              press: (){},
            ),
          ],
        ),
      ),
    );
  }
}

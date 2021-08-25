import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';

class AgeRangeScreen extends StatefulWidget {
  @override
  _AgeRangeScreenState createState() => _AgeRangeScreenState();
}

class _AgeRangeScreenState extends State<AgeRangeScreen> {
  var rangeValue = RangeValues(13.0, 43.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                /// Appbar of Screen
                ///
                CustomAppBar(
                    iconColor: light_black,
                    textColor: light_black,
                    appBarTitle: "Age range"),

                SizedBox(height: 40.h,),

                Text("Choose the best age range that suits you. We will try to find closests matches with your age range. ",
                style: kufamTextStyle.copyWith(fontSize: 14.sp),
                ),


                SizedBox(height: 40.h,),

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
          )
        ));
  }
}

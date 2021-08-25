import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';

import '../../../core/assets/images.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/colors.dart';
import '../../../core/text_styles.dart';
import '../../../core/text_styles.dart';
import '../rounded_button.dart';

class ErrorBottomSheetWithButtons extends StatelessWidget {
  final String? errorMessage;
  final String? secondButtonName;
  ErrorBottomSheetWithButtons({@required this.errorMessage, @required this.secondButtonName});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
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

          Expanded(child: Text("${errorMessage ?? "Error Message"}", style: subtitleTextStyle1,)),

          SizedBox(height: 19.h,),


          RoundedButton(
              press: (){
              },
              text: "Re-send",
              color: light_red_color,
              textColor: Colors.white , width: double.infinity.w),

          SizedBox(height: 15.h,),

          RoundedButton(
              press: (){
              },
              text: "${secondButtonName ?? "Re-enter"}",
              color: unActive_button_silver_color,
              textColor: textColor , width: double.infinity.w),






        ],
      ),
    );
  }
}

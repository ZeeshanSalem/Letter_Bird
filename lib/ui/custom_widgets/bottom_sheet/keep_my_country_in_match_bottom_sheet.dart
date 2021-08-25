import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import '../../../core/assets/images.dart';
import '../../../core/constants/colors.dart';
import '../../../core/text_styles.dart';
import '../rounded_button.dart';

class KeepMyCountryInMatchBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 527.h,
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
            assets: ImagesPath.blue_shield_vector,
            radius: 0.r,
          ),

          SizedBox(height: 27.h,),

          Expanded(
              child: Text("By deactivating this option, you will remove your country  from being matched, and we will offer you matches by other countries.",
                style: subtitleTextStyle1,)),

          SizedBox(height: 24.h,),

          RoundedButton(
              press: (){
                Navigator.pop(context, false);
              },
              text: "Decativate",
              color: light_red_color,
              textColor: Colors.white , width: double.infinity.w),
          SizedBox(height: 24.h,),

          RoundedButton(
              press: (){
                Navigator.pop(context, true);

              },
              text: "Keep it active",
              color: blue,
              textColor: Colors.white , width: double.infinity.w),





        ],
      ),
    );
  }
}

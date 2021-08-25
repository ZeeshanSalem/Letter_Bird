import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import '../../../core/assets/images.dart';
import '../../../core/constants/colors.dart';
import '../../../core/text_styles.dart';
import '../rounded_button.dart';

class LinkCopyBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 445.h,
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

          SizedBox(height: 40.h,),

          Expanded(child: Text("Link copied, now share your link via your social media accounts and make your friends to send you letters without downloading or signing up letterbird. ", style: subtitleTextStyle1,)),

          RoundedButton(
              press: (){
              },
              text: "Done",
              color: light_red_color,
              textColor: Colors.white , width: double.infinity.w),




        ],
      ),
    );
  }
}

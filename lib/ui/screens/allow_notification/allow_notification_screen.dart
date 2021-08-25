import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';

class AllowNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Padding(
            padding:  EdgeInsets.fromLTRB(40, 58, 40, 30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  ImageContainer(
                    width: 48.w,
                    height: 48.h,
                    assets: ImagesPath.allow_notification_vector,
                    radius: 0,
                  ),

                  SizedBox(height: 34.h,),

                  Text("Notification",
                    style: titleTextStyle1.copyWith(color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 18.sp,
                    ),),

                  SizedBox(height: 25.h,),

                  Text("You will be notified if you have a letter on the way. Allowing notifications will allow you to receive random letters from other users.",
                    textAlign: TextAlign.start,
                    style: titleTextStyle1.copyWith(color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      height: 1.5,
                    ),),

                  Spacer(),


                  RoundedButton(
                      press: (){},
                      text: "Allow Push Notification",
                      color:    blue,
                      textColor: Colors.white,
                      width: 314.w),


                ],
              ),
            ),
          ),
        ),
    );
  }
}

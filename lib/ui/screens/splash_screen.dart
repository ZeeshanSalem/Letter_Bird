import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  ImageContainer(
                    width: 200.w,
                    height: 200.h,
                    assets: ImagesPath.letter_bird_vector,
                    radius: 0.r,
                  ),

                  SizedBox(height: 50.h,),

                  Text("\“A new way of traditional penpalling\”",
                  style: kufamTextStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),),

                  SizedBox(height: 20.h,),

                  Text("Vestibulum pulvinar dictumst at nisi, sit nisl. Purus, pulvinar neque felis duis id adipiscing. Massa.",
                    textAlign: TextAlign.center,
                    style: kufamTextStyle.copyWith(
                      fontSize: 14.sp,
                      height: 1.9
                    ),),

                  SizedBox(height: 40.h,),

                  CircularProgressIndicator(
                    backgroundColor: light_black,
                    strokeWidth: 6.0,
                  ),


                ],
              ),
            ),
          ),
        ),);
  }
}

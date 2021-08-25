import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';

class AppLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///
                /// Appbar of Screen
                ///
                CustomAppBar(
                    iconColor: light_black,
                    textColor: light_black,
                    appBarTitle: "App Language"),

                SizedBox(height: 40.h,),

                Text("Choose your app language. If you want to a translator you can contact with us via info@letterbird.com.",
                  style: kufamTextStyle.copyWith(fontSize: 14.sp, height: 1.8),
                ),

                SizedBox(height: 35.h,),

                _languageTile(language: "Turki"),

                SizedBox(height: 22.h,),

                _languageTile(language: "English"),


              ],
            ),
          ),
        ),);
  }


  Widget _languageTile({String? language}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${language!}", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 18.sp),),

          Icon(Icons.arrow_forward_ios, size: 20.h, color: light_black,),
          ],
      ),
    );
  }
}

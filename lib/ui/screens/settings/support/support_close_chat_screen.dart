import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';

class SupportCloseChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///
              /// Appbar of Screen
              ///
              CustomAppBar(
                  iconColor: light_black,
                  textColor: light_black,
                  appBarTitle: "Support chat"),

              SizedBox(height: 40.h,),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              _leftChat(message: "Hello, I am Irine", time: "12:12pm"),
                              SizedBox(height: 10.h,),

                              _leftChat(message: "How may i help you today ", time: "12:12pm"),

                            ],
                          )
                      ),

                      SizedBox(height: 25.h,),




                      Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: [
                              _rightChat(message: "Hi, thnx for getting meh ", time: "12:13pm"),
                              SizedBox(height: 10.h,),

                              _rightChat(message: "Actualy, there is something... ", time: "12:14pm"),

                            ],
                          )
                      ),


                      SizedBox(height: 25.h,),


                      Align(
                          alignment: Alignment.centerLeft,
                          child: _leftChat(message: "Yea, am listening...", time: "12:14pm")
                      ),

                      SizedBox(height: 87.h,),

                      Center(
                        child: Text("Chat Close.",
                          style: subtitleTextStyle.copyWith(
                            color: Color(0xff828282)
                          ),),
                      ),


                    ],
                  ),
                ),),









            ],
          ),
        ),

      ),
    );
  }

  Widget _rightChat({String? message, String? time}){
    return Container(
      width: 263.w,
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${message!}", style: titleTextStyle.copyWith(
              fontSize: 16.sp,
              color: Colors.white,
              height: 1.8
          ),),

          Text("${time!}", style: titleTextStyle.copyWith(
            fontSize: 12.sp,
            color: Colors.white,
          ),),

        ],
      ),
    );
  }

  Widget _leftChat({String? message, String? time}){
    return Container(
      width: 263.w,
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${message!}", style: titleTextStyle.copyWith(
              fontSize: 16.sp,
              color: textColor,
              height: 1.8
          ),),

          Text("${time!}", style: titleTextStyle.copyWith(
            fontSize: 12.sp,
            color: textColor,
          ),),

        ],
      ),
    );
  }

}

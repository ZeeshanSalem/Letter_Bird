import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';

class SupportOpenChatScreen extends StatelessWidget {
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

                        SizedBox(height: 25.h,),


                      ],
                    ),
                  ),),




              ///
              /// sending message field
              ///
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Container(
                     padding: EdgeInsets.only(left: 20),
                     width: 180.w,
                     child: TextField(
                       style: titleTextStyle.copyWith(
                         color: Colors.black,
                         fontSize: 16.sp,
                       ),
                       maxLines: 1,
                       decoration: InputDecoration(
                         border: InputBorder.none,
                         contentPadding: EdgeInsets.symmetric(horizontal: 29, vertical: 21),
                         hintText: "Type of message here",
                         hintStyle: titleTextStyle.copyWith(
                           color: textColor,
                           fontSize: 16.sp,
                         ),
                       ),
                     ),
                   ),

                    Spacer(),

                    ImageContainer(
                      height: 20.r,
                      width: 20.r,
                      assets: IconsPath.plus_button,
                      radius: 0.r,
                    ),

                    SizedBox(width: 20.w,),

                    Container(
                      height: 45.r,
                      width: 45.r,
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Center(
                        child: ImageContainer(
                          height: 21.h,
                          width: 21.w,
                          assets: IconsPath.play_vector,
                          radius: 0.r,
                        ),
                      ),
                    ),
                  ],
                ),

              ),

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

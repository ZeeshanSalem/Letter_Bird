import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';

class BuyMeCoffeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Padding(
            padding:  EdgeInsets.symmetric(vertical: 40, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppBar(
                    iconColor: light_black,
                    textColor: light_black,
                    appBarTitle: "Buy me a Coffee"),

                Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        children: [
                          Text("Buy Letter app team Coffee",
                            textAlign: TextAlign.center,
                            style: kufamTextStyle.copyWith(fontWeight: FontWeight.w700),),

                          SizedBox(height: 20.h,),

                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tellus diam sed vivamus sit est dictum proin sed scelerisque. Est elementum ac, placerat euismod bibendum sit facilisis malesuada. Consectetur pretium turpis viverra amet lectus aenean donec pellentesque. ",
                            style: kufamTextStyle.copyWith(fontSize: 14.sp, height: 1.5),),

                         Container(
                           margin: EdgeInsets.symmetric(vertical: 20),
                           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                           height: 80.h,
                           width: double.infinity,
                           decoration: BoxDecoration(
                             color: blue.withOpacity(0.3),
                           ),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [

                               ImageContainer(
                                 height: 38.h,
                                 width: 38.w,
                                 assets: ImagesPath.juice_vector,
                                 radius: 0.r,
                               ),

                               SizedBox(width: 5.w,),

                               Icon(Icons.clear, size: 20.h, color: blue,),

                               SizedBox(width: 8.w,),

                               Container(
                                 height: 38.h,
                                 width: 38.w,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(4.r),
                                 ),
                                 child: Center(child: Text("0",style: kufamTextStyle,),),
                               ),

                               SizedBox(width: 30.w,),

                               _circleTile(
                                 backGroundColor: blue,
                                 textColor: Colors.white,
                                 value: "1"
                               ),

                               SizedBox(width: 10.w,),
                               _circleTile(value: "2"),

                               SizedBox(width: 10.w,),
                               _circleTile(value: "3"),


                             ],
                           ),
                         ),

                          TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Enter your Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(color: light_black.withOpacity(0.2)),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(color: light_black.withOpacity(0.2)),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(color: light_black.withOpacity(0.2)),
                              ),
                            ),
                          ),


                          SizedBox(height: 20.h,),


                          TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Enter your message",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(color: light_black.withOpacity(0.2)),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(color: light_black.withOpacity(0.2)),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(color: light_black.withOpacity(0.2)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),),

                RoundedButton(
                    text: "Support letterbird app",
                    color: light_red_color,
                    textColor: Colors.white,
                    width: 314.w),



              ],
            ),
          ),
        ),);
  }

  Widget _circleTile({Color backGroundColor = Colors.white, Color textColor = blue, String? value}){
    return Container(
      height: 38.h,
      width: 38.w,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Center(
        child: Text(value!, style: kufamTextStyle.copyWith(color: textColor),),
      ),
    );
  }
}

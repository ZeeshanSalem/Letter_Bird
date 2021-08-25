import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingAvatarPopup extends StatelessWidget {
  const SettingAvatarPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: light_black,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: light_black,
        systemNavigationBarIconBrightness: Brightness.dark
    ));

    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: light_black,
        child: Column(
          children: [

            Expanded(
              flex: 2,
              child: Container(
              ),
            ),


            Expanded(
              flex: 6,
              child: Container(
                width: size.width,
                height: size.height,
                color: bgScreenColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    textView(
                        textAlign: TextAlign.start,
                        text:
                        "Buy Coins",
                        fontWeight: FontWeight.w700,
                        fontSize: 17.sp,
                        textColor: textColor),

                    SizedBox(
                      height: 20.h,
                    ),

                    Image.asset(ImagesPath.coins,height: 146.h,width: 146.w,),


                    Container(
                      margin: EdgeInsets.only(left: 50.w, right: 50.w,top: 32.h,bottom: 19.h),
                      child: textView(
                          textAlign: TextAlign.start,
                          text:
                          "Unfortunately, there is not enough coins to complete this request. You can get coins, start a premium subscription or try free avatars.",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          textColor: textColor),
                    ),

                    textView(
                        textAlign: TextAlign.start,
                        text:
                        "Your Coins: 450",
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        textColor: textColor),


                    Container(
                      margin: EdgeInsets.only(
                        left: 50.w,
                        right: 50.w,
                        top: 16.h
                      ),
                      child: RoundedButton(
                        text: 'Buy Coins',
                        color: blue,
                        textColor: whiteColor,
                        width: size.width,
                        press: () {
                          //Move to sign up page
                          //Utils.push(LoginScreen5(), context);
                        },
                      ),
                    ),


                    Container(
                      margin: EdgeInsets.only(
                          left: 50.w,
                          right: 50.w,
                          top: 16.h
                      ),
                      child: RoundedButton(
                        text: 'Become Premium',
                        color: lightest_grey,
                        textColor: textColor,
                        width: size.width,
                        press: () {
                          //Move to sign up page
                          //Utils.push(LoginScreen5(), context);
                        },
                      ),
                    ),



                    Container(
                      margin: EdgeInsets.only(
                          left: 50.w,
                          right: 50.w,
                          top: 16.h
                      ),
                      child: RoundedButton(
                        text: 'Choose Free',
                        color: lightest_grey,
                        textColor: textColor,
                        width: size.width,
                        press: () {
                          //Move to sign up page
                          //Utils.push(LoginScreen5(), context);
                        },
                      ),
                    ),


                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

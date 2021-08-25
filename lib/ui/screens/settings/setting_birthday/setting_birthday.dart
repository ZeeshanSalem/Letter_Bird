import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/ui/screens/settings/setting_birthday/setting_birthday_popup.dart';

class SettingBirthdate extends StatelessWidget {
  const SettingBirthdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 40.w),
                  // child: CustomAppBar(appBarTitle: "Unread",textColor: textColor,),
                  child: appBarWidget(context,
                      title: "Birth date", backImage: IconsPath.back_icon),
                ),



                Container(
                  margin: EdgeInsets.only(left: 32.w, right: 32.w,top: 32.h),
                  child: textView(
                      textAlign: TextAlign.start,
                      text:
                      "We use the date of birth to find more suitable matches and it is 	confidential. Only you can view.",
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      textColor: textColor),
                ),



                Container(
                  margin: EdgeInsets.only(
                      left: 50.w,
                      right: 50.w,
                      top: 75.h
                  ),
                  child: RoundedButton(
                    text: '21 Nov, 1995',
                    color: lightest_red_color,
                    textColor: red,
                    width: size.width,
                    press: () {
                      //Move to sign up page
                      //Utils.push(LoginScreen5(), context);
                    },
                  ),
                ),

              ],
            ),


            Container(
              margin: EdgeInsets.only(
                  left: 50.w,
                  right: 50.w,
              ),
              child: RoundedButton(
                text: 'Update',
                color: lightest_grey,
                textColor: textColor,
                width: size.width,
                press: () {
                  //Move to sign up page
                  Utils.push(SettingBirthdayPopup(), context);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

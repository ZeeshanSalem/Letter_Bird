import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';

class SupportOpenTicketScreen extends StatelessWidget {
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
                  appBarTitle: "My Tickets"),

              SizedBox(height: 40.h,),

              _textField(
                hintText: "Enter Ticket Title",
              ),

              SizedBox(height: 20.h,),


              _textField(
                hintText: "Enter your message here",
                maxLine: 15
              ),


              Spacer(),

              RoundedButton(
                width: double.infinity.w,
                textColor: Colors.white,
                text: "Submit",
                color: blue,
                press: (){},
              ),









            ],
          ),
        ),

      ),
    );
  }

  Widget _textField({String? hintText, int maxLine = 1}) {
    return TextField(
              style: titleTextStyle.copyWith(
                color: Colors.black,
                fontSize: 16.sp,
              ),
              maxLines: maxLine,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 29, vertical: 21),
                hintText: "${hintText!}",
                hintStyle: titleTextStyle.copyWith(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            );
  }

}

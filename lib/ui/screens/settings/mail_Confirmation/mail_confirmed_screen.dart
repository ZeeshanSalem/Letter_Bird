import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';

class MailConfirmedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              ///
              /// Appbar of Screen
              ///
              CustomAppBar(
                  iconColor: light_black,
                  textColor: light_black,
                  appBarTitle: "Email Address"),

              SizedBox(height: 50.h,),

              ImageContainer(
                width: 95.w,
                height: 74.h,
                assets: ImagesPath.mail_vector,
                radius: 0.r,
              ),

              SizedBox(height: 60.h,),

              Text("Your mail address confirmed.",
                style: kufamTextStyle.copyWith(
                  fontSize: 14.sp,
                  height: 1.5,
                ),),

              SizedBox(height: 120.h,),

              TextFormField(
                readOnly: true,
                onChanged:(val){},
                onSaved: (val){
//                    model.onChange(val!);
                },

                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 15.sp,
                    color: greenColor,
                  ),
                  hintText: "kash402@gmail.com",
                  fillColor: greenColor.withOpacity(0.3),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: ImageContainer(
                      radius: 0.0,
                      assets: IconsPath.message_green_icon,
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 70.h,
                    maxWidth: 70.w,

                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: greenColor.withOpacity(0.3)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: greenColor.withOpacity(0.3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: greenColor.withOpacity(0.3)),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

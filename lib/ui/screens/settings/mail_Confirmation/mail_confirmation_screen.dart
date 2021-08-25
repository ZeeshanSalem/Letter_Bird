import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/screens/settings/mail_Confirmation/mail_confimation_code/mail_confirmation_code_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/mail_Confirmation/mail_confirmation_view_model.dart';
import 'package:provider/provider.dart';

class MailConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MailConfirmationViewModel(),
      child: Consumer<MailConfirmationViewModel>(
        builder: (context, model, child)=> SafeArea(
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

                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae nisl pretium consectetur in donec pulvinar quis. ",
                  style: kufamTextStyle.copyWith(
                    fontSize: 14.sp,
                    height: 1.5,
                  ),),

                  SizedBox(height: 120.h,),


                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.white,
                    child: TextFormField(
                      onChanged: model.onChange,
                      onSaved: (val){
                        model.onChange(val!);
                      },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                          color: textColor,
                        ),
                        hintText: "kash402@gmail.com",
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: ImageContainer(
                            radius: 0.0,
                            assets: IconsPath.message_icon,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 45.h,
                          maxWidth: 45.w,

                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 206.h,),

                  RoundedButton(
                      press: (){
                        if(model.isValueFilled){
                        Utils.push(MailConfirmationCodeScreen(), context);}
                        else{
                          Get.snackbar("Enter Email", "Kindly Fill Email", backgroundColor: blue);
                        }
                      },
                      text: "Send Code",
                      color:  model.isValueFilled ?   blue : unActive_button_silver_color,
                      textColor: model.isValueFilled ? Colors.white : textColor, width: 314.w),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

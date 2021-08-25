import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/screens/settings/mail_Confirmation/mail_confirmation_view_model.dart';
import 'package:letter_bird_project/ui/screens/settings/mail_Confirmation/mail_confirmed_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import 'mail_confirmation_code_view_model.dart';

class MailConfirmationCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> MailConfirmationCodeViewModel(),
    child: Consumer<MailConfirmationCodeViewModel>(
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


                  SizedBox(height: 94.h,),

                  PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5.r),
                        fieldHeight: 70.h,
                        fieldWidth: 70.w,
                        activeFillColor: Colors.white,
                        disabledColor: Colors.white,
                        inactiveColor: Colors.white,
                        selectedFillColor: Colors.white,
                        selectedColor: Colors.white,
                        inactiveFillColor: Colors.white
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
//                        errorAnimationController: errorController,
                    controller: model.otpController,
                    onCompleted: (v) {
                      print("Completed");
                      model.onFilled();
                    },
                    onChanged: (value) {
                      print(value);
                      model.falseFilledBool();
//                          setState(() {
//                            currentText = value;
//                          });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,
                  ),


                  SizedBox(height: 50.h,),

                  RoundedButton(
                      press: (){
                        Utils.push(MailConfirmedScreen(), context);
                      },
                      text: "Confirm",
                      color:  model.isOtpFilled ?   blue : unActive_button_silver_color,
                      textColor: model.isOtpFilled ? Colors.white : textColor, width: 314.w),
                ],
              ),
            ),
          ),),
    ),
    );
  }
}

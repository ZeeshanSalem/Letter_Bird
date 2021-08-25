import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/bottom_sheet/error_bottom_sheet.dart';
import 'package:letter_bird_project/ui/custom_widgets/bottom_sheet/error_bottom_sheet_with_buttons.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/screens/sign_up/sign_in_with_email/sign_in_with_email_screen.dart';
import 'package:letter_bird_project/ui/screens/sign_up/verify_otp/verify_otp_view_model.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/assets/images.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/text_styles.dart';
import 'package:get/get.dart';

class VerifyOtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> VerifyOtpViewModel(),
      child: Consumer<VerifyOtpViewModel>(
        builder: (context, model, child)=> SafeArea(
            child: Scaffold(
              backgroundColor: backgroundColor,
              body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 70, horizontal: 39),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      ImageContainer(
                        width: 81.w,
                        height: 91.h,
                        assets: ImagesPath.opt_vector,
                        radius: 0,
                      ),

                      SizedBox(height: 45.h,),

                      Text("Verify",
                        style: titleTextStyle1.copyWith(color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18.sp,
                        ),),

                      SizedBox(height: 25.h,),

                      Text("Please enter the code that was sent to your phone number. If you have troubling about receiving code plase contact support.",
                        style: titleTextStyle1.copyWith(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          height: 1.5,
                        ),),

                      SizedBox(height: 5.h,),

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
                            Utils.push(SignInWithEmailScreen(), context);
                          },
                          text: "Send Code",
                          color:  model.isOtpFilled ?   blue : unActive_button_silver_color,
                          textColor: model.isOtpFilled ? Colors.white : textColor, width: 314.w),


                    ],
                  ),
                ),
              ),
            ),
        ),
      ),
    );
  }
}

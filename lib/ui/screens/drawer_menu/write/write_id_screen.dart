import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/screens/drawer_menu/write/write_id_view_model.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class WriteWithIdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> WriteWithIdViewModel(),
      child: Consumer<WriteWithIdViewModel>(
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  CustomAppBar(
                    iconColor: light_black,
                    textColor: light_black,
                      appBarTitle: "Write",),

                  Expanded(child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 55),
                    child: Center(
                      child: Column(
                        children: [

                          ImageContainer(
                            height: 53.h,
                            width: 47.w,
                            assets: ImagesPath.edit_vector,
                            radius: 0.r,
                          ),
                          SizedBox(height: 41.h,),

                          Text("Please enter the id of the member that you want to send letter.",
                          style: kufamTextStyle.copyWith(fontSize: 14.sp, height: 1.5),),

                          SizedBox(height: 80.h,),

                          PinCodeTextField(
                            length: 6,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5.r),
                                fieldHeight: 40.h,
                                fieldWidth: 40.w,
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

                        ],
                      ),
                    ),
                  )),

                  RoundedButton(
                      press: (){
                      },
                      text: "Write",
                      color:  model.isOtpFilled ?   blue : unActive_button_silver_color,
                      textColor: model.isOtpFilled ? Colors.white : textColor, width: 314.w),




                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/screens/sign_up/enter_number_screen/sign_up_enter_number_view_model.dart';
import 'package:letter_bird_project/ui/screens/sign_up/sign_in_with_email/verify_otp_with_email/verify_with_email_screen.dart';
import 'package:letter_bird_project/ui/screens/sign_up/verify_otp/verify_opt_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/assets/images.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/text_styles.dart';

class SignUpEnterNumberScreen extends StatefulWidget {
  @override
  _SignUpEnterNumberScreenState createState() => _SignUpEnterNumberScreenState();
}

class _SignUpEnterNumberScreenState extends State<SignUpEnterNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: ChangeNotifierProvider(
            create: (context) => SignUpEnterViewModel(),
            child: Consumer<SignUpEnterViewModel>(
              builder: (context, model, child) => SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 70, horizontal: 39),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageContainer(
                        width: 81.w,
                        height: 91.h,
                        assets: ImagesPath.phone_vector,
                        radius: 0,
                      ),

                      SizedBox(height: 45.h,),

                      Text("Phone Number",
                        style: titleTextStyle1.copyWith(color: Colors.black,
                            fontWeight: FontWeight.w800,
                          fontSize: 18.sp,
                        ),),

                      SizedBox(height: 25.h,),

                      Text("Please enter your phone number, we will send you a code for authentication. Your phone number will be used for signing up Letterbird.",
                        style: titleTextStyle1.copyWith(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          height: 1.5,
                        ),),

                      SizedBox(height: 84.h,),

                  Container(
                    height: 75.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    width: 326.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                      color: Colors.white
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top:5.h),
                          child: Icon(Icons.add, size: 15.h, color: textColor,),
                        ),
                        customTextField(
                            controller: model.controllers[0],
                            focusNode: model.f1,
                            onChanged: (val){

                              if(val == ''){
                                model.onChange(context, model.f1);

                              }else {
                                model.onChange(context, model.f2);
                              }

                            }
                        ),
                        customTextField(
                            controller: model.controllers[1],
                            focusNode: model.f2,
                            onChanged: (val){
                              if(val == ''){
                                model.f2.unfocus();
                                model.onChange(context, model.f1);

                              }else {
                                model.f2.unfocus();

                                model.onChange(context, model.f3);
                              }
                            }
                        ),

                        ///
                        /// Divider
                        ///
                        Container(
                          margin: EdgeInsets.only(left: 18.w, right: 20.w),
                          height: 40.h,
                          width: 2.w,
                          color: Color(0xffBDBDBD),
                        ),

                        customTextField(
                            controller: model.controllers[2],
                            focusNode: model.f3,
                            onChanged: (val){
                              if(val == ''){
                                model.onChange(context, model.f2);

                              }else {

                                model.onChange(context, model.f4);
                              }
                            }
                        ),

                        customTextField(
                            controller: model.controllers[3],
                            focusNode: model.f4,
                            onChanged: (val){
                              if(val == ''){
                                model.onChange(context, model.f3);

                              }else {

                                model.onChange(context, model.f5);
                              }
                            }
                        ),

                        customTextField(
                            controller: model.controllers[4],
                            focusNode: model.f5,
                            onChanged: (val){

//                              model.onChange(context, model.f6);
                              if(val == ''){
                                model.onChange(context, model.f4);

                              }else {

                                model.onChange(context, model.f6);
                              }

                            }
                        ),

                        SizedBox(width: 10.w,),

                        customTextField(
                            controller: model.controllers[5],
                            focusNode: model.f6,
                            onChanged: (val){
//                              model.onChange(context, model.f7);
                              if(val == ''){
                                model.onChange(context, model.f5);

                              }else {

                                model.onChange(context, model.f7);
                              }


                            }
                        ),

                        customTextField(
                            controller: model.controllers[6],
                            focusNode: model.f7,
                            onChanged: (val){
//                              model.onChange(context, model.f8);
                              if(val == ''){
                                model.onChange(context, model.f6);

                              }else {

                                model.onChange(context, model.f8);
                              }


                            }
                        ),

                        customTextField(
                            controller: model.controllers[7],
                            focusNode: model.f8,
                            onChanged: (val){
//                              model.onChange(context, model.f9);
                              if(val == ''){
                                model.onChange(context, model.f7);

                              }else {

                                model.onChange(context, model.f9);
                              }


                            }
                        ),

                        SizedBox(width: 10,),

                        customTextField(
                            controller: model.controllers[8],
                            focusNode: model.f9,
                            onChanged: (val){
//                              model.onChange(context, model.f10);
                              if(val == ''){
                                model.onChange(context, model.f8);

                              }else {

                                model.onChange(context, model.f10);
                              }


                            }
                        ),

                        customTextField(
                            controller: model.controllers[9],
                            focusNode: model.f10,
                            onChanged: (val){
//                              model.onChange(context, model.f11);
                              if(val == ''){
                                model.onChange(context, model.f9);

                              }else {

                                model.onChange(context, model.f11);
                              }


                            }
                        ),

                        customTextField(
                            controller: model.controllers[10],
                            focusNode: model.f11,
                            onChanged: (val){
//                              model.onChange(context, model.f12);
                              if(val == ''){
                                model.onChange(context, model.f10);

                              }else {

                                model.onChange(context, model.f12);
                              }

                            }
                        ),

                        customTextField(
                            controller: model.controllers[11],
                            focusNode: model.f12,
                            onChanged: (val){
                              if(val == ''){
                                model.onChange(context, model.f11);

                              }
                              model.checkControllerValue();
//                              model.onChange(context, model.f12);



                            }
                        ),
                      ],
                    ),
                  ),
                      SizedBox(height: 206.h,),

                      RoundedButton(
                        press: (){
                          model.isValueFilled ?
                          Utils.push(VerifyOtpScreen(), context)
                          : Get.snackbar("Enter Number", "Kindly Fill Number", backgroundColor: blue);
                        },
                          text: "Send Code",
                          color:  model.isValueFilled ?   blue : unActive_button_silver_color,
                          textColor: model.isValueFilled ? Colors.white : textColor, width: 314.w)


                    ],
                  ),
                ),
              ),
            ),

          ),


        ),
    );
  }

  Widget customTextField({TextEditingController? controller, onChanged, FocusNode? focusNode}) {
    return Container(
        width: 13.w,
        margin: EdgeInsets.only(right: 4.w),
        child: TextField(
          onChanged: onChanged,
          onSubmitted: onChanged,
          controller: controller,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          keyboardType: TextInputType.number,
          focusNode: focusNode,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: controller!.text.isEmpty ? textColor : Colors.transparent)

            ),
            disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey)

            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey)

            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)

            ),

          ),
        ),);
  }
}

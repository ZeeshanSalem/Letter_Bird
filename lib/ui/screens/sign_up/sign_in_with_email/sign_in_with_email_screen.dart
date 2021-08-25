import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/screens/sign_up/sign_in_with_email/sign_in_with_email_view_model.dart';
import 'package:letter_bird_project/ui/screens/sign_up/sign_in_with_email/verify_otp_with_email/verify_with_email_screen.dart';
import 'package:letter_bird_project/ui/screens/sign_up/sign_in_with_phone_number/sign_in_number_view_model.dart';
import 'package:letter_bird_project/ui/screens/sign_up/verify_otp/verify_opt_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/assets/icons.dart';
import '../../../../core/assets/images.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/text_styles.dart';
import '../../../../core/text_styles.dart';

class SignInWithEmailScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ChangeNotifierProvider(
          create: (context) => SignInWithEmailViewModel(),
          child: Consumer<SignInWithEmailViewModel>(
            builder: (context, model, child) => SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 70, horizontal: 39),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageContainer(
                      width: 192.w,
                      height: 160.h,
                      assets: ImagesPath.letter_bird_vector,
                      radius: 0,
                    ),

                    SizedBox(height: 25.h,),

                    Text("Email Sign In",
                      style: titleTextStyle1.copyWith(color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.sp,
                      ),),

                    SizedBox(height: 25.h,),

                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis",
                      style: titleTextStyle1.copyWith(color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        height: 1.5,
                      ),),

                    SizedBox(height: 95.h,),

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
                          hintText: "yahoo@email.com",
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
                          Utils.push(VerifyOtpWithNumberScreen(), context);
                        },
                        text: "Send Code",
                        color:  model.isValueFilled ?   blue : unActive_button_silver_color,
                        textColor: model.isValueFilled ? Colors.white : textColor, width: 314.w),

                    SizedBox(height: 8.h,),

                    TextButton(
                      onPressed: (){}, child: Text("Not registered? Sign Up", style: titleTextStyle1.copyWith(fontSize: 12.sp),),),


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
      width: 10,
      margin: EdgeInsets.only(right: 5),
      child: TextField(
        onChanged: onChanged,
        onSubmitted: onChanged,
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

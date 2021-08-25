import 'dart:ui';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/core/validators.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/ui/screens/login/login3_gender/login_gender_models.dart';
import 'package:letter_bird_project/ui/screens/login/login3_gender/login_gender_view_model.dart';
import 'package:provider/provider.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../login4_avatar/login4.dart';

class LoginGenderScreen3 extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginGenderScreen3> {
  //int _stackIndex = 0;

  //String _singleValue = "Text alignment right";
  // String _verticalGroupValue = "Male";

 // List<String> _status = ["Male", "Female", "Other", "Anonymous"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
        create: (context) => LoginGenderViewModel(),
        child: Consumer<LoginGenderViewModel>(
            builder: (context, model, child) => SafeArea(
                    child: Scaffold(
                  body: model.state == ViewState.loading
                      ? Center(
                          child: Platform.isAndroid
                              ? CircularProgressIndicator()
                              : CupertinoActivityIndicator(),
                        )
                      : Container(
                          color: whiteColor,
                          child: Column(
                            children: [
                              Expanded(
                                  child: SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.all(25),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20.h),
                                      SvgPicture.asset(IconsPath.sign_in_logo,
                                          semanticsLabel: 'Failed to load'),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      textView(
                                          text: "Gender",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.sp,
                                          textColor: textColor),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      textView(
                                          text:
                                              "Please select your gender. Your gender information is displayed on your profile page and can be viewed by other members.",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          textColor: textColor),
                                      SizedBox(height: 140.h),


                                      // RadioGroup<String>.builder(
                                      //   groupValue: _verticalGroupValue,
                                      //   onChanged: (value) => setState(() {
                                      //     _verticalGroupValue = value!;
                                      //   }),
                                      //   items: _status,
                                      //   itemBuilder: (item) => RadioButtonBuilder(
                                      //     item,
                                      //   ),
                                      //   activeColor: Colors.orange,
                                      //   spacebetween: 50,
                                      // ),

                                      RadioGroup<String>.builder(
                                        groupValue: model.genderValue!,
                                        // onChanged: (value) => setState(() {
                                        //   model.genderValue = value!;
                                        //
                                        //   print("on radio button clicked :$model._verticalGroupValue");
                                        // }),

                                        onChanged: (value){
                                          // model.genderValue=value!;
                                          model.onGenderChanged(value!);
                                        },
                                        items: model.genderStringList,
                                        itemBuilder: (item) =>
                                            RadioButtonBuilder(
                                          item,
                                        ),
                                        activeColor: Colors.orange,
                                        spacebetween: 50,
                                      ),


                                    ],
                                  ),
                                ),
                              )),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 50.w, right: 50.w),
                                    child: RoundedButton(
                                      text: "Next",
                                      color: blue,
                                      textColor: whiteColor,
                                      width: size.width,
                                      press: () {
                                        Utils.push(LoginScreen4(), context);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                            height: 5,
                                            color: Colors.red,
                                          )),
                                      Expanded(
                                          flex: 7,
                                          child: Container(
                                            height: 5,
                                            color: lightest_grey,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                ),),),);
  }
}

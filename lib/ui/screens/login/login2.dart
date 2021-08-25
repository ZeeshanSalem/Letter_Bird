import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/core/validators.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/screens/login/login3_gender/login3.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen2> {
  late DatePickerController _controller;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    _controller = DatePickerController(
        initialDateTime: DateTime.now(), minYear: 1900, maxYear: 2050);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget body = Loader(
      child: Container(
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

                        SvgPicture.asset(IconsPath.calendar_icon,
                            semanticsLabel: 'Failed to load'),

                        SizedBox(
                          height: 15.h,
                        ),
                        textView(
                            text: "Date of birth",
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            textColor: textColor),
                        SizedBox(
                          height: 10.h,
                        ),
                        textView(
                            text:
                            "Please enter your date of birth. Your date of birth will be used for a better correspondence experience and can only be viewed by you.",
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            textColor: textColor),

                        SizedBox(height: 50.h),


                        ScrollDatePicker(
                          controller: _controller,
                          locale: DatePickerLocale.en_us,
                          pickerDecoration: BoxDecoration(
                              border: Border.all(color: lightest_grey, width: 2.0)),
                          config: DatePickerConfig(
                              isLoop: false,

                              selectedTextStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 17.0.sp)),
                          onChanged: (value) {
                            setState(() {
                              _selectedDate = value;
                            });
                          },
                        ),


                      ],
                    ),
                  ),
                )),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 50.w, right: 50.w,top: 5.h),
                  child: RoundedButton(
                      text: "Next",
                      color: blue,
                      textColor: whiteColor,
                      width: size.width,
                    press: (){
                      Utils.push(LoginGenderScreen3(), context);
                    },
                  ),
                ),
                // textButton(
                //     child: Text(
                //       "Create account",
                //       style: TextStyle(color: textColor),
                //     ),
                //     // onPressed: () => Utils.push(Signup(), context)
                //
                //     onPressed: (){}
                // )

                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 5,
                          color: Colors.red,
                        )),
                    Expanded(
                        flex: 8,
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
    );
    return SafeArea(
      child: Scaffold(
        body: body,
      ),
    );
  }

//   void login() async {
//     setState(() {
// //      isLoading = true;
//     });
//
//     var data = {
//       "email": "$email",
//       "password": "$password",
//     };
//
//     try {
//       Response response = await dio.post(ApiConfig.login, data: data);
//       print(response.statusCode.toString() + "Status Code");
//       print(response.data.toString() + "data Code");
//       logger.i(response.data);
//       if (response.statusCode == 200) {
//         var user = User.fromJson(response.data);
//         String authToken = response.headers['x-auth'].toString(); //it shows "[]" special symbol in the string
//         await AppPref().setAuthToken(authToken.substring(1, authToken.length - 1)); //remove symbol and save
//         await AppPref().saveUser(user);
//         await AppPref().setLoggedIn(true);
//         appUser = user as User;
//         Utils.pushAndRemoveUntil(CompleteProfile(), context);
//       }
//     } on DioError catch (e) {
//       if (e.response.statusCode == 401) {
//         if(e.response.data != null) {
//           logger.e(e.response.data['message']);
//
//           Fluttertoast.showToast(msg: e.response.data['message']);
//         } else{
//           Fluttertoast.showToast(msg: "Error");
//         }
//       } else {
//         logger.e(e.message);
//       }
//     }
//
//     setState(() {
// //      isLoading = false;
//     });
//   }
}

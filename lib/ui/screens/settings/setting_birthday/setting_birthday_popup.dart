import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class SettingBirthdayPopup1 extends StatelessWidget {
  const SettingBirthdayPopup1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: light_black,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: light_black,
        systemNavigationBarIconBrightness: Brightness.dark
    ));

    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: light_black,
        child: Column(
          children: [

            Expanded(
              flex: 5,
              child: Container(
              ),
            ),


            Expanded(
              flex: 6,
              child: Container(
                width: size.width,
                height: size.height,
                color: bgScreenColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    textView(
                        textAlign: TextAlign.start,
                        text:
                        "Select Birthday",
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        textColor: textColor),

                    SizedBox(
                      height: 20.h,
                    ),


                    // ScrollDatePicker(
                    //   controller: _controller,
                    //   locale: DatePickerLocale.en_us,
                    //   pickerDecoration: BoxDecoration(
                    //       border: Border.all(color: lightest_grey, width: 2.0)),
                    //   config: DatePickerConfig(
                    //       isLoop: false,
                    //
                    //       selectedTextStyle: TextStyle(
                    //           fontWeight: FontWeight.w600,
                    //           color: Colors.black,
                    //           fontSize: 17.0.sp)),
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _selectedDate = value;
                    //     });
                    //   },
                    // ),




                    Container(
                      margin: EdgeInsets.only(
                        left: 50.w,
                        right: 50.w,
                        top: 16.h
                      ),
                      child: RoundedButton(
                        text: 'Save',
                        color: blue,
                        textColor: whiteColor,
                        width: size.width,
                        press: () {
                          //Move to sign up page
                          //Utils.push(LoginScreen5(), context);
                        },
                      ),
                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class SettingBirthdayPopup extends StatefulWidget {
  const SettingBirthdayPopup({Key? key}) : super(key: key);

  @override
  _SettingBirthdayPopupState createState() => _SettingBirthdayPopupState();
}

class _SettingBirthdayPopupState extends State<SettingBirthdayPopup> {
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: light_black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: light_black,
        systemNavigationBarIconBrightness: Brightness.light
    ));

    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: light_black,
        child: Column(
          children: [

            Expanded(
              flex: 4,
              child: Container(
              ),
            ),


            Expanded(
              flex: 6,
              child: Container(
                width: size.width,
                height: size.height,
                color: bgScreenColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    textView(
                        textAlign: TextAlign.start,
                        text:
                        "Select Birthday",
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        textColor: textColor),

                    SizedBox(
                      height: 20.h,
                    ),


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




                    Container(
                      margin: EdgeInsets.only(
                          left: 50.w,
                          right: 50.w,
                          top: 16.h
                      ),
                      child: RoundedButton(
                        text: 'Save',
                        color: red,
                        textColor: whiteColor,
                        width: size.width,
                        press: () {
                          //Move to sign up page
                          //Utils.push(LoginScreen5(), context);
                        },
                      ),
                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}


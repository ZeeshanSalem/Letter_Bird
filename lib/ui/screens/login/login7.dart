import 'dart:ui';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/core/validators.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/screens/login/login6_country/city/login6_city.dart';
import 'package:letter_bird_project/ui/screens/login/login6_country/login6_country.dart';
import 'package:letter_bird_project/ui/screens/login/login8_language/login8Language.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class LoginScreen7 extends StatefulWidget {
  final String countryId;
  final String country;
  final String city;


  LoginScreen7(this.country, this.city, this.countryId);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen7> {


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: themeColor,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 35,right: 35),
                // height: size.height,
                // width: size.width,
                width: double.infinity,
                height: double.infinity,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          GestureDetector(
                            onTap:(){
                              Utils.pushAndRemoveUntil(CountryScreen(), context);
                            },
                            child: textField(
                              enable: false,
                              label: "Country",
                              // onSaved: (input) => name = input,
                              hintText: widget.country,
                              validator: (val) {
                                var nameValidation =
                                Validators.validateName(val!, );
                              },
                              suffix: Icon(Icons.arrow_forward_ios),
                              textInputAction: TextInputAction.next,
                            ),
                          ),


                          GestureDetector(
                            onTap:(){
                              Utils.pushAndRemoveUntil(CityScreen(country: widget.country, countryId: widget.countryId), context);
                            },
                            child: textField(
                              enable: false,
                              label: "City",
                              // onSaved: (input) => name = input,
                              hintText: widget.city,
                              validator: (val) {
                                var nameValidation =
                                Validators.validateName(val!, );
                              },
                              suffix: Icon(Icons.arrow_forward_ios),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ],
                      )
                      // child: Wrap(
                      //   children: companyPosition.toList(),
                      // ),
                    ),
                  ],
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(IconsPath.location_icon,
                          semanticsLabel: 'Failed to load'),
                      SizedBox(
                        height: 15.h,
                      ),
                      textView(
                          text: "Where you live",
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          textColor: textColor),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 32, right: 32),
                        child: textView(
                            text:
                                "Please select country and city information. Your country information can be viewed by other members, city information is confidential.",
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            textColor: textColor),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            left: 50,
                            right: 50,
                            bottom: 20,
                          ),
                          child: RoundedButton(
                            text: 'Next',
                            color: blue,
                            textColor: whiteColor,
                            width: size.width,
                            press: () {
                            //  print("current index :$currentIndex");
                              //Move to sign up page
                              Utils.push(LoginScreen8Language(), context);
                            },
                          ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Container(
                                height: 8,
                                color: Colors.red,
                              )),
                          Expanded(
                              flex: 4,
                              child: Container(
                                height: 8,
                                color: lightest_grey,
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

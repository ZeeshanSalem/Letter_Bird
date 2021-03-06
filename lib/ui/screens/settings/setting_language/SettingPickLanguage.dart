import 'dart:ui';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
import 'package:letter_bird_project/ui/screens/login/login6_country/login6_country.dart';
import 'package:letter_bird_project/ui/screens/login/login8SelectLanguage.dart';
import 'package:letter_bird_project/ui/screens/login/login9Otp.dart';
import 'package:letter_bird_project/ui/screens/sign_up/enter_number_screen/sign_up_enter_number.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';


class SettingPickLanguage extends StatefulWidget {
  final String nativeLanguageText;
  final List<PickLanguageModel> languageList;

  SettingPickLanguage(this.nativeLanguageText, this.languageList);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SettingPickLanguage> {
  @override
  void initState() {
    super.initState();

    print("list size in init :${widget.languageList.length}");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: bgScreenColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: bgScreenColor,
        systemNavigationBarIconBrightness: Brightness.dark));

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: themeColor,
        body: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(left: 35, right: 35),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                    Expanded(
                        flex: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textView(
                                    text: '${widget.nativeLanguageText}',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    textColor: textColor),
                                textView(
                                    text: 'Native Language',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    textColor: grey)
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: widget.languageList.length != 0
                                  ? ListView.builder(
                                      itemCount: widget.languageList.length,
                                      itemBuilder: (context, itemIndex) {
                                        return Slidable(
                                          child: ItemWidget(
                                              data: widget.languageList[itemIndex]),


                                            actionPane: SlidableDrawerActionPane(),
                                            actionExtentRatio: 0.25,
                                            secondaryActions: [
                                              // watch(cartListProvider.notifier).state
                                              IconSlideAction(
                                                caption: 'Delete',
                                                icon: Icons.delete,
                                                color: red,
                                                onTap: () async {
                                                  setState(() {
                                                    widget.languageList.removeAt(itemIndex);
                                                  });

                                                  },
                                              )
                                            ]

                                        );
                                      })
                                  : SizedBox(
                                      height: 10,
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
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SvgPicture.asset(IconsPath.location_icon,
                        //     semanticsLabel: 'Failed to load'),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        // textView(
                        //     text: "Language",
                        //     fontWeight: FontWeight.w700,
                        //     fontSize: 18.sp,
                        //     textColor: textColor),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 40.w),
                          // child: CustomAppBar(appBarTitle: "Unread",textColor: textColor,),
                          child: appBarWidget(context,
                              title: "Languages",
                              backImage: IconsPath.back_icon),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 32, right: 32),
                          child: textView(
                              text:
                                  "Please select your languages. You can add up to 4 languages including your native language. Your language information is displayed on your profile page and can be viewed by other members. We use this data for better match results.",
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              textColor: textColor),
                        ),
                      ],
                    ),
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
                          text: 'Change Native',
                          color: lightest_grey,
                          textColor: textColor,
                          width: size.width,
                          press: () {
                            //  print("current index :$currentIndex");
                            //Move to sign up page
                            Utils.push(
                                SelectLanguage(
                                  isNative: false,
                                  nativeText: widget.nativeLanguageText,
                                ),
                                context);
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 50,
                          right: 50,
                          bottom: 20,
                        ),
                        child: RoundedButton(
                          text: 'Add A Language',
                          color: blue,
                          textColor: whiteColor,
                          width: size.width,
                          press: () {
                            //  print("current index :$currentIndex");
                            //Move to sign up page
                            // Utils.push(
                            //     SelectLanguage(
                            //       isNative: false,
                            //     ),
                            //     context);

                            // Utils.push(
                            //     SignUpEnterNumberScreen(),
                            //     context);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
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

class ItemWidget extends StatelessWidget {
  final PickLanguageModel data;

  const ItemWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 10.0.h,bottom: 10.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textView(
              text: '${data.languageName}',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              textColor: textColor),
          Container(
            child: RatingBar(
              updateOnDrag: true,
              initialRating: data.rating,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              ignoreGestures: true,
              ratingWidget: RatingWidget(
                full: Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
                half: Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                ),
                empty: Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                ),
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemSize: 10,
              onRatingUpdate: (rating) {
                print(rating);
                // setState(() {
                //   interestedRating=0;
                // });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PickLanguageModel {
  String languageName;
  double rating;

  PickLanguageModel(this.languageName, this.rating);
}

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
import 'package:letter_bird_project/ui/screens/login/login5_interest/login5_interest_view_model.dart';
import 'package:letter_bird_project/ui/screens/login/login6_country/login6.dart';
import 'package:provider/provider.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class LoginScreen5 extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen5> {
  //List<SliderModel> slides = [];
  int currentIndex = 0;
  late PageController controller;

  late GlobalKey<ScaffoldState> _key;
  late List<List<CompanyWidget>> chipList;
  late List<CompanyWidget> _companies;
  late List<String> _filters;

  late String _totalSelectedChips;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
    //slides = getSlides();

    _key = GlobalKey<ScaffoldState>();
    chipList = [];
    _filters = <String>[];

    List<CompanyWidget> slider1;
    slider1 = <CompanyWidget>[
      CompanyWidget('Book'),
      CompanyWidget('Music'),
      CompanyWidget('Movies'),
      CompanyWidget('Going out'),
      CompanyWidget('Adventure'),
      CompanyWidget('Nature'),
      CompanyWidget('Dancing'),
      CompanyWidget('Art'),
      CompanyWidget('Writing'),
      CompanyWidget('Chill'),
      CompanyWidget('Innovation'),
      CompanyWidget('Science'),
      CompanyWidget('History'),
      CompanyWidget('Music3'),
      CompanyWidget('Music4'),
      CompanyWidget('Music5'),
    ];

    List<CompanyWidget> slider2;
    slider2 = <CompanyWidget>[
      CompanyWidget('Book2'),
      CompanyWidget('Music2'),
      CompanyWidget('Movies'),
      CompanyWidget('Going out'),
      CompanyWidget('Adventure'),
    ];

    chipList.add(slider1);
    chipList.add(slider2);

    _companies = chipList[0];

    _totalSelectedChips = "0/15";
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => Login5InterestViewModel(),
      child: Consumer<Login5InterestViewModel>(
        builder: (context, model, child)=> SafeArea(
          child: Scaffold(
            key: _key,
            // backgroundColor: themeColor,
            body: Stack(
              children: [
                Container(
                    // height: size.height,
                    // width: size.width,
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                          ),
                        ),
                        Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: textView(
                                      // text: "0/15",
                                      text: _totalSelectedChips,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      textColor: textColor),
                                ),
                                Expanded(
                                  child: PageView.builder(
                                      onPageChanged: (value) {
                                        setState(() {
                                          print("Current Index :$value");
                                          currentIndex = value;
                                          _companies = chipList[currentIndex];
                                        });
                                      },
                                      scrollDirection: Axis.horizontal,
                                      itemCount: chipList.length,
                                      itemBuilder: (context, index) {
                                        return getSlides();
                                      }),
                                )
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
                          SvgPicture.asset(IconsPath.interests_icon,
                              semanticsLabel: 'Failed to load'),
                          SizedBox(
                            height: 15.h,
                          ),
                          textView(
                              text: "Your interests",
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
                                    "Choose your interests min 3. This will provide you to best maching with your friend that shares same interest with you.",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              chipList.length,
                              (index) => buildDot(index, context),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                left: 50,
                                right: 50,
                                bottom: 20,
                              ),

                              child :RoundedButton(
                                text: 'Next',
                                color: _filters.length<3 ? lightest_grey : blue,
                                textColor: _filters.length<3 ? textColor : whiteColor,
                                width: size.width,
                                press: () {
                                  if (_filters.length>=3) {
                                    print("current index :$currentIndex");
                                    //Move to sign up page
                                    Utils.push(LoginScreen6(), context);
                                  }
                                },
                              )

                              // child: (currentIndex == chipList.length - 1)
                              //     ? RoundedButton(
                              //         text: 'Next',
                              //         color: blue,
                              //         textColor: whiteColor,
                              //         width: size.width,
                              //         press: () {
                              //           print("current index :$currentIndex");
                              //           //Move to sign up page
                              //           Utils.push(LoginScreen6(), context);
                              //         },
                              //       )
                              //     : RoundedButton(
                              //         text: 'Next',
                              //         color: lightest_grey,
                              //         textColor: light_black,
                              //         width: size.width,
                              //         press: () {
                              //           setState(() {
                              //             if (currentIndex < chipList.length - 1) {
                              //               currentIndex++;
                              //               print("current index :$currentIndex");
                              //               _companies = chipList[currentIndex];
                              //             }
                              //           });
                              //         },
                              //       )
                              //

                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    height: 8.h,
                                    color: Colors.red,
                                  )),
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    height: 8.h,
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
        ),
      ),
    );
  }

  // container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 1),
        child: currentIndex == index
            ? Container(
                width: currentIndex == index ? 12 : 10,
                height: currentIndex == index ? 12 : 10,
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              )
            : Container(
                width: currentIndex == index ? 12 : 10,
                height: currentIndex == index ? 12 : 10,
                decoration:
                    BoxDecoration(color: lightest_grey, shape: BoxShape.circle),
              ));
  }

//  Widget getSingleChipSlider(CompanyWidget company) {
//    return Padding(
//      padding: const EdgeInsets.all(6.0),
//      child: FilterChip(
//        backgroundColor: lightest_grey,
//        label: Text(
//          company.name,
//        ),
//        selected: _filters.contains(company.name),
//        selectedColor: Colors.redAccent,
//        onSelected: (bool selected) {
//          setState(() {
//            if (selected) {
//              _filters.add(company.name);
//            } else {
//              _filters.removeWhere((String name) {
//                return name == company.name;
//              });
//            }
//
//            if (_filters.isNotEmpty) {
//              for (var item in _filters) {
//                print("Filter List :$item");
//              }
//            }
//          });
//        },
//      ),
//    );
//  }

  Iterable<Widget> get companyPosition sync* {
    print("in company position");
    for (CompanyWidget company in _companies) {
      yield Padding(
        padding: const EdgeInsets.all(6.0),
        child: FilterChip(
          backgroundColor: lightest_grey,
          label: Text(
            company.name,
          ),
          selected: _filters.contains(company.name),
          selectedColor: Colors.redAccent,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                if (_filters.length==15) {
                  Fluttertoast.showToast(
                      msg: "Interest cannot be more then 15",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                } else {
                  _filters.add(company.name);
                }
              } else {
                _filters.removeWhere((String name) {
                  return name == company.name;
                });
              }

              if (_filters.isNotEmpty) {
                for (var item in _filters) {
                  print("Filter List :$item");
                }
                _totalSelectedChips = "${_filters.length}/15";
              }
            });
          },
        ),
      );
    }
  }

  Widget getSlides() {
    return Container(
      margin: EdgeInsets.only(left: 50, right: 50),
      child: Wrap(
        children: companyPosition.toList(),
      ),
      // child: GridView.builder(
      //     itemCount: _companies.length,
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         mainAxisExtent: 80,
      //         mainAxisSpacing: 10,
      //         crossAxisSpacing: 1,
      //         crossAxisCount: 3,
      //         childAspectRatio: 0.1),
      //     itemBuilder: (context, index) {
      //       return Wrap(
      //         children: companyPosition.toList(),
      //       );
      //     }),
    );
  }
}

class CompanyWidget {
  const CompanyWidget(this.name);

  final String name;
}

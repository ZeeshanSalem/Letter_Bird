import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/core/utils.dart';

import 'login8PickLanguage.dart';

class LanguageLevel extends StatefulWidget {
  final String nativeText;
  final String languageName;

  const LanguageLevel(
      {Key? key, required this.languageName, required this.nativeText})
      : super(key: key);

  @override
  _LanguageLevelState createState() => _LanguageLevelState();
}

class _LanguageLevelState extends State<LanguageLevel> {
  double interestedRating = 0;
  double beginnerRating = 0;
  double intermediateRating = 0;
  double advanceRating = 0;
  double fluentRating = 0;

//final rating
  double finalRating = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: light_black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: whiteColor,
        systemNavigationBarIconBrightness: Brightness.dark));

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: light_black,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        textView(
                            text: 'Level',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            textColor: light_black),

                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textView(
                                text: 'Interested',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                textColor: grey),
                            Container(
                              child: RatingBar(
                                updateOnDrag: true,
                                initialRating: interestedRating,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                  full: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                  ),
                                  half: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                  ),
                                  empty: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemSize: 10,
                                onRatingUpdate: (rating) {
                                  print(rating);
                                  setState(() {
                                    interestedRating = rating;
                                    beginnerRating = 0;
                                    intermediateRating = 0;
                                    advanceRating = 0;
                                    fluentRating = 0;
                                    //setting it to final
                                    finalRating=rating;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Divider(
                          thickness: 2,
                          color: lightest_grey,
                        ),

                        // beginner section
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textView(
                                text: 'Beginner',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                textColor: grey),
                            Container(
                              child: RatingBar(
                                updateOnDrag: true,
                                initialRating: beginnerRating,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                  full: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                  ),
                                  half: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                  ),
                                  empty: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemSize: 10,
                                onRatingUpdate: (rating) {
                                  print(rating);
                                  setState(() {
                                    interestedRating = 0;
                                    beginnerRating = rating;
                                    intermediateRating = 0;
                                    advanceRating = 0;
                                    fluentRating = 0;
                                    //setting it to final
                                    finalRating=rating;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Divider(
                          thickness: 2,
                          color: lightest_grey,
                        ),

                        // Intermediate section
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textView(
                                text: 'Intermediate',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                textColor: grey),
                            Container(
                              child: RatingBar(
                                updateOnDrag: true,
                                initialRating: intermediateRating,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                  full: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                  ),
                                  half: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                  ),
                                  empty: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemSize: 10,
                                onRatingUpdate: (rating) {
                                  print(rating);
                                  setState(() {
                                    interestedRating = 0;
                                    beginnerRating = 0;
                                    intermediateRating = rating;
                                    advanceRating = 0;
                                    fluentRating = 0;

                                    //setting it to final
                                    finalRating=rating;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Divider(
                          thickness: 2,
                          color: lightest_grey,
                        ),

                        // Advance section
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textView(
                                text: 'Advance',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                textColor: grey),
                            Container(
                              child: RatingBar(
                                updateOnDrag: true,
                                initialRating: advanceRating,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                  full: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                  ),
                                  half: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                  ),
                                  empty: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemSize: 10,
                                onRatingUpdate: (rating) {
                                  print(rating);
                                  setState(() {
                                    interestedRating = 0;
                                    beginnerRating = 0;
                                    intermediateRating = 0;
                                    advanceRating = rating;
                                    fluentRating = 0;

                                    //setting it to final
                                    finalRating=rating;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Divider(
                          thickness: 2,
                          color: lightest_grey,
                        ),

                        // Fluent section
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textView(
                                text: 'Fluent',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                textColor: grey),
                            Container(
                              child: RatingBar(
                                updateOnDrag: true,
                                initialRating: fluentRating,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                  full: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                  ),
                                  half: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                  ),
                                  empty: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemSize: 10,
                                onRatingUpdate: (rating) {
                                  print(rating);
                                  setState(() {
                                    interestedRating = 0;
                                    beginnerRating = 0;
                                    intermediateRating = 0;
                                    advanceRating = 0;
                                    fluentRating = rating;

                                    //setting it to final
                                    finalRating=rating;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Divider(
                          thickness: 2,
                          color: lightest_grey,
                        ),
                      ],
                    ),
                  ),
                  RoundedButton(
                    text: 'Add',
                    color: finalRating>0 ?blue: lightest_grey,
                    textColor: finalRating>0 ?whiteColor: textColor,
                    width: size.width,
                    press: () {
                      if (finalRating!=0) {
                        List<PickLanguageModel> list = [];
                        list.add(PickLanguageModel(
                            widget.languageName, finalRating));
                        print("list size :${list.length}");
                        Utils.push(
                            LoginScreen8PickLanguage(widget.nativeText, list),
                            context);
                      }

                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

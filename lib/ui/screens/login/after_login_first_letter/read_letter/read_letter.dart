import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/constants/contant_strings.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/ui/screens/login/after_login_first_letter/first_letter_view_model.dart';
import 'package:letter_bird_project/ui/screens/login/after_login_first_letter/read_letter/regular_letter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReadLetter extends StatelessWidget {
  const ReadLetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => FirstLetterViewModel(),
      child: Consumer<FirstLetterViewModel>(
        builder: (context, model, child) => SafeArea(
            child: Scaffold(
          backgroundColor: bgScreenColor,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                // child: CustomAppBar(appBarTitle: "Unread",textColor: textColor,),
                child: appBarWidget(context,
                    title: "Read", backImage: IconsPath.back_icon),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 35, right: 35),
                child: Stack(
                  children: [
                    Image.asset(
                      ImagesPath.read_bg_img,
                      height: size.height,
                      width: size.width,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 21, right: 21, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Utils.push(RegularLetter(), context);
                              },
                              child: Image.asset(IconsPath.expand_icon)),
                          Expanded(
                              child: textView(
                                  text: ConstantStrings.readText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  textColor: textColor,
                                  wordSpacing: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textView(
                                  text: "12.12.2020  12:30",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  textColor: textColor,
                                  wordSpacing: 1),
                              textView(
                                  text: "Letter Bird",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  textColor: textColor,
                                  wordSpacing: 1)
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
              Container(
                margin: EdgeInsets.only(
                    left: 25.sp, right: 25.sp, bottom: 30, top: 30),
                width: 146.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                        // blurRadius: 2.0,
                        ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          IconsPath.heart_icon,
                          color: whiteColor,
                        )),
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          IconsPath.heart_icon,
                          color: whiteColor,
                        )),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

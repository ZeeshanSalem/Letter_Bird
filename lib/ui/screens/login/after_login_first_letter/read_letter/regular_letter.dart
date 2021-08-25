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
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegularLetter extends StatelessWidget {
  const RegularLetter({Key? key}) : super(key: key);

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
              Expanded(
                  child: Container(
                // margin: EdgeInsets.only(left: 35, right: 35),
                child: Stack(
                  children: [
                    Image.asset(
                      ImagesPath.read_bg_img,
                      height: size.height,
                      width: size.width,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 21, right: 21, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {},
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

            ],
          ),
        )),
      ),
    );
  }
}

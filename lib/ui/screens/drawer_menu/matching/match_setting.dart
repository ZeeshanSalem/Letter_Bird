import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/bottom_sheet/age_range_slider_bottom_sheet.dart';
import 'package:letter_bird_project/ui/custom_widgets/bottom_sheet/matching_gender_bottom_sheet.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:get/get.dart';
import 'package:letter_bird_project/ui/screens/drawer_menu/match_user/match_user_screen.dart';

class MatchSettings extends StatefulWidget {
  @override
  _MatchSettingsState createState() => _MatchSettingsState();
}

class _MatchSettingsState extends State<MatchSettings> {
  bool nativeMatch  = false;
  bool countryMatch  = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Center(
              child: Column(
                children: [
                  CustomAppBar(
                      textColor: light_black,
                      iconColor: light_black,
                      appBarTitle: "Match Setting"),

                  SizedBox(height: 25.h,),

                  ImageContainer(
                    height: 85.h,
                    width: 80.w,
                    assets: ImagesPath.setting_vector,
                    radius: 0.r,
                  ),

                  SizedBox(height: 35.h,),

                  Text("You can adjust your matcing options here, For more accurate plase choose appropriate selections. It will overwrite the settings on the main settings menu.",
                    style: kufamTextStyle.copyWith(color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      height: 1.5,
                    ),),

                  SizedBox(height: 90.h,),

                  InkWell(
                    onTap: (){
                      Get.bottomSheet(AgeRangesSliderBottomSheet());
                    },
                    child: _customTile(
                      field: "Age range",
                      lastWidget: Text("13-65+", style: subtitleTextStyle1.copyWith(
                        color: dark_red_color,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),)
                    ),
                  ),
                  SizedBox(height: 35.h,),

                  InkWell(
                    onTap: (){
                      Get.bottomSheet(MatchingGenderBottomSheet());
                    },
                    child: _customTile(
                        field: "Matching gender",
                        lastWidget: Text("Multi Selection >", style: subtitleTextStyle1.copyWith(
                          color: dark_red_color,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),)
                    ),
                  ),
                  SizedBox(height: 61.h,),

                  _customTile(
                      field: "Keep my native in match",
                      lastWidget: CupertinoSwitch(
                        value: nativeMatch,
                        onChanged: (val){
                          setState(() {
                            nativeMatch = val;
                          });
                        },
                      ),
                  ),

                  SizedBox(height: 54.h,),

                  _customTile(
                    field: "Keep my native in match",
                    lastWidget: CupertinoSwitch(
                      value: countryMatch,
                      onChanged: (val){
                        setState(() {
                          countryMatch = val;
                        });
                      },
                    ),
                  ),


                  SizedBox(height: 133.h,),

                  RoundedButton(
                    width: double.infinity.w,
                    textColor: Colors.white,
                    text: "Match",
                    color: blue,
                    press: (){
                      Utils.push(MatchUserScreen(), context);

                    },
                  ),





                ],
              ),
            ),
          ),

        ),
    );
  }
}

Widget _customTile({Widget? lastWidget, String? field}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      Expanded(
        child: Text("${field!}", style: kufamTextStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
          color: light_black,
        ),),
      ),

      lastWidget != null ? lastWidget : Container(),


    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_divider.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/screens/drawer_menu/match_user/match_user_view_model.dart';
import 'package:provider/provider.dart';

class MatchUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: ChangeNotifierProvider(
            create: (context) => MatchUserViewModel(),
            child: Consumer<MatchUserViewModel>(
              builder:(context, model, child)=> SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    ///
                    /// User Image Avatar
                    ///
                    ImageContainer(
                      width: 127.w,
                      height: 140.h,
                      assets: ImagesPath.matching_avatar,
                      radius: 0.r,
                    ),

                    SizedBox(height: 11.h,),

                    Text("Id: 3812RUT", style: kufamTextStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp,
                      color: light_black,
                    ),),

                    SizedBox(height: 28.h,),

                    _dividerTile(),
                    ///
                    /// Country and Gender
                    ///
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          _fieldTile(valueWidget: Text("Turkey", style: kufamTextStyle.copyWith(color: light_black, fontSize: 14.sp),),
                              field: "Country"),

                          SizedBox(width: 68.w,),

                          _fieldTile(valueWidget: Text("Female", style: kufamTextStyle.copyWith(color: light_black, fontSize: 14.sp),),
                              field: "Gender"),
                        ],
                      ),
                    ),
                    _dividerTile(),


                    SizedBox(height: 18.h,),


                    ///
                    /// First Row Contain Language
                    ///
                    Row(
                      children: [
                        _fieldTile(valueWidget: Text("Native", style: kufamTextStyle.copyWith(fontSize: 14.sp, color: blue),),
                            field: "English"),

                        SizedBox(width: 74.w,),

                        _fieldTile(valueWidget: Row(children: [
                          _dot(),
                          SizedBox(width: 5.w,),

                          _dot(isSelected: true),
                          SizedBox(width: 5.w,),

                          _dot(isSelected: true),
                          SizedBox(width: 5.w,),

                          _dot(isSelected: true),
                          SizedBox(width: 5.w,),

                          _dot(isSelected: true),
                          SizedBox(width: 5.w,),
                        ],),
                            field: "Turkish"),

                      ],
                    ),


                  SizedBox(height: 9.h,),

                    ///
                    /// 2nd Row Contain Language
                    ///
                    Row(
                      children: [
                        _fieldTile(valueWidget: Row(children: [
                          _dot(),
                          SizedBox(width: 5.w,),

                          _dot(isSelected: true),
                          SizedBox(width: 5.w,),

                          _dot(isSelected: true),
                          SizedBox(width: 5.w,),

                          _dot(isSelected: true),
                          SizedBox(width: 5.w,),

                          _dot(isSelected: true),
                          SizedBox(width: 5.w,),
                        ],),
                            field: "English"),

                        SizedBox(width: 50.w,),

                        _fieldTile(valueWidget: Row(children: [
                          _dot(),
                          SizedBox(width: 5.w,),

                          _dot(),
                          SizedBox(width: 5.w,),

                          _dot(isSelected: true),
                          SizedBox(width: 5.w,),

                          _dot(isSelected: true),
                          SizedBox(width: 5.w,),

                          _dot(isSelected: true),
                          SizedBox(width: 5.w,),
                        ],),
                            field: "Turkish"),

                      ],
                    ),


                    ///
                    /// About User Section
                    ///
                    Padding(
                        padding: EdgeInsets.only(top: 25, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("About user", style: kufamTextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 22.sp,
                            color: light_black,
                          ),),
                        ],
                      ),
                    ),

                    ///
                    /// About User Description
                    ///
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tellus diam sed vivamus sit est dictum proin sed scelerisque. Est elementum ac, placerat euismod bibendum sit facilisis malesuada. Consectetur pretium turpis viverra amet lectus aenean donec pellentesque. ",
                      style: subtitleTextStyle1.copyWith(
                          height: 1.5,
                          fontSize: 14.sp, color: light_black),),


                    ///
                    /// Interest Section
                    ///
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Interest", style: kufamTextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            color: light_black,
                          ),),
                        ],
                      ),
                    ),

                    ///
                    /// Interest List
                    ///
                    Wrap(
                      runSpacing: 12.h,
                      spacing: 9.w,
                      children: List.generate(model.interests.length,
                              (index) => Container(
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Text("${model.interests[index]}", style: kufamTextStyle.copyWith(fontSize: 14.sp),),
                              )),
                    ),

                    ///
                    /// TODO: WILL CONFIRM TO CHECK IS IT SCROLLABLE
                    /// Dots
                    ///
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _dot(isSelected: true, selectedColor: orangeColor),
                        SizedBox(width: 5.w,),
                        _dot(),
                        SizedBox(width: 5.w,),
                        _dot(),
                        SizedBox(width: 5.w,),
                        _dot(),
                        SizedBox(width: 5.w,),
                      ],
                    ),
                    ),


                    ///
                    /// Buttons
                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButton(
                        text: "Rematch",
                        color: unActive_button_silver_color,
                        textColor: light_black,
                        width: 151.w,press: (){
                          Utils.pop(context);
                        },),

                        SizedBox(width: 12.w,),

                        RoundedButton(
                            text: "Write",
                            color: blue,
                            textColor: Colors.white,
                            width: 151.w),

                      ],
                    )






                  ],
                ),
              ),
            ),
          ),
        ),);
  }

  ///
  /// This is just used as Design
  ///
  Widget _dividerTile(){
    return Column(
      children: [
        Row(
          children: [
            CustomDivider(width: 309.w,),
            SizedBox(width: 20.w,),
          ],
        ),

        SizedBox(height: 5.h,),
        Row(
          children: [
            SizedBox(width: 20.w,),
            CustomDivider(width: 309.w,),
          ],
        ),
      ],
    );
  }

  ///
  /// This is used as field Tile and value widget will be any widget according to screen
  ///
  Widget _fieldTile({required valueWidget,required String field }){
    return Row(
      children: [
        Text("$field :", style: kufamTextStyle.copyWith(fontSize: 14.sp),),
        
        SizedBox(width: 10.w,),
        valueWidget,

      ],
    );
  }

  Widget _dot({Color selectedColor = light_red_color, Color unSelectedColor = const Color(0xffC4C4C4), bool isSelected = false}){
    return Container(
      height: 8.h,
      width: 8.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: isSelected ? selectedColor : unSelectedColor,
      ),
    );
  }


}

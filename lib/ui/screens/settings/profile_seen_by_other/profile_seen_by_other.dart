import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_divider.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/screens/settings/profile_seen_by_other/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileSeenByOtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProfileViewModel(),
    child: Consumer<ProfileViewModel>(
      builder: (context, model, child)=> SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            padding:  EdgeInsets.fromLTRB(50, 30, 50, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                ///
                /// Appbar of Screen
                ///
                CustomAppBar(
                    iconColor: light_black,
                    textColor: light_black,
                    appBarTitle: "Profile"),

                SizedBox(height: 65.h,),

                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae nisl pretium consectetur in donec pulvinar quis. ",
                style: kufamTextStyle.copyWith(
                  fontSize: 14.sp,
                  height: 1.5,
                ),
                ),


                SizedBox(height: 70.h,),


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

                CustomDivider(
                  width: double.infinity.w,
                ),

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


                CustomDivider(
                  width: double.infinity.w,
                ),


                SizedBox(height: 23.h,),

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







              ],
            ),
          ),
        ),
      ),
    ),
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

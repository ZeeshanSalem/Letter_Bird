import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/bottom_sheet/writing_screen_buttons.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/writing_screen_edit_tile.dart';
import 'package:letter_bird_project/ui/screens/drawer_menu/write/write_screen/writing_full_screen.dart';

class WriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 33),
            child: Column(
              children: [
                CustomAppBar(
                  iconColor: light_black,
                  textColor: light_black,
                  appBarTitle: "Write",),

                Padding(
                    padding: EdgeInsets.symmetric(vertical: 29),
                  child: ImageContainer(
                    height: 65.h,
                    width: 65.w,
                    assets: ImagesPath.profile_image,
                    radius: 0.r,
                  ),
                ),

                ///
                /// Writing Section
                ///

                Container(
                  height: 547.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImagesPath.background_image),
                      fit: BoxFit.contain
                    ),
                  ),

                  child: Column(
                    children: [

                      ///
                      /// Editable Tile
                      WriteScreenEditTile((){
                        Utils.push(WritingFullScreen(), context);
                      }),

                      SizedBox(height: 22.h,),

                      ///
                      /// Text Field
                      ///
                      TextField(
                        maxLines: 15,
                        style: kufamTextStyle.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        cursorColor: light_black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Write a letter at least 528 character lenght. \n\n""***(Premiums have 264 letter limit)",
                          hintStyle: kufamTextStyle.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: light_black.withOpacity(0.5),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 30.h,),

                ///
                /// Buttons
                ///
                WritingScreenButton(),
              ],
            ),
          ),
        ),
    );
  }
}

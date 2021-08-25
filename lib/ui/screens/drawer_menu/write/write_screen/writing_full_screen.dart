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

class WritingFullScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagesPath.background_image),
                  fit: BoxFit.fill
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ///
                        /// Editable Tile
                        Container(
                          margin:  EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                          child: WriteScreenEditTile((){
                            Utils.pop(context);
                          }),
                        ),


                        ///
                        /// Text Field
                        ///
                        Padding(
                          padding: EdgeInsets.fromLTRB(22, 0, 22, 20),
                          child: TextField(
                            maxLines: 20,
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
                        ),


                      ],
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(bottom: 40),
                  child: WritingScreenButton(),
                ),

              ],
            ),
          ),
        ));
  }
}

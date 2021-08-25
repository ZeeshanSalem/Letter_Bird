import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';

class PopUpPrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ImageContainer(
                              height: 71.h,
                              width: 60.w,
                              assets: ImagesPath.blue_shield_vector,
                              radius: 0.r,
                            ),

                            SizedBox(height: 26.h,),

                            Text("Terms", style: kufamTextStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),),

                            SizedBox(height: 16.h,),

                            Text("Rhoncus commodo volutpat et in dui habitant sit. Eros, morbi in consequat, iaculis a urna. Quis senectus pulvinar id nec et et tempor, felis. Auctor bibendum iaculis pellentesque metus, potenti. At eleifend risus, tellus amet, in lobortis et feugiat habitant. Habitasse quis nulla enim nec. Id dui quam ultricies ornare volutpat mattis scelerisque. Ut nunc libero pretium elementum tincidunt et mauris molestie. Odio hendrerit amet tristique nunc volutpat nulla vitae massa. Dolor odio faucibus elementum nunc nisl, mattis ut amet tellus. Et suscipit eu convallis vitae nisl feugiat pellentesque neque. Mi pellentesque quis lacus, vitae augue viverra fermentum rhoncus sem. At lorem accumsan blandit diam, neque. Donec massa lorem at ante. Ipsum porttitor rhoncus interdum vitae quisque. Eros risus fringilla cras erat congue leo mi sed. Molestie sed condimentum rhoncusneque. Mi",
                              style: kufamTextStyle.copyWith(
                              fontSize: 14.sp,
                                height: 1.8,
                            ),),

                          ],
                        ),
                      ),
                    ),),

                RoundedButton(
                    text: "Done", color: blue, textColor: Colors.white, width: 314.w),

              ],
            ),
          ),
        ),);
  }
}

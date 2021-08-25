import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';

class SettingPrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding:  EdgeInsets.symmetric(vertical: 30, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              ///
              /// Appbar of Screen
              ///
              CustomAppBar(
                  iconColor: light_black,
                  textColor: light_black,
                  appBarTitle: "Privacy Policy"),


              SizedBox(height: 25.h,),

              Expanded(
                child: RawScrollbar(
                  thumbColor: blue,
                  isAlwaysShown: true,
                  child: Padding(
                    padding:  EdgeInsets.only(right:8.0),
                    child: ListView(
                      children: [
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit praesent elit vel id in. Aliquet tortor elit fames adipiscing feugiat eu. Risus tortor proin arcu, mauris, massa eget mattis scelerisque interdum. Lectus mi mi urna odio tortor ullamcorper lorem ut. Aliquam tortor sed gravida nec, ante diam. Tincidunt nullam elementum in netus amet adipiscing. In nibh posuere massa amet pellentesque facilisi. Vehicula urna ullamcorper non sit hendrerit amet suspendisse felis. In donec bibendum nulla enim amet quis metus lectus feugiat. Neque ante ac, aliquam, et id tortor, a vulputate. Dolor sed lacus, nisl netus. A, non facilisis metus fringilla ullamcorper ultrices cursus. Sem lacus scelerisque amet faucibus. Odio laoreet senectus sed orci lectus etiam nunc.",
                          style: kufamTextStyle.copyWith(
                            color: textColor,
                            fontSize: 18.sp,
                            height: 2.0,
                          ),),

                          Text("In diam lorem tincidunt in. In purus fringilla viverra orci nulla. Scelerisque ac sollicitudin magna tincidunt fringilla arcu. Commodo massa vivamus condimentum malesuada. Volutpat pretium odio sit suscipit viverra cursus senectus. Eu ullamcorper non facilisis eu egestas id nec varius. Cum felis, amet molestie mauris urna dui orci, tempor. Mauris ultrices ultrices ac id tellus ac vitae. Ut dolor adipiscing odio dignissim morbi. Et ac sed blandit duis id sed in cras.",
                          style: kufamTextStyle.copyWith(
                            color: textColor,
                            fontSize: 18.sp,
                            height: 2.0,
                          ),),
                        Text("Est sit sed ac et. Lacus, volutpat, leo hendrerit leo libero ante enim. Varius non ante quis ",
                          style: kufamTextStyle.copyWith(
                          color: textColor,
                          fontSize: 18.sp,
                          height: 2.0,
                        ),),
                        SizedBox(height: 20.h,),
                        SizedBox(height: 20.h,),
                        SizedBox(height: 20.h,),



                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40.h,),

              RoundedButton(
                  text: "Done", color: blue,
                  textColor: Colors.white,
                  width: 314.w),




            ],
          ),
        ),
      ),);
  }
}

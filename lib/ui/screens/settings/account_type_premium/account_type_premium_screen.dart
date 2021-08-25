import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_divider.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/screens/settings/account_type_premium/account_type_premium_view_model.dart';
import 'package:provider/provider.dart';

class AccountTypePremiumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AccountTypePremiumViewModel(),
      child: Consumer<AccountTypePremiumViewModel>(
        builder: (context, model, child) => SafeArea(
            child: Scaffold(
              backgroundColor: backgroundColor,

              ///
              /// Body oF Screen
              ///
              body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    ///
                    /// Appbar of Screen
                    ///
                    CustomAppBar(
                        iconColor: light_black,
                        textColor: light_black,
                        appBarTitle: "Premium"),

                    SizedBox(height: 20.h,),

                    ///
                    /// Premium_vector
                    ///


                    ImageContainer(
                      width: 86.w,
                      height: 86.h,
                      assets: ImagesPath.premium_vector,
                      radius: 0.r,
                    ),


                    SizedBox(height: 30.h,),

                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae nisl pretium consectetur in donec pulvinar quis. ",
                    style: kufamTextStyle.copyWith(fontSize: 14.sp, height: 1.5),),


                    SizedBox(height: 40.h,),


                    ///
                    /// First Package
                    ///
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 17),
                      decoration: BoxDecoration(
                        border: Border(
                          top:BorderSide(color:light_black.withOpacity(0.2)),
                        ),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [

                            ImageContainer(
                              height: 9.h,
                              width: 14.w,
                              assets: ImagesPath.single_unSelected_coin,
                              radius: 0.r,
                            ),
                            SizedBox(width: 15.w,),

                            Text("1 Month", style: kufamTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),),

                            Spacer(),

                            Text("39,00₺/Month", style: kufamTextStyle.copyWith(fontSize: 14.sp),),
                          ],
                        ),
                      ),
                    ),


                    ///
                    /// Best Choice Package
                    ///
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
                      decoration: BoxDecoration(
                        color: light_red_color.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          ImageContainer(
                            height: 15.h,
                            width: 17.w,
                            assets: ImagesPath.multi_selected_coin,
                            radius: 0.r,
                          ),

                          SizedBox(width: 15.w,),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Best Choice", style: kufamTextStyle.copyWith(
                                color: light_red_color,
                                fontSize: 14.sp,
                              ),),
                              SizedBox(height: 2.h,),
                              Text("6 Months", style: kufamTextStyle.copyWith(
                                color: light_red_color,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),),
                            ],
                          ),

                          Spacer(),


                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("104,00₺", style: kufamTextStyle.copyWith(
                                color: light_red_color,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700
                              ),),
                              SizedBox(height: 2.h,),
                              Text("34,00₺/Month", style: kufamTextStyle.copyWith(
                                color: light_red_color,
                                fontSize: 14.sp,
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),


                    ///
                    /// Last Package
                    ///
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:BorderSide(color:light_black.withOpacity(0.2)),
                        ),
                      ),

                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            ImageContainer(
                              height: 15.h,
                              width: 17.w,
                              assets: ImagesPath.multi_unSelected_coin,
                              radius: 0.r,
                            ),

                            SizedBox(width: 15.w,),

                            Text("1 Year", style: kufamTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),),

                            Spacer(),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("230,00₺", style: kufamTextStyle.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700
                                ),),
                                SizedBox(height: 2.h,),
                                Text("29,00₺/Month", style: kufamTextStyle.copyWith(
                                  fontSize: 14.sp,
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),



                    ///
                    /// Free Coin Tile
                    ///
                    _upAndDownIconTile(
                        iconPath: IconsPath.square_arrow_up_icon, heading: "500 Free Coin Every Month"),

                    ///
                    /// Character Tile
                    ///
                    _upAndDownIconTile(
                        iconPath: IconsPath.square_arrow_down_icon, heading: "264 character writing limit"),

                    ///
                    /// Letter Limit Tile
                    ///
                    _generalTile(
                        heading: "2x Letter limit",
                        subHeading: "You will have 6 letter limit per day.",
                      iconText: "2x",
                    ),

                    ///
                    /// Delivery Tile
                    _generalTile(
                        iconPath: IconsPath.black_star_icon,
                        heading: "Shorter delivery time",
                        subHeading: "Your letter will be delivered in 120-180min. "),

                    ///
                    /// Add Free Tile
                    ///
                    _generalTile(
                        iconPath: IconsPath.black_star_icon,
                        heading: "Add free",
                        subHeading: ""),

                    ///
                    /// Premium Paper Tile
                    ///
                    _generalTile(
                        iconPath: IconsPath.message_icon,
                        heading: "More premium papers",
                        subHeading: "Only for premium users"),


                    ///
                    /// Premium Font Tile
                    ///
                    _generalTile(
                        iconPath: IconsPath.notification_icon,
                        heading: "Premium Fonts",
                        subHeading: "Only for premium users"),

                    ///
                    /// Latter Sent Tile
                    ///
                    _generalTile(
                        iconPath: IconsPath.message_icon,
                        heading: "Letter sent via direct or match",
                        subHeading: "Only for premium users"),

                    ///
                    /// Latter limit Tile
                    ///
                    _generalTile(
                        iconPath: IconsPath.square_arrow_up_icon,
                        heading: "2x Annonymous letter limit",
                        subHeading: "Premium users have 10 letter limits/day",
                    isHaveBorder: false,
                    ),



                    Text("For purchase transactions, these conditions apply. Check out the terms for details.",
                    style: kufamTextStyle.copyWith(
                      fontSize: 14.sp,
                      height: 1.5,
                    ),
                    ),

                    SizedBox(height: 16.h,),

                    RoundedButton(

                        text: "", color: blue, textColor: textColor, width: 314.w),






                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }

  ///
  /// This tile is used after Packages used as free coin and character
  ///
  Widget _upAndDownIconTile({required String iconPath, required String heading}){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom:BorderSide(color:light_black.withOpacity(0.2)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            ImageContainer(
              width: 19.w,
              height: 19.h,
              assets: iconPath,
              radius: 0.r,
            ),

            SizedBox(width: 15.w,),

            Text("$heading", style: kufamTextStyle.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),),

          ],
        ),
      ),
    );
  }


  ///
  /// This tile is general is used after Character Tile
  ///
  Widget _generalTile({String? iconPath,
    required String heading,
    required String subHeading,
    String? iconText,
    bool isHaveBorder = true,
  }){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom:BorderSide(color:isHaveBorder ? light_black.withOpacity(0.2): Colors.transparent),
        ),
      ),

      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ///
            /// Icon of Tile
            ///
            iconText == null ? ImageContainer(
              width: 18.w,
              height: 18.h,
              assets: iconPath!,
              radius: 0.r,
            ) :
                Text("$iconText", style: kufamTextStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),),
            SizedBox(width: 15.w,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$heading", style: kufamTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),),
                SizedBox(height: 5.h,),
                Text("$subHeading", style: kufamTextStyle.copyWith(
                  fontSize: 14.sp,
                ),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

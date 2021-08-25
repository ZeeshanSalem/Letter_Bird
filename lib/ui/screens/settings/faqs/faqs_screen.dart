import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/bottom_sheet/account_deactivition_sheet.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/screens/settings/faqs/faqs_view_model.dart';
import 'package:provider/provider.dart';

class FaqsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FaqsViewModel(),
      child: Consumer<FaqsViewModel>(
        builder: (context, model, child) => SafeArea(
            child: Scaffold(
//              backgroundColor: backgroundColor,
              body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: Column(
                  children: [


                    /// Appbar of Screen
                    ///
                    CustomAppBar(
                        iconColor: light_black,
                        textColor: light_black,
                        appBarTitle: "FAQ"),


                    SizedBox(height: 25.h,),
                    ///Account
                    _faqsExpentionTile(tileName: "Account"),

                    /// Privacy
                    _faqsExpentionTile(tileName: "Privacy"),

                    Text("We only share your ID, Country, Languages and Biography if you filled it. All other information will stay confidential. ",
                    style: kufamTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      height: 1.8,
                    ),
                    ),

                    SizedBox(height: 4.h,),

                    Text("We only share your ID, Country, Languages and Biography if you filled it. All other information will stay confidential. e only share your ID, Country, Languages and Biography if you filled it. All other information will stay confidential. ",
                      style: kufamTextStyle.copyWith(
                        fontSize: 14.sp,
                        height: 1.8,
                      ),
                    ),

                    SizedBox(height: 10.h,),


                    Text("We only share your ID, Country, Languages and Biography if you filled it. All other information will stay confidential. ",
                      style: kufamTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        height: 1.8,
                      ),
                    ),

                    SizedBox(height: 4.h,),

                    Text("We only share your ID, Country, Languages and Biography if you filled it. All other information will stay confidential. ",
                      style: kufamTextStyle.copyWith(
                        fontSize: 14.sp,
                        height: 1.8,
                      ),
                    ),

                    SizedBox(height: 10.h,),



                    /// Premium
                    _faqsExpentionTile(tileName: "Premium"),

                    /// Coins
                    _faqsExpentionTile(tileName: "Coins"),

                    /// Rules
                    _faqsExpentionTile(tileName: "Rules"),

                    /// Other
                    _faqsExpentionTile(tileName: "Other"),

                    SizedBox(height: 20.h,),

                    ///
                    /// Account Deactiviation
                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Deactivite account",
                        style: kufamTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                        ),

                        CupertinoSwitch(
                            value: model.isAccountDeactivited,
                            onChanged:(val) async{
                              model.onToggleAccountActivition(val);
                              if(model.isAccountDeactivited) {
                                bool isStillSelected = await Get.bottomSheet(
                                    AccountDeactiviatonSheet());
                                model.onToggleAccountActivition(
                                    isStillSelected);
                              }
                            }),
                      ],
                    ),

                    Padding(
                      padding:  EdgeInsets.only(top: 5, right: 40),
                      child: Text("You will be able to sign in to your account but you will not be able to send and receive letters.",
                      style: kufamTextStyle.copyWith(
                        fontSize: 14.sp,
                        height: 1.8,
                      ),
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

  Widget _faqsExpentionTile({String? tileName}){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: light_black.withOpacity(0.7),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text("${tileName!}",
          style: kufamTextStyle.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),),

          ImageContainer(
            width: 20.w,
            height: 20.h,
            assets: IconsPath.arrow_down_circle,
            radius: 0.r,
          ),
        ],
      ),
    );
  }
}

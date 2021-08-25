import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/bottom_sheet/accept_real_latter_and_gift_sheet.dart';
import 'package:letter_bird_project/ui/custom_widgets/bottom_sheet/keep_me_in_match_bottom_sheet.dart';
import 'package:letter_bird_project/ui/custom_widgets/bottom_sheet/keep_my_country_in_match_bottom_sheet.dart';
import 'package:letter_bird_project/ui/custom_widgets/bottom_sheet/keep_my_match_in_native_bottom_sheet.dart';
import 'package:letter_bird_project/ui/custom_widgets/bottom_sheet/link_copy_bottom_sheet.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_divider.dart';
import 'package:letter_bird_project/ui/custom_widgets/icon_rounded_button.dart';
import 'package:letter_bird_project/ui/screens/settings/account_type_premium/account_type_premium_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/age_range/age_range_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/agreement_and_policy/setting_privacy_policy_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/agreement_and_policy/setting_user_agreement_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/app_language/app_language_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/biography/biography.dart';
import 'package:letter_bird_project/ui/screens/settings/setting_avatar/setting_avatar.dart';
import 'package:letter_bird_project/ui/screens/settings/setting_birthday/setting_birthday.dart';

import 'package:letter_bird_project/ui/screens/settings/block_user/block_user_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/buy_coin/buy_coin_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/faqs/faqs_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/mail_Confirmation/mail_confirmation_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/setting_gender/setting_gender.dart';
import 'package:letter_bird_project/ui/screens/settings/setting_language/SettingPickLanguage.dart';
import 'package:letter_bird_project/ui/screens/settings/support/support_my_ticket_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/target_gender/target_matching_gender_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isLatterAccepted = false;

  bool isGiftAccepted  = false;
  bool isNativeLanguageMatch  = false;
  bool isCountryMatch  = false;
  bool keepMeInMatch  = false;
  bool isPushNotificationOn  = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,

          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                CustomAppBar(
                  iconColor: light_black,
                  textColor: light_black,
                    appBarTitle: "Settings"),

                SizedBox(height: 318.h,),

                Text("Account Information", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp),),

                SizedBox(height: 37.h,),

                titleWidget(field: "User ID",
                    valueWidget: Text("OYT9364D", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),

                SizedBox(height: 20.h,),

                titleWidget(field: "Daily letter send limit:",
                  valueWidget: Text("3", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),

                SizedBox(height: 20.h,),

                titleWidget(field: "Annoymous letter limit:",
                  valueWidget: Text("5", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),

                SizedBox(height: 20.h,),
                GestureDetector(
                  onTap: (){
                    Utils.push(AccountTypePremiumScreen(), context);
                  },
                child: titleWidget(field: "Account Type",
                  valueWidget: Text("Free >", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),),

                SizedBox(height: 20.h,),

                GestureDetector(
                  onTap: (){
                    Utils.push(BuyCoinScreen(), context);
                  },
                child :titleWidget(field: "Coins: ",
                  valueWidget: Text("493 >", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),),

                SizedBox(height: 20.h,),

                GestureDetector(
                  onTap: (){
                    Utils.push(MailConfirmationScreen(), context);
                  },
                  child :titleWidget(field: "mail@mail.com",
                  valueWidget: Text("Unverified >", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),),

                SizedBox(height: 20.h,),

                titleWidget(field: "Name & Surname",
                  valueWidget: Text("Niloy kumar", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),

                SizedBox(height: 20.h,),

                titleWidget(field: "Phone number",
                  valueWidget: Text("+0123456789", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),

                SizedBox(height: 20.h,),

                titleWidget(field: "View profile",
                  valueWidget: Text(">", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),

                SizedBox(height: 80.h,),

                CustomDivider(width: double.infinity,),


                ///
                /// =---------   User Information -------
                ///
                Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 37),
                  child:  Text("User information", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp),

                ),),

                GestureDetector(
                  onTap: (){
                    Utils.push(Biography(), context);
                  },
                  child: titleWidget(field: "Biography & Interests",
                    valueWidget: Text(">", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),
                ),

                SizedBox(height: 20.h,),

                GestureDetector(
                  onTap: (){
                    Utils.push(SettingAvatar(), context);
                  },
                  child: titleWidget(field: "Avatar",
                    valueWidget: Text(">", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),
                ),

                SizedBox(height: 20.h,),

                GestureDetector(
                  onTap: (){
                    Utils.push(SettingBirthdate(), context);
                  },
                  child: titleWidget(field: "Birthdate",
                    valueWidget: Text("21. 11. 89 >", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),
                ),

                SizedBox(height: 20.h,),

                GestureDetector(
                  onTap: (){
                    Utils.push(SettingGender(), context);
                  },
                  child: titleWidget(field: "Gender",
                    valueWidget: Text("Male >", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),
                ),

                SizedBox(height: 20.h,),


                GestureDetector(
                  onTap: (){
                    String nativeLanguageText="Turki";
                    List<PickLanguageModel> langaugeList=[];
                    langaugeList.add(PickLanguageModel("English", 3));
                    langaugeList.add(PickLanguageModel("Polish", 1));


                    Utils.push(SettingPickLanguage(nativeLanguageText, langaugeList), context);
                  },
                  child: titleWidget(field: "Languages",
                    valueWidget: Text(">", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),
                ),

                SizedBox(height: 40.h,),


                ///
                /// Accept Tile
                ///
                _acceptnessTile(title: "Accept annonymous letters",
                    onChange: (bool val){
                  setState(() {
                    isLatterAccepted = val;
                  });
                    },
                    isSelected: isLatterAccepted,
                    description: "With this options other users may send you annoymous letters. share the link below and receive annoymous letters. These letters can not be repiled."),

                SizedBox(height: 15.h,),

                CustomDivider(width: double.infinity,),

                Padding(
                  padding: EdgeInsets.only(top: 17, bottom: 27),
                  child: IconRoundedButton(
                      onTap: (){

                        Get.bottomSheet(LinkCopyBottomSheet());
                      },
                      iconPath: IconsPath.white_share_icon, text: "letterbird.me/6793TR",
                    textColor: Colors.white,buttonColor: light_red_color,),
                ),


                CustomDivider(width: double.infinity,),


                ///
                /// =---------   Address information  -------
                ///
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 37),
                  child:  Text("Address information", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp),

                  ),),

                titleWidget(field: "Address",
                  valueWidget: Text("Turkey >", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),

                SizedBox(height: 42.h,),

                titleWidget(field: "Detailed Address",
                  valueWidget: Text(">", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),

                SizedBox(height: 22.h,),

                ///
                /// Gift Accept Tile
                ///
                _acceptnessTile(title: "Accept real letters & Gifts",
                    onChange: (bool val) async{
                      setState(() {
                        isGiftAccepted = val;
                      });
                      if(isGiftAccepted){
                       bool isStillActive = await  Get.bottomSheet(AcceptRealLatterAndGiftSheet());
                       setState(() {
                         isGiftAccepted = isStillActive;
                       });
                      }
                    },
                    isSelected: isGiftAccepted,
                    description: "With this options other users may send you real letters and gifts throuhg our store, your address information will not be shared with the sender. You will receive a letter when you are about to receive a gift. ",
                ),
                SizedBox(height: 15.h,),

                CustomDivider(width: double.infinity,),

                Padding(
                  padding: EdgeInsets.only(top: 17, bottom: 27),
                  child: IconRoundedButton(
                    onTap: (){},
                    iconPath: IconsPath.white_store_icon, text: "Visit s tore",
                    textColor: Colors.white,buttonColor: light_red_color,),
                ),


                CustomDivider(width: double.infinity,),

                ///
                /// =---------    Match settings  -------
                ///
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 37),
                  child:  Text("Match settings", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp),
                  ),),


                GestureDetector(
                  onTap: (){
                    Utils.push(AgeRangeScreen(), context);
                  },
                  child: titleWidget(field: "Age Range",
                    valueWidget: Text("13 - 65+ >", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),
                ),

                SizedBox(height: 42.h,),

                GestureDetector(
                  onTap: (){
                    Utils.push(TargetMatchingGenderScreen(), context);
                  },
                  child:titleWidget(field: "Matching Gender",
                  valueWidget: Text("Multislection >", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),),

                SizedBox(height: 42.h,),

                titleWidget(field: "Keep me in match",
                valueWidget: CupertinoSwitch(
                    value: keepMeInMatch,
                    onChanged: (val)async{
                      setState(() {
                      keepMeInMatch = val;
                    });

                  if(keepMeInMatch){
                  bool isStillActive = await  Get.bottomSheet(KeepMeInMatchBottomSheet());
                  setState(() {
                    keepMeInMatch = isStillActive;
                  });

                    }},
                ),
                ),
                SizedBox(height: 40.h,),

                titleWidget(field: "Keep my native in match",
                  valueWidget: CupertinoSwitch(
                      value: isNativeLanguageMatch,
                      onChanged: (val) async{
                        setState(() {
                    isNativeLanguageMatch = val;
                  });
                    if(isNativeLanguageMatch){
                    bool isStillActive = await  Get.bottomSheet(KeepMyMatchInNativeBottomSheet());
                    setState(() {
                      isNativeLanguageMatch = isStillActive;
                    });}
                      }
                      ),
                ),
                SizedBox(height: 40.h,),

                titleWidget(field: "Keep my country in match",
                  valueWidget: CupertinoSwitch(
                      value: isCountryMatch,
                      onChanged: (val) async{
                        setState(() {
                        isCountryMatch = val;
                           });
                        if(isCountryMatch){
                          bool isStillActive = await  Get.bottomSheet(KeepMyCountryInMatchBottomSheet());
                          setState(() {
                            isCountryMatch = isStillActive;
                          });}
                      }
                  ),
                ),
                SizedBox(height: 40.h,),

                GestureDetector(
                  onTap: (){
                    Utils.push(BlockUserScreen() , context);
                  },
                  child:titleWidget(field: "Blocked users",
                  valueWidget: Text(">", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),),
                SizedBox(height: 15.h,),

                CustomDivider(width: double.infinity,),
                ///
                /// button
                ///
                Padding(
                  padding: EdgeInsets.only(top: 17, bottom: 27),
                  child: IconRoundedButton(
                    onTap: (){
                      Utils.push(SupportsMyTicketScreen() , context);
                    },
                    iconPath: IconsPath.white_contact_support_icon,
                    text: "Contact support",
                    buttonColor: light_red_color,
                    textColor: Colors.white,
                  ),
                ),

                CustomDivider(width: double.infinity,),

                ///
                /// =---------   User permissions -------
                ///
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 37),
                  child:  Text("User permissions", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp),

                  ),),


                titleWidget(field: "Push notification",
                  valueWidget: CupertinoSwitch(
                      value: isPushNotificationOn, onChanged: (val){setState(() {
                    isPushNotificationOn = val;
                  });}),
                ),
                SizedBox(height: 37.h,),

                CustomDivider(width: double.infinity,),

                ///
                /// =---------   App information -------
                ///
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 37),
                  child:  Text("App information", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp),

                  ),),


                titleWidget(field: "Version",
                  valueWidget: Text("1. 083", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),

                SizedBox(height: 22.h,),

                GestureDetector(
                  onTap: (){
                    Utils.push(AppLanguageScreen(), context);
                  },
                  child:titleWidget(field: "App language",
                  valueWidget: Text("Türkçe >", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),),

                SizedBox(height: 22.h,),

            GestureDetector(
              onTap: (){
                Utils.push(FaqsScreen(), context);
              },
              child:titleWidget(field: "FAQ",
                  valueWidget: Text(">", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),),

                SizedBox(height: 22.h,),

                GestureDetector(
                  onTap: (){
                    Utils.push(SettingUserAgreementScreen(), context);
                  },
                  child:titleWidget(field: "User aggrement",
                  valueWidget: Text(">", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),),

                SizedBox(height: 22.h,),

                GestureDetector(
                  onTap: (){
                    Utils.push(SettingPrivacyPolicyScreen(), context);
                  },
                  child:titleWidget(field: "Privacy policy",
                  valueWidget: Text(">", style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp, color: light_red_color),),),),

                SizedBox(height: 50.h,),







              ],
            ),
          ),
        ),
    );
  }

  ///
  ///
  Widget titleWidget({required String field, required Widget valueWidget}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(field, style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 18.sp),),

        valueWidget,

      ],
    );
  }

  Widget _acceptnessTile({required String title,bool isSelected = false, required var onChange, required String description}){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(title,style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 18.sp),)),
              SizedBox(width: 20.w,),
              CupertinoSwitch(value: isSelected, onChanged: onChange),
            ],
          ),
          SizedBox(height: 13.h,),
          Text("$description",style: kufamTextStyle.copyWith(fontSize: 14.sp),),
        ],
      ),
    );
  }
}

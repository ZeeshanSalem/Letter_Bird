import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_divider.dart';
import 'package:letter_bird_project/ui/custom_widgets/dialogs/share_my_id_dialog.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/ui/screens/drawer_menu/match_user/match_user_screen.dart';
import 'package:letter_bird_project/ui/screens/drawer_menu/matching/match_setting.dart';
import 'package:letter_bird_project/ui/screens/drawer_menu/write/write_screen/write_screen.dart';
import 'package:letter_bird_project/ui/screens/login/after_login_first_letter/first_letter.dart';
import 'package:letter_bird_project/ui/screens/menu_post/drafts/drafts_letter.dart';
import 'package:letter_bird_project/ui/screens/menu_post/favorite/favorite_letter.dart';
import 'package:letter_bird_project/ui/screens/menu_post/postBox/post_letter.dart';
import 'package:letter_bird_project/ui/screens/menu_post/sent/sent_letter.dart';
import 'package:letter_bird_project/ui/screens/menu_post/unread/unread_letter.dart';
import 'package:letter_bird_project/ui/screens/settings/setting_screen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 250.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(49.r)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Column(
                  children: [
                    ///
                    /// Custom App Bar
                    ///
                    CustomAppBar(appBarTitle: "Menu"),
                    //appBarWidget(context,title: "Menu",showBackButton: true),
                    SizedBox(
                      height: 97.h,
                    ),

                    ///
                    /// Profile Container
                    ///
                    Container(
                      height: 200.h,
                      width: double.infinity.w,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Column(
                        children: [
                          /// First Row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageContainer(
                                height: 90.h,
                                width: 90.w,
                                assets: ImagesPath.profile_image,
                                radius: 0.r,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Niloy kumar",
                                    style: kufamTextStyle.copyWith(
                                      color: textColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),

                                  /// User Id
                                  _profileNamingTile(titleText: "Id: 4802DUT"),
                                  CustomDivider(),

                                  /// phone Number
                                  _profileNamingTile(
                                      titleText: "+234 9011039271"),
                                  CustomDivider(),

                                  ///  Email
                                  _profileNamingTile(
                                      titleText: "aminiloy@gmail.com"),
                                ],
                              ),
                            ],
                          ),

                          Spacer(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Account type: Free",
                                style: kufamTextStyle.copyWith(
                                  color: dark_red_color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "Coins: 500",
                                style: kufamTextStyle.copyWith(
                                  color: dark_red_color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 17.h,
                    ),

                    ///
                    /// 2nd Tile
                    ///
                    _whiteContainer(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Utils.push(MatchSettings(), context);
                            },
                            child: _fieldTile(
                              imagePath: IconsPath.swap_icon,
                              tileValue: "Match",
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Utils.push(WriteScreen(), context);
                            },
                            child: _fieldTile(
                              imagePath: IconsPath.edit_icon,
                              tileValue: "Write",
                              thirdWidget: Text(
                                "Remaining limit: 02",
                                style: kufamTextStyle.copyWith(
                                    fontSize: 14.sp,
                                    color: light_black.withOpacity(0.5)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 17.h,
                    ),

                    ///
                    /// 3rd Tile
                    ///
                    _whiteContainer(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("unread press");
                              Utils.push(UnreadLetter(), context);
                            },
                            child: _fieldTile(
                              imagePath: IconsPath.red_message_icon,
                              tileValue: "Unread",
                              thirdWidget: Text(
                                "34",
                                style: kufamTextStyle.copyWith(
                                    fontSize: 14.sp,
                                    color: light_black.withOpacity(0.5)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Utils.push(PostLetter(), context);
                            },
                            child: _fieldTile(
                              imagePath: IconsPath.folder_icon,
                              tileValue: "Post box",
                              thirdWidget: Text(
                                "24",
                                style: kufamTextStyle.copyWith(
                                    fontSize: 14.sp,
                                    color: light_black.withOpacity(0.5)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Utils.push(DraftsLetter(), context);
                            },
                            child: _fieldTile(
                              imagePath: IconsPath.draft_icon,
                              tileValue: "Drafts",
                              thirdWidget: Text(
                                "24",
                                style: kufamTextStyle.copyWith(
                                    fontSize: 14.sp,
                                    color: light_black.withOpacity(0.5)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Utils.push(FavoriteLetter(), context);
                            },
                            child: _fieldTile(
                              imagePath: IconsPath.heart_icon,
                              tileValue: "Favourites",
                              thirdWidget: Text(
                                "24",
                                style: kufamTextStyle.copyWith(
                                    fontSize: 14.sp,
                                    color: light_black.withOpacity(0.5)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Utils.push(SentLetter(), context);
                            },
                            child: _fieldTile(
                              imagePath: IconsPath.send_icon,
                              tileValue: "Send",
                              thirdWidget: Text(
                                "24",
                                style: kufamTextStyle.copyWith(
                                    fontSize: 14.sp,
                                    color: light_black.withOpacity(0.5)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 17.h,
                    ),

                    ///
                    /// 4th Tile
                    ///
                    _whiteContainer(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Utils.push(SettingScreen(), context);
                            },
                            child: _fieldTile(
                              imagePath: IconsPath.setting_icon,
                              tileValue: "Setting",
                              thirdWidget: Icon(
                                Icons.arrow_forward_ios,
                                size: 20.h,
                                color: light_black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: (){
                              Utils.push(SettingScreen(), context);
                            },
                            child: _fieldTile(
                              imagePath: IconsPath.bag_icon,
                              tileValue: "Buy Coins",
                              thirdWidget: Icon(
                                Icons.arrow_forward_ios,
                                size: 20.h,
                                color: light_black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: (){
                              Utils.push(SettingScreen(), context);
                            },
                            child: _fieldTile(
                              imagePath: IconsPath.star_icon,
                              tileValue: "Premium",
                              thirdWidget: Icon(
                                Icons.arrow_forward_ios,
                                size: 20.h,
                                color: light_black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 17.h,
                    ),

                    ///
                    /// 5th Tile
                    ///
                    _whiteContainer(
                      child: _fieldTile(
                        imagePath: IconsPath.logout_icon,
                        tileValue: "Sign out",
                      ),
                    ),

                    SizedBox(
                      height: 49.h,
                    ),

                    CustomDivider(
                      width: 98.w,
                    ),

                    SizedBox(
                      height: 39.h,
                    ),

                    RoundedButton(
                        press: () {},
                        text: "Buy us a coffee :)",
                        color: dark_red_color,
                        textColor: Colors.white,
                        width: 314.w),

                    SizedBox(
                      height: 14.h,
                    ),

                    _button(
                      onTAP: () {},
                      text: "Share my id: 4802DUT",
                      iconPath: IconsPath.share_icon,
                    ),

                    SizedBox(
                      height: 14.h,
                    ),

                    _button(
                      onTAP: () {
                        Get.dialog(ShareMyIdDialog());},
                      text: "letterbird.me/6793TR",
                      iconPath: IconsPath.link_icon,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// This is used in Profile Tile as feild
  ///
  Widget _profileNamingTile({String? titleText}) {
    return Text(
      "${titleText!}",
      style: kufamTextStyle.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: light_black.withOpacity(0.5)),
    );
  }

  ///
  /// This box is general White Box user in screen
  ///
  Widget _whiteContainer({@required Widget? child}) {
    return Container(
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: child!,
    );
  }

  ///
  /// General Row contain value and used in general white Container
  ///
  Widget _fieldTile(
      {@required String? imagePath,
      @required String? tileValue,
      Widget? thirdWidget}) {
    return Row(
      children: [
        ImageContainer(
          width: 20.w,
          height: 20.h,
          radius: 0.r,
          assets: imagePath!,
        ),
        SizedBox(
          width: 14.w,
        ),
        Text(
          "${tileValue!}",
          style: kufamTextStyle.copyWith(
            fontSize: 14.sp,
            color: light_black,
          ),
        ),
        Spacer(),
        thirdWidget == null ? Container() : thirdWidget,
      ],
    );
  }

  Widget _button({onTAP, String? text, String? iconPath}) {
    return Container(
      width: 314.w,
      height: 60.h,
      margin: EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(1.0),
          primary: Colors.white,
          // textStyle: const TextStyle(fontSize: textSize),
        ),
        onPressed: onTAP,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageContainer(
              height: 24.h,
              width: 24.w,
              assets: iconPath!,
              radius: 0.r,
            ),
            SizedBox(
              width: 22.w,
            ),
            Text(
              text!,
              style: TextStyle(
                  color: light_black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}

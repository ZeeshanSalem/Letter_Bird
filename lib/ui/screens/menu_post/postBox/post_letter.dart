import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/ui/screens/drawer_menu/menu/menu_screen.dart';
import 'package:letter_bird_project/ui/screens/login/after_login_first_letter/first_letter_view_model.dart';
import 'package:letter_bird_project/ui/screens/login/after_login_first_letter/read_letter/read_letter.dart';
import 'package:letter_bird_project/ui/screens/menu_post/postBox/post_letter_view_model.dart';
import 'package:letter_bird_project/ui/screens/menu_post/unread/unread_letter_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

class PostLetter extends StatelessWidget {
  const PostLetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => PostLetterViewModel(),
    //   child: Consumer<PostLetterViewModel>(
    //     builder: (context, model, child) => ,
    //   ),
    // );

    return ChangeNotifierProvider(
      create: (context) => PostLetterViewModel(),
      child: Consumer<PostLetterViewModel>(
          builder: (context, model, child) => SafeArea(
                  child: Scaffold(
                backgroundColor: bgScreenColor,
                body: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      // child: CustomAppBar(appBarTitle: "Unread",textColor: textColor,),
                      child: appBarWidget(context,
                          title: "Postbox",
                          backImage: IconsPath.menu_icon,
                          rightIcon: IconsPath.sort_icon, backPress: () {
                        Utils.pushAndRemoveUntil(MenuScreen(), context);
                      }),
                    ),
                    model.state == ViewState.loading
                        ? Center(
                            child: Platform.isAndroid
                                ? CircularProgressIndicator()
                                : CupertinoActivityIndicator(),
                          )
                        : Expanded(
                            child: model.postLetterList.length == 0
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 45, right: 45, top: 30),
                                        child: textView(
                                            text:
                                                "Your post box is empty, wait for your letter friend to reply your letter or write a new letter to another letterbird user.",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            textColor: textColor,
                                            textAlign: TextAlign.start),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 55, right: 55, top: 50),
                                        child: RoundedButton(
                                          text: "Match",
                                          width: double.infinity,
                                          color: blue,
                                          textColor: whiteColor,
                                        ),
                                      )
                                    ],
                                  )
                                : ListView.builder(
                                    padding: const EdgeInsets.all(8),
                                    itemCount: model.postLetterList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return _buildListItem(
                                          model.postLetterList[index]);
                                      // return Container(
                                      //   // height: 50,
                                      //   // color: Colors.amber[colorCodes[index]],
                                      //   // child: Center(child: Text('Entry ${entries[index]}')),
                                      // );
                                    }),
                          ),
                  ],
                ),
              ))),
    );
  }

  Widget _buildListItem(PostLetterModel item) {
    return Container(
      margin: EdgeInsets.only(left: 25.sp, right: 25.sp, top: 10.sp),
      width: double.infinity.w,
      height: 236.sp,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 6.0,
        ),
        child: Stack(
          children: [
            Image.asset(
              item.backgroundImage,
              fit: BoxFit.fill,
            ),
            Container(
              margin: EdgeInsets.only(left: 5, top: 15, right: 25, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textView(
                          textAlign: TextAlign.start,
                          text:
                              "From : ${item.fromNumber} \n ${"" + item.fromName}",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: textColor),
                      Image.asset(item.iconImage),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                          visible: item.isRandom ? true : false,
                          child: Image.asset(IconsPath.random_black_icon)),
                      SizedBox(
                        width: 5,
                      ),
                      Visibility(
                          visible: item.isSend ? true : false,
                          child: Image.asset(IconsPath.send_black_icon)),
                      SizedBox(
                        width: 5,
                      ),
                      Visibility(
                          visible: item.isFavorite ? true : false,
                          child: Image.asset(IconsPath.favorite_black_icon)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

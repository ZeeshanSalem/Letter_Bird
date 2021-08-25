import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/ui/screens/drawer_menu/menu/menu_screen.dart';
import 'package:letter_bird_project/ui/screens/login/after_login_first_letter/first_letter_view_model.dart';
import 'package:letter_bird_project/ui/screens/login/after_login_first_letter/read_letter/read_letter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstLetter extends StatelessWidget {
  const FirstLetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FirstLetterViewModel(),
      child: Consumer<FirstLetterViewModel>(
        builder: (context, model, child) => SafeArea(
            child: Scaffold(
          backgroundColor: bgScreenColor,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                // child: CustomAppBar(appBarTitle: "Unread",textColor: textColor,),
                child: appBarWidget(context,
                    title: "Unread", backImage: IconsPath.menu_icon,backPress: (){
                      Utils.push(MenuScreen(), context);
                    }),
              ),
              GestureDetector(
                onTap: (){
                  Utils.push(ReadLetter(), context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 25.sp,right: 25.sp),
                  width: double.infinity.w,
                  height: 236.sp,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                          // blurRadius: 2.0,
                          ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0,),
                    child: Stack(
                      children: [
                        Image.asset(ImagesPath.first_letter),
                        Container(
                          margin: EdgeInsets.only(left: 5,top: 15,right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              textView(text: "From : Letter Bird", fontSize: 18, fontWeight: FontWeight.w500, textColor: textColor),
                              Image.asset(ImagesPath.sparrow_img),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        )),
      ),
    );
  }
}

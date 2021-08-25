import 'dart:io';
import 'dart:ui';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/core/validators.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/screens/login/login4_avatar/login4_avatar_view_model.dart';
import 'package:letter_bird_project/ui/screens/login/login5_interest/login5.dart';
import 'package:provider/provider.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class LoginScreen4 extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen4> {
  List<SliderModel> slides = [];
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => Login4AvatarViewModel(),
      child: Consumer<Login4AvatarViewModel>(
        builder:(context, model, child)=> SafeArea(
          child: Scaffold(
            // backgroundColor: themeColor,
            body: model.state == ViewState.loading
                ? Center(
              child: Platform.isAndroid
                  ? CircularProgressIndicator()
                  : CupertinoActivityIndicator(),
            ):

            Stack(
              children: [
                Container(
                    // height: size.height,
                    // width: size.width,
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 7,
                          child: PageView.builder(
                              onPageChanged: (value) {
                                setState(() {
                                  currentIndex = value;
                                });
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: slides.length,
                              itemBuilder: (context, index) {
//                                return Slider(model: slides);
                                return Container(
                                  margin: EdgeInsets.only(left: 50.h, right: 50.h),
                                  child: GridView.builder(
                                      itemCount: model.listOfAvatars.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 80,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 1,
                                          crossAxisCount: 3,
                                          childAspectRatio: 0.1),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: (){
                                              print("Avatar click");
                                              Fluttertoast.showToast(
                                                  msg: "Avatar is selected but due to API implementation images are pending.",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0
                                              );
                                            },
                                            child: FadeInImage(
                                              placeholder: AssetImage(ImagesPath.avatar1),
                                              image: AssetImage(ImagesPath.avatar1),
//                                              image: NetworkImage(model.listOfAvatars[index].avatar.toString()),
                                            ),);
                                      }),
                                );
                              }),
                        ),
                      ],
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(IconsPath.sign_in_logo,
                              semanticsLabel: 'Failed to load'),
                          SizedBox(
                            height: 15.h,
                          ),
                          textView(
                              text: "Avatar",
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                              textColor: textColor),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 32, right: 32),
                            child: textView(
                                text:
                                    "Choose an avatar that represents you and your mood.",
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                textColor: textColor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              slides.length,
                              (index) => buildDot(index, context),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              bottom: 20,
                            ),
                            child: RoundedButton(
                              text: 'Next',
                              color: blue,
                              textColor: whiteColor,
                              width: size.width,
                              press: () {
                                //Move to sign up page
                                Utils.push(LoginScreen5(), context);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                    height: 8.h,
                                    color: Colors.red,
                                  )),
                              Expanded(
                                  flex: 6,
                                  child: Container(
                                    height: 8.h,
                                    color: lightest_grey,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 1),
        child: currentIndex == index
            ? Container(
                // width: currentIndex == index ? 14 : 14,
                // height: currentIndex == index ? 25 : 25,

                width: 12,
                height: 12,
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
              )
            : Container(
                height: 12,
                width: 12,
                decoration:
                    BoxDecoration(color: lightest_grey, shape: BoxShape.circle),
              ));
  }
}

class Slider extends StatelessWidget {
  final List<SliderModel> model;

  const Slider({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height: size.height,
      // width: double.infinity,
      child: Container(
          // margin: EdgeInsets.only(top: size.height / 1.7, left: 45, right: 45),
          // child: SvgPicture.asset(model.imagePath,
          //     semanticsLabel: 'Failed to load'),

          child: Container(
        margin: EdgeInsets.only(left: 50.h, right: 50.h),
        child: GridView.builder(
            itemCount: model.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 80,
                mainAxisSpacing: 10,
                crossAxisSpacing: 1,
                crossAxisCount: 3,
                childAspectRatio: 0.1),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: (){
                    print("Avatar click");
                    Fluttertoast.showToast(
                        msg: "Avatar is selected but due to API implementation images are pending.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                  child: Image.asset(model[index].imagePath));
            }),
      )),
    );
  }
}

//Slider List
List<SliderModel> getSlides() {
  List<SliderModel> slides1 = [];

  slides1.add(SliderModel(ImagesPath.avatar1, ''));
  slides1.add(SliderModel(ImagesPath.avatar2, ''));
  slides1.add(SliderModel(ImagesPath.avatar3, ''));

  slides1.add(SliderModel(ImagesPath.avatar4, ''));
  slides1.add(SliderModel(ImagesPath.avatar5, ''));
  slides1.add(SliderModel(ImagesPath.avatar6, ''));

  slides1.add(SliderModel(ImagesPath.avatar7, ''));
  slides1.add(SliderModel(ImagesPath.avatar8, ''));
  slides1.add(SliderModel(ImagesPath.avatar9, ''));

  List<List<SliderModel>> list = [];
  list.add(slides1);

  return slides1;
}

//Slider Model Class
class SliderModel {
  String imagePath, bgColor;

  SliderModel(this.imagePath, this.bgColor);
}

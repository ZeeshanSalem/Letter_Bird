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
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/core/validators.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/screens/login/login5_interest/login5.dart';
import 'package:letter_bird_project/ui/screens/settings/setting_avatar/setting_avatar_popup.dart';
import 'package:letter_bird_project/ui/screens/settings/setting_avatar/setting_avatar_view_model.dart';
import 'package:provider/provider.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class SettingAvatar extends StatefulWidget {
  @override
  _ScreenAvatarState createState() => _ScreenAvatarState();
}

class _ScreenAvatarState extends State<SettingAvatar> {
  List<List<SliderModel>> slidesList=[];
  List<SliderModel> slides = [];
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
    //slides = getSlides();
    slidesList = getSlides();
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
      create: (context)=> SettingAvatarViewModel(),
      child: Consumer<SettingAvatarViewModel>(
        builder:(context, model, child)=> SafeArea(
          child: Scaffold(
            // backgroundColor: themeColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //1 Toolbar
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 40.w),
                    // child: CustomAppBar(appBarTitle: "Unread",textColor: textColor,),
                    child: appBarWidget(context,
                        title: "Avatar", backImage: IconsPath.back_icon),
                  ),


                  Image.asset(ImagesPath.setting_avatar,),


                  Container(
                    margin: EdgeInsets.only(left: 32.w, right: 32.w,top: 32.h),
                    child: textView(
                      textAlign: TextAlign.start,
                        text:
                        "Choose an avatar that represents you and your mood. Other members will see your avatar.",
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        textColor: textColor),
                  ),


                  Container(
                    margin: EdgeInsets.only(left: 32.w, right: 32.w,top: 50.h,bottom: 25.h),
                    child: textView(
                        text:
                        "Your Coins: 450",
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        textColor: textColor),
                  ),

                  Container(
                    height: 300.h,
                    child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            currentIndex = value;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: slidesList.length,
                        itemBuilder: (context, index) {
//                      return Slider(model: slidesList[index]);
                          return GridView.builder(
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
                              });
                        }),
                  ),


                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      slidesList.length,
                          (index) => buildDot(index, context),
                    ),
                  ),


                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 50,
                      right: 50,
                      bottom: 20,
                    ),
                    child: RoundedButton(
                      text: 'Save',
                      color: blue,
                      textColor: whiteColor,
                      width: size.width,
                      press: () {
                        //Move to sign up page
                        Utils.push(SettingAvatarPopup(), context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                ],
              ),
            )
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


class AvatarSlider extends StatefulWidget {
  final List<SliderModel> model;
  const AvatarSlider({Key? key, required this.model}) : super(key: key);

  @override
  _AvatarSliderState createState() => _AvatarSliderState();
}

class _AvatarSliderState extends State<AvatarSlider> {
  Color borderColor=lightest_grey;
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
                itemCount: widget.model.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 80,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 5.2,
                    crossAxisCount: 3,
                    childAspectRatio: 1.9),
                itemBuilder: (context, index) {
                  return Container(
                    height: 290.h,
                    width: 180.h,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: (){
                              print("Avatar click");

                              setState(() {
                                borderColor=Colors.red;
                              });
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
                            // child: Image.asset(model[index].imagePath)
                            child: Container(
                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        width: 1,
                                        color: borderColor,
                                        style: BorderStyle.solid)),
                                child: Image.asset(widget.model[index].imagePath)
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: textView(
                              text: "Free",
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              textColor: textColor),
                        ),

                      ],
                    ),
                  );
                }),
          )),
    );
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
                mainAxisSpacing: 15,
                crossAxisSpacing: 5.2,
                crossAxisCount: 3,
                childAspectRatio: 1.9),
            itemBuilder: (context, index) {
              return Container(
                height: 290.h,
                width: 180.h,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
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
                          // child: Image.asset(model[index].imagePath)
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 1,
                                  color: lightest_grey,
                                  style: BorderStyle.solid)),
                          child: Image.asset(model[index].imagePath)
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: textView(
                          text: "Free",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          textColor: textColor),
                    ),

                  ],
                ),
              );
            }),
      )),
    );
  }
}

//Slider List
List<List<SliderModel>> getSlides() {

  //first list
  List<SliderModel> slides1 = [];

  slides1.add(SliderModel(ImagesPath.avatar1, ''));
  slides1.add(SliderModel(ImagesPath.avatar2, ''));
  slides1.add(SliderModel(ImagesPath.avatar3, ''));

  // slides1.add(SliderModel(ImagesPath.avatar4, ''));
  // slides1.add(SliderModel(ImagesPath.avatar5, ''));
  // slides1.add(SliderModel(ImagesPath.avatar6, ''));

  slides1.add(SliderModel(ImagesPath.avatar7, ''));
  slides1.add(SliderModel(ImagesPath.avatar8, ''));
  slides1.add(SliderModel(ImagesPath.avatar9, ''));


  //second list
  List<SliderModel> slides2 = [];

  slides2.add(SliderModel(ImagesPath.avatar3, ''));
  slides2.add(SliderModel(ImagesPath.avatar2, ''));
  slides2.add(SliderModel(ImagesPath.avatar1, ''));

  slides2.add(SliderModel(ImagesPath.avatar6, ''));
  slides2.add(SliderModel(ImagesPath.avatar5, ''));
  slides2.add(SliderModel(ImagesPath.avatar4, ''));

  slides2.add(SliderModel(ImagesPath.avatar9, ''));
  slides2.add(SliderModel(ImagesPath.avatar8, ''));
  slides2.add(SliderModel(ImagesPath.avatar7, ''));




  List<List<SliderModel>> list = [];

  list.add(slides1);
  list.add(slides2);

  // return slides1;
  return list;
}

//Slider Model Class
class SliderModel {
  String imagePath, bgColor;

  SliderModel(this.imagePath, this.bgColor);
}

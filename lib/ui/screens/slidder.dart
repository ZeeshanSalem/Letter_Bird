import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/screens/login/login1_form/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  String buttonText = 'Next';
  List<SliderModel> slides = [];
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0,keepPage: true);
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
    return Scaffold(
        backgroundColor: themeColor,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Container(
              child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: slides.length,
                  itemBuilder: (context, index) {
                    return Slider(
                      model: slides[currentIndex],
                      currentIndex: currentIndex,
                      controller: controller,
                    );
                  }),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
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
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            left: 50.h,
                            right: 50.h,
                            bottom: 10.h,
                          ),
                          child: (currentIndex == slides.length - 1)
                              ? RoundedButton(
                                  text: 'Sign Up',
                                  color: blue,
                                  textColor: whiteColor,
                                  width: size.width,
                                  press: () {
                                    //Move to sign up page
                                    Utils.push(LoginFormScreen(), context);
                                  },
                                )
                              : RoundedButton(
                                  text: 'Next',
                                  color: blue,
                                  textColor: whiteColor,
                                  width: size.width,
                                  press: () {
                                    setState(() {
                                      if (currentIndex < slides.length - 1) {
                                        currentIndex++;
                                        print("current index :$currentIndex");
                                        //controller.jumpToPage(currentIndex);
                                        //controller.animateToPage(++currentIndex, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);

                                      }
                                    });
                                  },
                                )),
                      (currentIndex == slides.length - 1)
                          ? Column(
                              children: [
                                Text(
                                  "By signing up you are agree to our ",
                                  style:
                                      TextStyle(color: textColor, fontSize: 16),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'User Agreement',
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' & ',
                                          style: TextStyle(
                                              color: textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal)),
                                      TextSpan(
                                          text: 'Privacy Policy.',
                                          style: TextStyle(
                                              color: textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 20,
                            ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }

  // container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: currentIndex == index
            ? Image.asset(
                IconsPath.dot_icon,
                color: currentIndex == index ? blue : grey,
                width: currentIndex == index ? 18 : 14,
                height: currentIndex == index ? 28 : 25,
              )
            : Image.asset(
                IconsPath.circular_dot_icon,
                color: currentIndex == index ? blue : grey,
                width: currentIndex == index ? 18 : 14,
                height: currentIndex == index ? 28 : 25,
              ));
  }
}

class Slider extends StatelessWidget {
  final SliderModel model;
  final int currentIndex;
  final PageController controller;

  const Slider(
      {Key? key,
      required this.model,
      required this.currentIndex,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Container(
         //margin: EdgeInsets.only(top: size.height / 1.7, left: 45, right: 45),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Image.asset("assets/images/onboard1.png")
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Image.asset(model.imagePath),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                         EdgeInsets.only(top: 63.h, left: 63.h, right: 63.0.h),
                    child: textView(
                        text: model.title,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        textColor: textColor),
                    // child: Text(
                    //   model.title,
                    //   style: TextStyle(color: light_black, fontSize: 22),
                    // ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(top: 20.0.h, left: 28.h, right: 28.h),
                      child: textView(
                          text: model.description,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textColor: textColor)
                      // child: Text(
                      //   model.description,
                      //   style: TextStyle(color: light_black),
                      // ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Slider List
List<SliderModel> getSlides() {
  List<SliderModel> slides = [];

  slides.add(SliderModel(
      ImagesPath.onboard1,
      'Your mailbox is always with you. ',
      'Vestibulum pulvinar dictumst at nisi, sit nisl. Purus, pulvinar neque felis duis id adipiscing. Massa.'));

  slides.add(SliderModel(ImagesPath.onboard2, 'Enjoy staying anonymous. ',
      'Receive anonymous letters from your friends, loved ones or followers on social media accounts.'));

  slides.add(SliderModel(ImagesPath.onboard3, 'Receive anonymous letters. ',
      'Receive anonymous letters from your friends, loved ones or followers on social media accounts.'));

  slides.add(SliderModel(
      ImagesPath.onboard4,
      'Send real letters to your chosen ones.',
      'Send real letters, postcards and gifts to your loved ones.'));

  return slides;
}

//Slider Model Class
class SliderModel {
  String imagePath, title, description;

  SliderModel(this.imagePath, this.title, this.description);
}

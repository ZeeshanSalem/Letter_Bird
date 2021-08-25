import 'dart:ui';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/models/gender.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/core/validators.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_radio_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/ui/screens/login/login3_gender/login_gender_models.dart';
import 'package:letter_bird_project/ui/screens/login/login3_gender/login_gender_view_model.dart';
import 'package:provider/provider.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import 'setting_gender_view_model.dart';

class SettingGender extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SettingGender> {
  //int _stackIndex = 0;

  //String _singleValue = "Text alignment right";
  String _verticalGroupValue = "Male";

  List<String> _status = ["Male", "Female", "Other", "Anonymous"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
        create: (context) => SettingGenderViewModel(),
        child: Consumer<SettingGenderViewModel>(
            builder: (context, model, child) => SafeArea(
                    child: Scaffold(
                  body: model.state == ViewState.loading
                      ? Center(
                          child: Platform.isAndroid
                              ? CircularProgressIndicator()
                              : CupertinoActivityIndicator(),
                        )
                      : Container(
                          color: whiteColor,
                          child: Column(
                            children: [
                              Expanded(
                                  child: SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.all(25),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 40.w),
                                        // child: CustomAppBar(appBarTitle: "Unread",textColor: textColor,),
                                        child: appBarWidget(context,
                                            title: "Gender",
                                            backImage: IconsPath.back_icon, backPress: (){Navigator.pop(context);}),
                                      ),

                                      SizedBox(
                                        height: 10.h,
                                      ),

                                      Text("Please select your gender. Your gender information is displayed on your profile page and can be viewed by other members. We use this data for better match results.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            color: textColor,
                                          height: 1.5,
                                        ),),


//                                      RadioGroup<Gender>.builder(
//                                        groupValue: model.verticalGroupValue,
//                                        onChanged: (value) {
//                                          model.onChanged(value);
//                                        },
//                                        items: model.allGender,
//                                        itemBuilder: (item) => RadioButtonBuilder(
//                                          item,
//                                        ),
//                                        activeColor: Colors.orange,
//                                        spacebetween: 50,
//                                      ),
                                      ListView.separated(

                                          shrinkWrap: true,
                                          padding: EdgeInsets.symmetric(vertical: 45, horizontal: 40),
                                          physics: NeverScrollableScrollPhysics(),
                                          separatorBuilder: (context,index) => Padding(
                                            padding:  EdgeInsets.symmetric(vertical: 10),
                                            child: Divider(),
                                          ),
                                          itemBuilder: (context, index)=> InkWell(
                                            onTap: (){
                                              model.onGenderSelection(index);
                                            },
                                            child: Row(
                                              children: [
                                                CustomRadioCircle(isSelected: model.allGender[index].isSelected!),

                                                SizedBox(width: 16.w,),
                                                Text("${model.allGender[index].name}", style: kufamTextStyle.copyWith(
                                                  color: light_black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.sp,
                                                ),)
                                              ],
                                            ),
                                          ),
                                          itemCount: model.allGender.length),

                                      // RadioGroup<String>.builder(
                                      //   groupValue: model.genderValue!,
                                      //   // onChanged: (value) => setState(() {
                                      //   //   model.genderValue = value!;
                                      //   //
                                      //   //   print("on radio button clicked :$model._verticalGroupValue");
                                      //   // }),
                                      //
                                      //   onChanged: (value) {
                                      //     // model.genderValue=value!;
                                      //     model.onGenderChanged(value!);
                                      //   },
                                      //   items: model.genderStringList,
                                      //   itemBuilder: (item) =>
                                      //       RadioButtonBuilder(
                                      //     item,
                                      //   ),
                                      //   activeColor: Colors.orange,
                                      //   spacebetween: 50,
                                      // ),
                                    ],
                                  ),
                                ),
                              )),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 50.w, right: 50.w),
                                    child: RoundedButton(
                                      text: "Done",
                                      color: blue,
                                      textColor: whiteColor,
                                      width: size.width,
                                      press: () {
                                        //Utils.push(LoginScreen4(), context);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                            height: 5,
                                            color: Colors.red,
                                          )),
                                      Expanded(
                                          flex: 7,
                                          child: Container(
                                            height: 5,
                                            color: lightest_grey,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                ))));
  }
}

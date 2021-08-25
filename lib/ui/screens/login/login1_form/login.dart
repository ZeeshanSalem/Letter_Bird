import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/core/validators.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/screens/login/login1_form/login_form_view_model.dart';
import 'package:letter_bird_project/ui/screens/login/login2.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final formKey = new GlobalKey<FormState>();

  var email, name, surName;
  var isNameValid, isSurNameValid, isEmailValid, isAllValid;
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();

    _passwordVisible = false;
    isNameValid = false;
    isSurNameValid = false;
    isEmailValid = false;
    isAllValid = false;
    // email="";
    // password="";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget body = Loader(
      child: Container(
        color: whiteColor,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(25),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          // Image.asset(
                          //   IconsPath.sign_in_logo,
                          //   width: 100.w,
                          //   height: 100.h,
                          // ),

                          SvgPicture.asset(IconsPath.sign_in_logo,
                              semanticsLabel: 'Failed to load'),

                          SizedBox(
                            height: 15.h,
                          ),
                          textView(
                              text: "User Information",
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                              textColor: textColor),
                          SizedBox(
                            height: 10.h,
                          ),
                          textView(
                              text:
                                  "Please fill your name, surname and email adress. These informations will be confidential and will not be shared with other users.",
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              textColor: textColor),
                          // textViewHeading("User Information"),
                          // textViewSubHeading("Please fill your name, surname and email adress. These informations will be confidential and will not be shared with other users."),

                          SizedBox(height: 140.h),

                          textField(
                            label: "Name",
                            onSaved: (input) => name = input,
                            hintText: "",
                            validator: (val) {
                              isNameValid =
                                  Validators.validateName(val!);
                            },
                            onComplete: () {
                              print("name edition complete");
                              if (isNameValid &&
                                  isSurNameValid &&
                                  isEmailValid) {
                                setState(() {
                                  isAllValid = true;
                                });
                              } else {
                                setState(() {
                                  isAllValid = false;
                                });
                              }
                            },
                            prefix: Icons.person_outline_rounded,
                            textInputAction: TextInputAction.next,
                          ),
                          textField(
                            label: "Surname",
                            onSaved: (input) => surName = input,
                            hintText: "",
                            validator: (val) {
                              isSurNameValid =
                                  Validators.validateName(val!,);
                            },
                            onComplete: () {
                              print("surname edition complete");
                              if (isNameValid &&
                                  isSurNameValid &&
                                  isEmailValid) {
                                setState(() {
                                  isAllValid = true;
                                });
                              } else {
                                setState(() {
                                  isAllValid = false;
                                });
                              }
                            },
                            prefix: Icons.person_outline_rounded,
                            textInputAction: TextInputAction.next,
                          ),

                          textField(
                            label: "Email",
                            onSaved: (input) {
                              email = input;
                            },
                            validator: (val) {
                              isEmailValid =
                                  Validators.validateEmail(val!, context);
                            },
                            onComplete: () {
                              print("email edition complete");
                              print("name :$isNameValid");
                              print("sur name :$isSurNameValid");
                              print("email :$isEmailValid");

                              if (isNameValid &&
                                  isSurNameValid &&
                                  isEmailValid) {
                                setState(() {
                                  isAllValid = true;
                                });
                              } else {
                                setState(() {
                                  isAllValid = false;
                                });
                              }
                            },
                            hintText: "",
                            prefix: Icons.email_outlined,
                          ),
                        ],
                      ),
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 50.w, right: 50.w),
                      child: RoundedButton(
                        text: "Next",
                        // color: isAllValid ? blue : lightest_grey,
                        color: blue,
                        textColor: textColor,
                        width: size.width,
                        press: () {
                          Utils.push(LoginScreen2(), context);
                        },
                      ),
                    ),
                    // textButton(
                    //     child: Text(
                    //       "Create account",
                    //       style: TextStyle(color: textColor),
                    //     ),
                    //     // onPressed: () => Utils.push(Signup(), context)
                    //
                    //     onPressed: (){}
                    // )

                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 5,
                              color: Colors.red,
                            )),
                        Expanded(
                            flex: 9,
                            child: Container(
                              height: 5,
                              color: lightest_grey,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: body,
      ),
    );
  }

//   void login() async {
//     setState(() {
// //      isLoading = true;
//     });
//
//     var data = {
//       "email": "$email",
//       "password": "$password",
//     };
//
//     try {
//       Response response = await dio.post(ApiConfig.login, data: data);
//       print(response.statusCode.toString() + "Status Code");
//       print(response.data.toString() + "data Code");
//       logger.i(response.data);
//       if (response.statusCode == 200) {
//         var user = User.fromJson(response.data);
//         String authToken = response.headers['x-auth'].toString(); //it shows "[]" special symbol in the string
//         await AppPref().setAuthToken(authToken.substring(1, authToken.length - 1)); //remove symbol and save
//         await AppPref().saveUser(user);
//         await AppPref().setLoggedIn(true);
//         appUser = user as User;
//         Utils.pushAndRemoveUntil(CompleteProfile(), context);
//       }
//     } on DioError catch (e) {
//       if (e.response.statusCode == 401) {
//         if(e.response.data != null) {
//           logger.e(e.response.data['message']);
//
//           Fluttertoast.showToast(msg: e.response.data['message']);
//         } else{
//           Fluttertoast.showToast(msg: "Error");
//         }
//       } else {
//         logger.e(e.message);
//       }
//     }
//
//     setState(() {
// //      isLoading = false;
//     });
//   }
}

class LoginFormScreen extends StatelessWidget {
  const LoginFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginFormViewModel(),
      child: Consumer<LoginFormViewModel>(
        builder: (context,model,child) => SafeArea(child: Scaffold(
          body: Column(
            children: [
              Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(25.h),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          // Image.asset(
                          //   IconsPath.sign_in_logo,
                          //   width: 100.w,
                          //   height: 100.h,
                          // ),

                          SvgPicture.asset(IconsPath.sign_in_logo,
                              semanticsLabel: 'Failed to load'),

                          SizedBox(
                            height: 15.h,
                          ),
                          textView(
                              text: "User Information",
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                              textColor: textColor),
                          SizedBox(
                            height: 10.h,
                          ),
                          textView(
                              text:
                              "Please fill your name, surname and email adress. These informations will be confidential and will not be shared with other users.",
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              textColor: textColor),
                          // textViewHeading("User Information"),
                          // textViewSubHeading("Please fill your name, surname and email adress. These informations will be confidential and will not be shared with other users."),

                          SizedBox(height: 140.h),

                          textField(
                            label: "Name",
                            onChanged: model.onNameChange,
                            onSaved: (input) {
                              // name = input
                              model.onNameChange(input!);
                              //Fluttertoast.showToast(msg: "Name cannot contain numeric value or special char", toastLength: Toast.LENGTH_SHORT, fontSize: 16,textColor: Colors.black,backgroundColor: lightest_grey);
                            },
                            hintText: "",
                            controller: model.nameController,
                            prefix: Icons.person_outline_rounded,
                            textInputAction: TextInputAction.next,

                          ),



                          textField(
                            label: "Surname",
                            onChanged: model.onSurNameChange,
                            onSaved: (input) {
                              model.onSurNameChange(input!);
                            },
                            hintText: "",
                            controller: model.surNameController,
                            prefix: Icons.person_outline_rounded,
                            textInputAction: TextInputAction.next,
                          ),


                          textField(
                            label: "Email",
                            onChanged: model.onEmailChange,
                            onSaved: (input) {
                              model.onEmailChange(input!);
                            },
                            hintText: "",
                            controller: model.emailController,
                            prefix: Icons.person_outline_rounded,
                            textInputAction: TextInputAction.next,
                          ),

                          // textField(
                          //   label: "Surname",
                          //   onSaved: (input) => surName = input,
                          //   hintText: "",
                          //   validator: (val) {
                          //     isSurNameValid =
                          //         Validators.validateName(val!, context);
                          //   },
                          //   onComplete: () {
                          //     print("surname edition complete");
                          //     if (isNameValid &&
                          //         isSurNameValid &&
                          //         isEmailValid) {
                          //       setState(() {
                          //         isAllValid = true;
                          //       });
                          //     } else {
                          //       setState(() {
                          //         isAllValid = false;
                          //       });
                          //     }
                          //   },
                          //   prefix: Icons.person_outline_rounded,
                          //   textInputAction: TextInputAction.next,
                          // ),

                          // textField(
                          //   label: "Email",
                          //   onSaved: (input) {
                          //     email = input;
                          //   },
                          //   validator: (val) {
                          //     isEmailValid =
                          //         Validators.validateEmail(val!, context);
                          //   },
                          //   onComplete: () {
                          //     print("email edition complete");
                          //     print("name :$isNameValid");
                          //     print("sur name :$isSurNameValid");
                          //     print("email :$isEmailValid");
                          //
                          //     if (isNameValid &&
                          //         isSurNameValid &&
                          //         isEmailValid) {
                          //       setState(() {
                          //         isAllValid = true;
                          //       });
                          //     } else {
                          //       setState(() {
                          //         isAllValid = false;
                          //       });
                          //     }
                          //   },
                          //   hintText: "",
                          //   prefix: Icons.email_outlined,
                          // ),


                        ],
                      ),
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 50.w, right: 50.w),
                      child: RoundedButton(
                        text: "Next",
                        color: model.isAllValid ? blue : lightest_grey,
                        // color: blue,
                        textColor: textColor,
                        width: double.infinity,
                        press: () {
                          if (model.isAllValid) {
                            Utils.push(LoginScreen2(), context);
                          }

                        },
                      ),
                    ),
                    // textButton(
                    //     child: Text(
                    //       "Create account",
                    //       style: TextStyle(color: textColor),
                    //     ),
                    //     // onPressed: () => Utils.push(Signup(), context)
                    //
                    //     onPressed: (){}
                    // )

                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 5,
                              color: Colors.red,
                            )),
                        Expanded(
                            flex: 9,
                            child: Container(
                              height: 5,
                              color: lightest_grey,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/graph_ql_configs/qrapgh_ql_provider.dart';
import 'package:letter_bird_project/ui/screens/drawer_menu/menu/menu_screen.dart';
import 'package:letter_bird_project/ui/screens/login/login1_form/login.dart';
import 'package:letter_bird_project/ui/screens/settings/age_range/age_range_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/setting_avatar/setting_avatar_popup.dart';
import 'package:letter_bird_project/ui/screens/settings/setting_screen.dart';
import 'package:logger/logger.dart';

import 'dart:io';
import 'dart:convert';

Logger logger = Logger();
Dio dio = Dio();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: bgScreenColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: bgScreenColor,
        systemNavigationBarIconBrightness: Brightness.dark
    ));

    // return MaterialApp(
    //   theme: ThemeData(
    //    ),
    //   home: LoginScreen(),
    //   // home: MyHomePage(title: 'Flutter Demo Home Page'),
    // );


    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () => GraphQLProvider(
        client: GraphQlClass().client,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
            scaffoldBackgroundColor: bgScreenColor,
            primaryColor: themeColor,
            accentColor: themeColor,
            primaryColorDark: bgScreenColor,
          ),

          // home: LanguageLevel(languageName: "languageName", nativeText: "Native"),

          home: LoginScreen(),

        ),
      ),
    );
  }
}



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}



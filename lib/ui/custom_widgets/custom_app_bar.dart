import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/screens/drawer_menu/menu/menu_screen.dart';

class CustomAppBar extends StatelessWidget {
  final Color? iconColor;
  final Color? textColor;
  final String? appBarTitle;
  CustomAppBar({this.iconColor = Colors.white, this.textColor = Colors.white,@required this.appBarTitle});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            child: Icon(Icons.arrow_back_ios, size: 20.sp, color: iconColor,), onTap: (){
              print("Hell");
              Utils.pop(context);
        }),

        Text("${appBarTitle!}", style: TextStyle(
          fontSize: 18.sp,
          color: textColor,
          fontWeight: FontWeight.w700,
        ),),

        SizedBox(width: 20.w,),
      ],
    );
  }
}

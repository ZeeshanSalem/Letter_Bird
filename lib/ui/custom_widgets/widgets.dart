import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';

import '../../core/text_styles.dart';

Widget textButton({required VoidCallback onPressed, required Widget child}) {
  return Platform.isAndroid
      ? TextButton(
          onPressed: onPressed,
          child: child,
          // style: ElevatedButton.styleFrom(primary: enable ? color : disableClr // background
          //     // onPrimary: Colors.white, // foreground
          //     ),
        )
      : CupertinoButton(
          // padding: EdgeInsets.all(0),

          onPressed: onPressed,
          child: child,
        );
}

Widget elevatedButton(
    {Function()? onPressed,
    var color = themeColor,
    bool enable = true,
    required Widget child}) {
  return Platform.isAndroid
      ? ElevatedButton(
          onPressed: onPressed,
          child: child,
          style: ElevatedButton.styleFrom(primary: color // background
              // onPrimary: Colors.white, // foreground
              ),
        )
      : CupertinoButton(
          color: color,
          onPressed: onPressed,
          child: child,
        );
}

Widget textField(
    {Function? onPressed,
    var color = themeColor,
    bool enable = true,
    var keyboardType,
    var textInputAction = TextInputAction.next,
    var controller,
      var onChanged,
    var hintText,
    final FormFieldSetter<String>? onSaved,
    final FormFieldValidator<String>? validator,
    var label,
    var suffix,
    bool obscureText = false,
    var prefix,
    var prefixWidget,
    VoidCallback? onComplete}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        children: [
          // Icon(prefix, color: iconClr),
          SizedBox(
            width: 1,
          ),
          Text(
            "$label",
            style: TextStyle(color: textColor),
          ),
        ],
      ),
      Row(
        children: [
          Visibility(
            visible: prefixWidget != null ? true : false,
            child: Padding(
              padding: EdgeInsets.only(right: 10.h),
              child: prefixWidget != null ? prefixWidget : Container(),
            ),
          ),
          Expanded(
            child: TextFormField(

              onSaved: onSaved,
              validator: validator,
              obscureText: obscureText,
              enabled: enable,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              controller: controller,
              onEditingComplete: onComplete,
              onChanged: onChanged,
              decoration: InputDecoration(
                // border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(color: textColor),
                suffixIcon: suffix,
                // prefix: prefixWidget
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 30.h,
      ),
    ],
  );
}

Widget appBarWidget(context,
    {bool showBackButton = true,
    String? title,
    String? rightIcon,
    String? backImage,
    VoidCallback? backPress
    }) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 30.h,
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: backPress,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Visibility(
              visible: showBackButton,
              child: Image.asset(backImage! , height: 20.sp, width: 20.sp,),
            ),
            // child: Visibility(
            //   visible: showBackButton,
            //   child: Container(
            //     width: 40.w,
            //     height: 40.w,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(10),
            //       boxShadow: [
            //         BoxShadow(
            //             // blurRadius: 2.0,
            //             ),
            //       ],
            //     ),
            //     child: IconButton(
            //       onPressed: () => Navigator.pop(context),
            //       icon: Icon(
            //         Icons.arrow_back,
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: Text(
              "${title ?? ''}",
              style: TextStyle(
                fontSize: 18.sp,
                color: textColor,
                fontWeight: FontWeight.w700,),
            )),
        Align(
          alignment: Alignment.centerRight,
          child: Visibility(
            visible: rightIcon == null ? false : true,
            child: Image.asset(rightIcon==null ? "" : rightIcon , height: 20.sp, width: 20.sp,),
          ),
        ),
      ],
    ),
  );
}

Widget searchField(context,
    {required double height, var hintText, controller, onChanged}) {
  return Container(
    height: height,
    padding: EdgeInsets.symmetric(horizontal: 10),
    // decoration: BoxDecoration(
    //   color: Colors.white,
    //   borderRadius: BorderRadius.circular(10),
    //   boxShadow: [
    //     BoxShadow(
    //         // blurRadius: 2.0,
    //         ),
    //   ],
    // ),

    decoration: BoxDecoration(
      color: lightest_grey,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Image.asset(
          IconsPath.search_icon,
          width: 24,
          height: 24,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            autofocus: false,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "$hintText",
            ),
          ),
        ),
      ],
    ),
  );
}

Text textView(
    {required String text,
    required double fontSize,
    required FontWeight fontWeight,
    required Color textColor,
      double wordSpacing=1,
    TextAlign? textAlign = TextAlign.center}) {
  return Text(
    text,
    textAlign: textAlign,
    style: titleTextStyle.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: textColor,
      letterSpacing: 1,
      wordSpacing: wordSpacing,
      // fontSize: 14.sp,
      // fontWeight: FontWeight.w400,
      // color: textColor,
    ),
  );
}

Text textViewHeading(String text) {
  return Text(
    text,
    style: titleTextStyle.copyWith(),
  );
}

Text textViewSubHeading(String text) {
  return Text(
    text,
    style: subtitleTextStyle.copyWith(),
  );
}

Row buildAppBar(
    {required BuildContext context,
    required String title,
    required bool isBack,
    required bool isAdd,
    VoidCallback? press}) {
  return Row(
    children: [
      Visibility(
          visible: isBack,
          child: buildOutlineButton(icon: Icons.arrow_back, press: press)),
      Expanded(
          child: Center(
        child: Text(
          title,
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: textColor),
        ),
      )),
      Visibility(
          visible: isAdd,
          child: buildOutlineButton(icon: Icons.add, press: () {}))
    ],
  );
}

Widget buildOutlineButton({IconData? icon, VoidCallback? press}) {
  return SizedBox(
    width: 40,
    height: 40,
    // ignore: deprecated_member_use
    child: OutlineButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      onPressed: press,
      child: Icon(icon),
    ),
  );
}

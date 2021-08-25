import 'package:flutter/cupertino.dart';

class BoxBackground extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Color bgColor;

  const BoxBackground({Key? key, required this.child, required this.width, required this.height, required this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  Size size = MediaQuery.of(context).size;
    return Container(
        height: height,
        width: width,
        // color: bgColor,
        child: Container(
          margin: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: bgColor),

          // decoration: BoxDecoration(
          //   color: themeClr,
          //   borderRadius: BorderRadius.circular(10),
          //   //border: Border.all(color: textClr.withOpacity(0.3)),
          // ),

          child: child,
        ),

    );
  }
}
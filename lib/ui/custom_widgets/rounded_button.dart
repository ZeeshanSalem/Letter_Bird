import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final String text;

  // final Function press;
  final VoidCallback? press;
  final Color color, textColor;
  final double textSize;
  final double width;

  const RoundedButton({
    Key? key,
    required this.text,
    this.press,
    required this.color,
    required this.textColor,
    this.textSize = 14, required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return Container(
      width:width,
      height: 70.h,
      margin: EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(1.0),
          primary: Colors.white,
          // textStyle: const TextStyle(fontSize: textSize),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 17.sp),
        ),




      ),
    );


    // return Container(
    //   color: color,
    //   margin: EdgeInsets.symmetric(vertical: 10),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   width: size.width,
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(15),
    //     child:  TextButton(
    //       style: TextButton.styleFrom(
    //         padding: const EdgeInsets.all(16.0),
    //         primary: Colors.white,
    //         // textStyle: const TextStyle(fontSize: textSize),
    //       ),
    //       onPressed: press,
    //       child: Text(
    //         text!,
    //         style: TextStyle(color: textColor),
    //       ),
    //     ),
    //   ),
    // );

    //for gradient button
    // return Container(
    //   margin: EdgeInsets.symmetric(vertical: 10),
    //   width: size.width*0.8,
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(15),
    //     child: Stack(
    //       children: <Widget>[
    //         Positioned.fill(
    //           child: Container(
    //             decoration: const BoxDecoration(
    //                 color: Orange
    //               // gradient: LinearGradient(
    //               //   colors: <Color>[
    //               //     Color(0xFF0D47A1),
    //               //     Color(0xFF1976D2),
    //               //     Color(0xFF42A5F5),
    //               //   ],
    //               // ),
    //             ),
    //           ),
    //         ),
    //         TextButton(
    //           style: TextButton.styleFrom(
    //             padding: const EdgeInsets.all(16.0),
    //             primary: Colors.white,
    //             textStyle: const TextStyle(fontSize: 20),
    //           ),
    //           onPressed: () {},
    //           child: const Text('Gradient'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );


  }
}



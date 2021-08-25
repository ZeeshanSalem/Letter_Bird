import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/constants/colors.dart';

class CustomRadioCircle extends StatelessWidget {
  final bool isSelected;
  CustomRadioCircle({required this.isSelected}){
    print(isSelected);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border:Border.all(color: isSelected ? dark_red_color : backgroundColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 7,
        width: 7,
        decoration: BoxDecoration(
          color: isSelected ? dark_red_color : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

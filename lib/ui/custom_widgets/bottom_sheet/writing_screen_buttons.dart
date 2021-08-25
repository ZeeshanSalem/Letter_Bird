import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';

class WritingScreenButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 250.w,
      decoration: BoxDecoration(
        color: light_red_color,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          _iconButton(iconPath: IconsPath.white_send_icon),
          _iconButton(iconPath: IconsPath.white_tick_icon),
          _iconButton(iconPath: IconsPath.white_delete_icon),
        ],
      ),
    );
  }

  Widget _iconButton({required String iconPath, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
            child: ImageContainer(
              height: 20.h,
              width: 20.w,
              assets: iconPath,
              radius: 0.r,
            ),
          ),
    );
  }
}

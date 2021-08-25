import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';

import '../rounded_button.dart';

class MatchingGenderBottomSheet extends StatefulWidget {
  @override
  _MatchingGenderBottomSheetState createState() => _MatchingGenderBottomSheetState();
}

class _MatchingGenderBottomSheetState extends State<MatchingGenderBottomSheet> {

  List<Gender> genders = [
    Gender(
      name: "Male",
      isSelected: false,
    ),
    Gender(
      name: "Female",
      isSelected: false,
    ),
    Gender(
      name: "other",
      isSelected: false,
    ),
    Gender(
      name: "Anonnymous",
      isSelected: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 652.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(vertical: 23, horizontal: 43),
      decoration: BoxDecoration(
        color: Colors.white,
      ),

      child: Column(
        children: [
          Text("Matching gender", style: kufamTextStyle.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),),
          Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 80),
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context,index) => Padding(
                    padding:  EdgeInsets.symmetric(vertical: 10),
                    child: Divider(),
                  ),
                  itemBuilder: (context, index)=> InkWell(
                    onTap: (){
                      setState(() {
                        genders[index].isSelected =! genders[index].isSelected!;
                      });
                    },
                    child: Row(
                      children: [
                       _customRadioButton(isSelected: genders[index].isSelected!),

                       SizedBox(width: 16.w,),
                       Text("${genders[index].name}", style: kufamTextStyle.copyWith(
                         color: light_black,
                         fontWeight: FontWeight.w500,
                         fontSize: 18.sp,
                       ),)
                      ],
                    ),
                  ),
                  itemCount: genders.length)),


          RoundedButton(
            width: double.infinity.w,
            textColor: Colors.white,
            text: "Done",
            color: blue,
            press: (){},
          ),


        ],
      ),
    );
  }

  Widget _customRadioButton({required bool isSelected}){
    return Container(
      height: 15,
      width: 15,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border:Border.all(color: isSelected ? dark_red_color : backgroundColor),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        height: 7,
        width: 7,
        decoration: BoxDecoration(
          color: isSelected ? dark_red_color : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

}

class Gender{
  String? name;
  bool? isSelected;
  Gender({this.name, this.isSelected = false});
}

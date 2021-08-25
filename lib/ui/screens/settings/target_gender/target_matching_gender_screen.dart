import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/graph_ql_configs/query_mutation.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/screens/settings/target_gender/target_gender_view_model.dart';
import 'package:provider/provider.dart';

class TargetMatchingGenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TargetMatchingGenderViewModel(),
      child: Consumer<TargetMatchingGenderViewModel>(
        builder: (context, model, child) => SafeArea(
            child:
            Scaffold(
              body:
              model.state == ViewState.busy ? Center(
                child: Platform.isAndroid
                    ? CircularProgressIndicator()
                    : CupertinoActivityIndicator(),
              )
                  :
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///
                    /// Appbar of Screen
                    ///
                    CustomAppBar(
                        iconColor: light_black,
                        textColor: light_black,
                        appBarTitle: "Matching gender"),

                    SizedBox(height: 40.h,),

                    Text("For a wider range of results and pen pals, you can choose all fields or choose the gender that suits you best. More than one selection can be made.",
                      style: kufamTextStyle.copyWith(fontSize: 14.sp),
                    ),



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
                                model.onGenderSelection(index);
                              },
                              child: Row(
                                children: [
                                  _customRadioButton(isSelected: model.allGender[index].isSelected!),

                                  SizedBox(width: 16.w,),
                                  Text("${model.allGender[index].name}", style: kufamTextStyle.copyWith(
                                    color: light_black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                  ),)
                                ],
                              ),
                            ),
                            itemCount: model.allGender.length)),


                    RoundedButton(
                      width: double.infinity.w,
                      textColor: Colors.white,
                      text: "Done",
                      color: blue,
                      press: (){},
                    ),
                  ],
                ),
              ),
            ),
        ),
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

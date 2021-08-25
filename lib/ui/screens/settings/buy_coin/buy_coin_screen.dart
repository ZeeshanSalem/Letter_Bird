import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/screens/settings/buy_coin/buy_coin_view_model.dart';
import 'package:provider/provider.dart';

class BuyCoinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> BuyCoinViewModel(),
      child: Consumer<BuyCoinViewModel>(
        builder: (context, model, child) =>
         SafeArea(
            child: Scaffold(
              backgroundColor: backgroundColor,
              body: SingleChildScrollView(
                padding:  EdgeInsets.fromLTRB(50, 30, 50, 0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///
                      /// Appbar of Screen
                      ///
                      CustomAppBar(
                          iconColor: light_black,
                          textColor: light_black,
                          appBarTitle: "Buy coins"),

                      SizedBox(height: 42.h,),

                      ImageContainer(
                        width: 108.w,
                        height: 108.h,
                        assets: ImagesPath.coin_vector,
                        radius: 0.r,
                      ),

                      SizedBox(height: 20.h,),

                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae nisl pretium consectetur in donec pulvinar quis. ",
                      style: kufamTextStyle.copyWith(
                        fontSize: 14.sp,
                        height: 1.5,
                      ),),

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: 40),
                        shrinkWrap: true,
                          itemCount: model.coins.length,

                          itemBuilder: (context, index)=> _coinTile(
                            onTap: (){
                              model.onCoinSelection(index);
                            },
                            haveBorder:  index != model.coins.length - 1 && !model.coins[index].isSelected! ? true : false,
                            iconPath: model.coins[index].isSelected! ? model.coins[index].selectedIcon! :  model.coins[index].unselectedIcon!,
                            isSelected: model.coins[index].isSelected!,
                            coins: model.coins[index].totalCoins!,
                            price: index == model.coins.length - 1 ?
                            Row(
                              children: [
                                Text("Watch Video", style: kufamTextStyle.copyWith(fontSize: 14.sp),),
                                SizedBox(width: 6.w,),
                                ImageContainer(width: 20.w,height: 15.w, assets: IconsPath.video_camera_icon, radius: 0.r,),
                              ],
                            ) : Text("${model.coins[index].totalPrice!}", style: kufamTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: model.coins[index].isSelected! ? light_red_color : light_black,
                              fontSize: 18.sp,
                            ),
                          ),),
                      ),


                      RoundedButton(
                          text: "Purchase",
                          color: unActive_button_silver_color,
                          textColor: light_black,
                          width: 314.w),

                      SizedBox(height: 18.h,),

                      RoundedButton(
                          text: "Become premium",
                          color: blue,
                          textColor: Colors.white,
                          width: 314.w),

                      SizedBox(height: 50.h,),

                    ],
                  ),
                ),
              ),
            ),),
      ),
    );
  }

  Widget _coinTile({bool isSelected = false, String? coins, Widget? price,required bool haveBorder,
  required String iconPath, required VoidCallback onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 20, bottom: 16, left: 18, right: 18),
        decoration: BoxDecoration(
          color: isSelected ? light_red_color.withOpacity(0.3) : Colors.transparent,
//        borderRadius: isSelected ? BorderRadius.circular(4.r) : BorderRadius.circular(0.r),

          border: isSelected ? Border.all(color: Colors.transparent) : Border(
            bottom: BorderSide(color: haveBorder? light_black.withOpacity(0.4) : Colors.transparent)
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            isSelected ? Padding(
                padding: EdgeInsets.only(left: 28.w),
            child: Text("Best Choice", style: kufamTextStyle.copyWith(
              color: light_red_color,
              fontSize: 14.sp,
              height: 1.5,
            ),),
            ) : Container(),
            Row(
              children: [
                ImageContainer(
                  width: 17.w,
                  height: 14.w,
                  assets: iconPath,
                  radius: 0.r,
                ),
                SizedBox(width: 11.w,),

               Text("${coins!}", style: kufamTextStyle.copyWith(
                 fontWeight: FontWeight.w500,
                 color: isSelected ? light_red_color : light_black,
                 fontSize: 18.sp,
               ),),

                Spacer(),

                price!,

              ],
            ),
          ],
        ),
      ),
    );
  }
}

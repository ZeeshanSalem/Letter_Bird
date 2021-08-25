import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/screens/settings/block_user/block_user_view_model.dart';
import 'package:provider/provider.dart';

class BlockUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BlockUserViewModel(),
      child: Consumer<BlockUserViewModel>(
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
//            backgroundColor: backgroundColor,
            body: Padding(
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
                      appBarTitle: "Blocked users"),

                  SizedBox(height: 40.h,),

                  Text("Members you have blocked are listed in this area. You cannot send or receive letters from members you have blocked. Swipe left to unblock and delete from list. When you block a member, we don't send them notifications, but if they try to send you a letter, they may find out that they were blocked.",
                    style: kufamTextStyle.copyWith(fontSize: 14.sp, height: 1.8),
                  ),

                  Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 50),
                          shrinkWrap: true,
                          itemCount: model.blockUsers.length,
                          itemBuilder: (context, index) =>
                              _blockUserTile(
                                  testClass: model.blockUsers[index],
                                  context: context,
                                onTap: (){
                                    model.unBlockUser(index);
                                }
                              )
                      ),),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _blockUserTile({BlockUserTestClass? testClass, context, VoidCallback? onTap}){
    return Container(
      width: MediaQuery.of(context).size.width + 30.w,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width + 30.w,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: light_black,
                  ),
                ),
              ),
              child: Row(
                children: [
                  ImageContainer(
                    width: 20.w,
                    height: 20.h,
                    assets: IconsPath.users_icon,
                    radius: 0.r,
                  ),

                  SizedBox(width: 20.w,),
                  Text("${testClass!.name}",style: kufamTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 18.sp),),

                  SizedBox(width: 20.w,),
                  Text("${testClass.nickName}",style: kufamTextStyle.copyWith( fontSize: 14.sp),),

                  Spacer(),


                ],
              ),
            ),

            Positioned(
              right: 0,
              child: InkWell(
                onTap: onTap!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: light_red_color,
                  ),
                  width: 71.w,height: 53.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageContainer(
                        width: 20.w,
                        height: 20.h,
                        assets: IconsPath.delete_icon,
                        radius: 0.r,
                      ),

                      SizedBox(width: 12.w,),
                    ],
                  ),
                ),
              )
              ,
            ),
          ],
        ),
      ),
    );
  }
}

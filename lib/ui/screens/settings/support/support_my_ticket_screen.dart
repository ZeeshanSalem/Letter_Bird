import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/text_styles.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/custom_widgets/custom_app_bar.dart';
import 'package:letter_bird_project/ui/custom_widgets/image_container.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/screens/settings/support/support_chat_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/support/support_close_chat_screen.dart';
import 'package:letter_bird_project/ui/screens/settings/support/support_open_ticket_screen.dart';

class SupportsMyTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                /// Appbar of Screen
                ///
                CustomAppBar(
                    iconColor: light_black,
                    textColor: light_black,
                    appBarTitle: "My Tickets"),

                SizedBox(height: 40.h,),


                Text("Open Tickets", style: titleTextStyle.copyWith(
                  fontSize: 17.sp,
                  color: Colors.black,
                ),),

                SizedBox(height: 20.h,),

                _ticketTile(
                  icon: IconsPath.active_ticken_icon,
                  ticketTime: "12:12pm; 21 july 2021",
                  ticketTitle: "This is ticket 01",
                  onTap: (){
                    Utils.push(SupportOpenChatScreen() , context);

                  }
                ),


                SizedBox(height: 20.h,),

                _ticketTile(
                  icon: IconsPath.active_ticken_icon,
                  ticketTime: "12:12pm; 21 july 2021",
                  ticketTitle: "This is ticket 01",
                    onTap: (){

                      Utils.push(SupportOpenChatScreen() , context);

                    }
                ),


                SizedBox(height: 40.h,),


                Text("CloseTickets", style: titleTextStyle.copyWith(
                  fontSize: 17.sp,
                  color: Colors.black,
                ),),

                SizedBox(height: 20.h,),


                _ticketTile(
                  icon: IconsPath.un_active_ticket_icon,
                  ticketTime: "12:12pm; 21 july 2021",
                  ticketTitle: "This is ticket 01",
                  onTap: (){
                    Utils.push(SupportCloseChatScreen() , context);

                  },
                ),


                Spacer(),

                RoundedButton(
                  width: double.infinity.w,
                  textColor: Colors.white,
                  text: "Open a new ticket",
                  color: red,
                  press: (){
                    Utils.push(SupportOpenTicketScreen() , context);

                  },
                ),





              ],
            ),
          ),

        ),
    );
  }

  Widget _ticketTile({String? icon,String? ticketTitle, String? ticketTime, VoidCallback? onTap }){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ImageContainer(
          height: 42.h,
          width: 42.w,
          assets: icon!,
          radius: 0.r,
        ),

        SizedBox(width: 9.w,),

        Column(
          children: [
            Text("${ticketTitle!}",style:titleTextStyle.copyWith(fontSize: 17.sp,color: Colors.black, height: 1.5),),
            Text("${ticketTime!}",style:subtitleTextStyle.copyWith(fontSize: 12.sp,),),
          ],
        ),

        Spacer(),

        InkWell(
            onTap:  onTap!,
            child: Text("View tickets", style:titleTextStyle.copyWith(fontSize: 15.sp,color: blue,),)),

      ],
    );
  }
}

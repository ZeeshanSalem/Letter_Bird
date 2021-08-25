import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';
import 'package:flutter/material.dart';

class MailConfirmationViewModel extends BaseViewModel{

  bool isValueFilled = false;
  TextEditingController controller = TextEditingController();
  String? email;


  onChange(String val){
    setState(ViewState.busy);

    email = val;

    if(val.isNotEmpty){
      isValueFilled = true;
    }else{
      isValueFilled = false;
    }


    setState(ViewState.idle);
  }

}
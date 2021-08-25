import 'package:flutter/material.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/other/base_view_model.dart';

class SignInWithEmailViewModel extends BaseViewModel{

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
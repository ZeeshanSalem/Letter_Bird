import 'package:flutter/material.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/other/base_view_model.dart';

class SignInWithNumberViewModel extends BaseViewModel{

  bool isValueFilled = false;

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();

  FocusNode f3 = FocusNode();

  FocusNode f4 = FocusNode();

  FocusNode f5 = FocusNode();

  FocusNode f6 = FocusNode();

  FocusNode f7 = FocusNode();

  FocusNode f8 = FocusNode();

  FocusNode f9 = FocusNode();

  FocusNode f10 = FocusNode();

  FocusNode f11 = FocusNode();
  FocusNode f12 = FocusNode();
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),


  ];
  onChange(BuildContext context, FocusNode focusNode){
    setState(ViewState.busy);
    FocusScope.of(context).requestFocus(focusNode);
    checkControllerValue();
    setState(ViewState.idle);
  }

  checkControllerValue(){
    setState(ViewState.busy);
    print("eh");
    final index = controllers.indexWhere((element) => element.text.isEmpty);
    print(index);
    if(index == -1){
      isValueFilled = true;
    }else{
      isValueFilled = false;
    }
    setState(ViewState.idle);
  }

}
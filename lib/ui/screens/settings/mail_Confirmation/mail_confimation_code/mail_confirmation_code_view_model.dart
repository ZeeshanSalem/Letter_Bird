import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';

class MailConfirmationCodeViewModel extends BaseViewModel{
  TextEditingController otpController = TextEditingController();
  bool isOtpFilled = false;

  onFilled(){
    setState(ViewState.busy);
    isOtpFilled = true;
    setState(ViewState.idle);
  }

  falseFilledBool(){
    setState(ViewState.busy);
    isOtpFilled = false;
    setState(ViewState.idle);
  }
}
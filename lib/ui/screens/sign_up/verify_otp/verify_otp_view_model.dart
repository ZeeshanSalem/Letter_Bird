import 'package:flutter/cupertino.dart';

import '../../../../core/enums/view_state.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/other/base_view_model.dart';

class VerifyOtpViewModel extends BaseViewModel{
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
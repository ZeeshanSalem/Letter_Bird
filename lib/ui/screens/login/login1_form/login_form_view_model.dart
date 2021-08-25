import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/validators.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/other/base_view_model.dart';

class LoginFormViewModel extends BaseViewModel {
  bool isValidName = false;
  TextEditingController nameController = TextEditingController();
  String? name;


  bool isValidSurName = false;
  TextEditingController surNameController = TextEditingController();
  String? surName;


  bool isValidEmail = false;
  TextEditingController emailController = TextEditingController();
  String? email;


  bool isAllValid=false;

  onNameChange(String val) {
    setState(ViewState.busy);

    name = val;
    isValidName = Validators.validateNameBool(val);

    if (isValidName && isValidSurName && isValidEmail) {
      isAllValid=true;
    }else{
      isAllValid=false;
    }

    setState(ViewState.idle);
  }

  onSurNameChange(String val) {
    setState(ViewState.busy);

    surName = val;
    isValidSurName = Validators.validateNameBool(val);

    if (isValidName && isValidSurName && isValidEmail) {
      isAllValid=true;
    }else{
      isAllValid=false;
    }

    setState(ViewState.idle);
  }

  onEmailChange(String val) {
    setState(ViewState.busy);

    email = val;
    isValidEmail = Validators.validateEmailBool(val);

    if (isValidName && isValidSurName && isValidEmail) {
      isAllValid=true;
    }else{
      isAllValid=false;
    }

    setState(ViewState.idle);
  }

}

import 'package:country_provider/country_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:letter_bird_project/core/assets/icons.dart';
import 'package:letter_bird_project/core/assets/images.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';
import 'package:letter_bird_project/core/services/api_config.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/screens/login/login3_gender/login_gender_models.dart';
import 'package:letter_bird_project/ui/screens/login/login6_country/login_country_models.dart';

import '../../../../main.dart';

class PostLetterViewModel extends BaseViewModel {
  List<PostLetterModel> postLetterList=[];

  PostLetterViewModel() {
    init();
  }

  init(){
    //getUnreadLetters();
  }

  getUnreadLetters() {
    setState(ViewState.loading);

    postLetterList.add(PostLetterModel("RT76GK", "Niloy", ImagesPath.sparrow_img, ImagesPath.first_letter,true,false,true));
    postLetterList.add(PostLetterModel("RTKHOT", "", ImagesPath.sparrow_img, ImagesPath.second_letter,false,true,true));

    postLetterList.add(PostLetterModel("RT76GK", "Niloy", ImagesPath.sparrow_img, ImagesPath.first_letter,true,true,true));
    postLetterList.add(PostLetterModel("RTKHOT", "", ImagesPath.sparrow_img, ImagesPath.second_letter,true,false,false));

    setState(ViewState.idle);

  }
}

class PostLetterModel {
  String fromNumber, fromName;
  String iconImage, backgroundImage;
  bool isFavorite,isSend,isRandom;

  PostLetterModel(
      this.fromNumber, this.fromName, this.iconImage, this.backgroundImage,this.isFavorite,this.isSend,this.isRandom);
}

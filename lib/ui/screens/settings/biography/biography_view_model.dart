import 'package:country_provider/country_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/graph_ql_configs/qrapgh_ql_provider.dart';
import 'package:letter_bird_project/core/models/interest.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';
import 'package:letter_bird_project/core/services/api_config.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/screens/login/login3_gender/login_gender_models.dart';
import 'package:letter_bird_project/ui/screens/login/login6_country/login_country_models.dart';

import '../../../../main.dart';

class BiographyViewModel extends BaseViewModel {
  // List<GenderDataModel> genderList = [];
  // List<String> genderStringList = [];
  // String genderValue = "";

  GraphQlClass graphQlClass = GraphQlClass();
  List<Interest> interest  = [];


  late List<List<InterestModel>> interestList;
  late List<InterestModel> _interests;

  BiographyViewModel() {
    init();
  }

  init() async {
    //isLoading = true;
    //getAllGenders();
    //isLoading = false;


    List<InterestModel> slider1;
    slider1 = <InterestModel>[
      InterestModel('Book'),
      InterestModel('Music'),
      InterestModel('Movies'),
      InterestModel('Going out'),
      InterestModel('Adventure'),
      InterestModel('Nature'),
      InterestModel('Dancing'),
      InterestModel('Art'),
      InterestModel('Writing'),
      InterestModel('Chill'),
      InterestModel('Innovation'),
      InterestModel('Science'),
      InterestModel('History'),
      InterestModel('Book'),
      InterestModel('Music'),
      InterestModel('Music3'),
      InterestModel('Music4'),
      InterestModel('Music5'),
    ];

    List<InterestModel> slider2;
    slider2 = <InterestModel>[
      InterestModel('Book2'),
      InterestModel('Music2'),
      InterestModel('Movies'),
      InterestModel('Going out'),
      InterestModel('Adventure'),
    ];

    interestList.add(slider1);
    interestList.add(slider2);

    _interests = interestList[0];



  }


  // onGenderChanged(String value) async {
  //   setState(ViewState.busy);
  //
  //  genderValue=value;
  //
  //   setState(ViewState.idle);
  //   // setState(() {});
  // }
  //
  //
  // Future<void> getAllGenders() async {
  //   setState(ViewState.loading);
  //
  //   try {
  //     dio.options.headers['content-Type'] = 'application/json';
  //
  //     Response response = await dio.get(ApiConfig.genders);
  //
  //     logger.i("Country API Implementation");
  //     logger.i("Status Code : ${response.statusCode}");
  //     logger.i("response :${response.data.toString()}");
  //     if (response.statusCode == 200) {
  //       logger.i("Status Code : ${response.statusCode}");
  //
  //       GenderModel genderModel = GenderModel.fromJson(response.data);
  //       logger.i("list size :${genderModel.data!.length}");
  //
  //       genderList = genderModel.data!;
  //
  //       //for radio group required string list
  //       for(var item in genderList){
  //         genderStringList.add(item!.displayName!);
  //       }
  //
  //       genderValue=genderStringList.first;
  //
  //     }
  //   } on DioError catch (e) {
  //     logger.e(e.response!.data['message']);
  //     Fluttertoast.showToast(msg: e.response!.data['message']);
  //   }
  //
  //   setState(ViewState.idle);
  // }
}


class InterestModel {
  const InterestModel(this.name);

  final String name;
}

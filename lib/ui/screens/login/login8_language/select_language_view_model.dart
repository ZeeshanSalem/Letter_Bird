import 'package:country_provider/country_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/graph_ql_configs/qrapgh_ql_provider.dart';
import 'package:letter_bird_project/core/graph_ql_configs/query_mutation.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';
import 'package:letter_bird_project/core/services/api_config.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/screens/login/login6_country/login_country_models.dart';
import 'package:letter_bird_project/ui/screens/login/login8_language/language_models.dart';

import '../../../../main.dart';

class SelectLanguageViewModel extends BaseViewModel {
  List<Language> languageList = [];
  List<Language> languageFilteredList = [];


  GraphQlClass graphQlClass = GraphQlClass();


  TextEditingController controller = new TextEditingController();

  SelectLanguageViewModel() {
    init();
  }

  init() async {
    // isLoading = true;
//    getLanguageList();
  getLanguage();
   // isLoading = false;

  }

  onSearchTextChanged(
    String queryString,
  ) async {
    setState(ViewState.busy);

    languageFilteredList.clear();
    if (queryString.isEmpty) {
      // setState(() {});
      return;
    }

    languageList.forEach((data) {
      if (data.name!.toLowerCase().contains(queryString.toLowerCase()) ||
          data.name!.toLowerCase().contains(queryString.toLowerCase())) {
        languageFilteredList.add(data);
      }
    });

    setState(ViewState.idle);
    // setState(() {});
  }

//  Future<void> getLanguageList() async {
//    setState(ViewState.loading);
//
//    try {
//      dio.options.headers['content-Type'] = 'application/json';
//
//      Response response = await dio.get(ApiConfig.languages);
//
//      logger.i("Country API Implementation");
//      logger.i("Status Code : ${response.statusCode}");
//      logger.i("response :${response.data.toString()}");
//      if (response.statusCode == 200) {
//        logger.i("Status Code : ${response.statusCode}");
//
//        LanguageModel languageModel = LanguageModel.fromJson(response.data);
//        logger.i("list size :${languageModel.data!.length}");
//
//        languageList=languageModel.data!;
//      }
//    } on DioError catch (e) {
//      logger.e(e.response!.data['message']);
//      Fluttertoast.showToast(msg: e.response!.data['message']);
//    }
//
//    setState(ViewState.idle);
//  }


  void getLanguage() async{
    setState(ViewState.loading);
    try {
      GraphQLClient graphQLClient = graphQlClass.clientToQuery();
      QueryResult result = await graphQLClient.query(
          QueryOptions(document: gql(QueryAndMutation().language)));
      if(result.data != null){

        for(int  i = 0; i < result.data!["Languages"].length; i++ ){
          print(result.data!["Languages"][i]);
          languageList.add(Language.fromJson(result.data!["Languages"][i]));
        }
      }
    } catch(e,s){
      print("Exception $e");
      print(s);
    }
    setState(ViewState.idle);
  }

}

class MyCountry {
  String? choice;
  int index;

  MyCountry(this.choice, this.index);
}

import 'package:country_provider/country_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/graph_ql_configs/qrapgh_ql_provider.dart';
import 'package:letter_bird_project/core/graph_ql_configs/query_mutation.dart';
import 'package:letter_bird_project/core/models/gender.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';
import 'package:letter_bird_project/core/services/api_config.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/screens/login/login3_gender/login_gender_models.dart';
import 'package:letter_bird_project/ui/screens/login/login6_country/login_country_models.dart';

import '../../../../main.dart';

class LoginGenderViewModel extends BaseViewModel {
  List<GenderDataModel> genderList = [];
  List<String> genderStringList = [];
  String genderValue = "";






  LoginGenderViewModel() {
//    init();
  getGender();
  }

  ///
  /// Graph Ql
  ///
  GraphQlClass graphQlClass = GraphQlClass();
  List<Gender> allGender = [];
  String verticalGroupValue = "Male";


  onGenderSelection(index){
    setState(ViewState.busy);
    for(int i = 0; i < allGender.length; i++){
      if(i == index){
        print(index);
        allGender[index].isSelected = true;
      } else{
        allGender[index].isSelected = false;
      }
    }
    setState(ViewState.idle);
  }

  onChanged(val){
    setState(ViewState.busy);
    verticalGroupValue = val;
    setState(ViewState.idle);
  }

  void getGender() async{
    setState(ViewState.loading);
    print("Gender Api Is CALLED");
    try {
      GraphQLClient graphQLClient = graphQlClass.clientToQuery();
      print("Cient");
      QueryResult result = await graphQLClient.query(
          QueryOptions(document: gql(QueryAndMutation().getGender)));
      print("Result");
      print(result.exception);
      print(result.source);
      print(result.data);
      if(result.data != null){
        print("Result In Data");


        for(int  i = 0; i < result.data!["Genders"].length; i++ ){
          print(result.data!["Genders"][i]);
          allGender.add(Gender.fromJson(result.data!["Genders"][i]));
          if(!genderStringList.toString().toLowerCase().contains(allGender[i].name.toString().toLowerCase())){
            genderStringList.add(allGender[i].name.toString());
          }
        }
      }
    } catch(e,s){
      print("Expception");
      print("Exception $e");
      print(s);
    }
    setState(ViewState.idle);
  }

//  init() async {
//    //isLoading = true;
//    getAllGenders();
//    //isLoading = false;
//  }


  onGenderChanged(String value) async {
    setState(ViewState.busy);

   genderValue=value;

    setState(ViewState.idle);
    // setState(() {});
  }


//  Future<void> getAllGenders() async {
//    setState(ViewState.loading);
//
//    try {
//      dio.options.headers['content-Type'] = 'application/json';
//
//      Response response = await dio.get(ApiConfig.genders);
//
//      logger.i("Country API Implementation");
//      logger.i("Status Code : ${response.statusCode}");
//      logger.i("response :${response.data.toString()}");
//      if (response.statusCode == 200) {
//        logger.i("Status Code : ${response.statusCode}");
//
//        GenderModel genderModel = GenderModel.fromJson(response.data);
//        logger.i("list size :${genderModel.data!.length}");
//
//        genderList = genderModel.data!;
//
//        //for radio group required string list
//        for(var item in genderList){
//          genderStringList.add(item!.displayName!);
//        }
//
//        genderValue=genderStringList.first;
//
//      }
//    } on DioError catch (e) {
//      logger.e(e.response!.data['message']);
//      Fluttertoast.showToast(msg: e.response!.data['message']);
//    }
//
//    setState(ViewState.idle);
//  }


//  Future<void> getAllGendersGraphQl() async {
//    setState(ViewState.loading);
//
//    String baseUrl="http://185.87.252.66:3800/graphql";
//
//
//    try {
//      dio.options.headers['content-Type'] = 'application/json';
//
//      Response response = await dio.get(ApiConfig.genders);
//
//      logger.i("Country API Implementation");
//      logger.i("Status Code : ${response.statusCode}");
//      logger.i("response :${response.data.toString()}");
//      if (response.statusCode == 200) {
//        logger.i("Status Code : ${response.statusCode}");
//
//        GenderModel genderModel = GenderModel.fromJson(response.data);
//        logger.i("list size :${genderModel.data!.length}");
//
//        genderList = genderModel.data!;
//
//        //for radio group required string list
//        for(var item in genderList){
//          genderStringList.add(item!.displayName!);
//        }
//
//        genderValue=genderStringList.first;
//
//      }
//    } on DioError catch (e) {
//      logger.e(e.response!.data['message']);
//      Fluttertoast.showToast(msg: e.response!.data['message']);
//    }
//
//    setState(ViewState.idle);
//  }
}



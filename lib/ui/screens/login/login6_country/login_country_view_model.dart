import 'package:country_provider/country_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/graph_ql_configs/qrapgh_ql_provider.dart';
import 'package:letter_bird_project/core/graph_ql_configs/query_mutation.dart';
import 'package:letter_bird_project/core/models/country.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';
import 'package:letter_bird_project/core/services/api_config.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/screens/login/login6_country/login_country_models.dart';

import '../../../../main.dart';

class LoginCountryViewModel extends BaseViewModel {
  // List<MyCountry> countryList = [];
  // List<MyCountry> countryFilteredList = [];
  GraphQlClass graphQlClass = GraphQlClass();
//  List<CountryModel> countriesList = [];
  List<CountryModel> countryList = [];
  List<CountryModel> countryFilteredList = [];
  String selectedCountryId = "";

  TextEditingController controller = new TextEditingController();

  LoginCountryViewModel() {
    init();
  }




  init() async {
    // isLoading = true;
    getAllCountries();
   // isLoading = false;


  }

  onCountrySelection(String countryId){
    setState(ViewState.busy);
    selectedCountryId = countryId;
    setState(ViewState.idle);
  }



  void getAllCountries() async{
    setState(ViewState.loading);
    print("Hello");
    try {
      GraphQLClient graphQLClient = graphQlClass.clientToQuery();
      QueryResult result = await graphQLClient.query(
          QueryOptions(document: gql(QueryAndMutation().country)));
      if(result.data != null){

        for(int  i = 0; i < result.data!["Countries"].length; i++ ){
          print(result.data!["Countries"][i]);
          countryList.add(CountryModel.fromJson(result.data!["Countries"][i]));
        }
      }
    } catch(e,s){
      print("Exception $e");
      print(s);
    }
    setState(ViewState.idle);
  }

  // Future<void> getAllCountries() async {
  //   setState(ViewState.loading);
  //
  //   List<Country>? countries = await CountryProvider.getAllCountries();
  //   print("Country List Size :${countries.length}");
  //
  //   for (int i = 0; i < countries.length; i++) {
  //     countryList.add(MyCountry(countries[i].name, i));
  //   }
  //
  //   setState(ViewState.idle);
  //   // setState(() {
  //   //   isLoading = false;
  //   // });
  // }

  onSearchTextChanged(
    String queryString,
  ) async {
    setState(ViewState.busy);

    countryFilteredList.clear();
    if (queryString.isEmpty) {
      // setState(() {});
      return;
    }

    countryList.forEach((data) {
      if (data.country!.toLowerCase().contains(queryString.toLowerCase()) ||
          data.country!.toLowerCase().contains(queryString.toLowerCase())) {
        countryFilteredList.add(data);
      }
    });

    setState(ViewState.idle);
    // setState(() {});
  }

//  Future<void> getAllCountries() async {
//    setState(ViewState.loading);
//
//    try {
//      dio.options.headers['content-Type'] = 'application/json';
//
////      Response response = await dio.get(ApiConfig.countries);
//
//      logger.i("Country API Implementation");
//      logger.i("Status Code : ${response.statusCode}");
//      logger.i("response :${response.data.toString()}");
//      if (response.statusCode == 200) {
//        logger.i("Status Code : ${response.statusCode}");
//
//        CountryModel countryModel = CountryModel.fromJson(response.data);
//        logger.i("list size :${countryModel.data!.length}");
//
//        countryList=countryModel.data!;
//      }
//    } on DioError catch (e) {
//      logger.e(e.response!.data['message']);
//      Fluttertoast.showToast(msg: e.response!.data['message']);
//    }
//
//    setState(ViewState.idle);
//  }
}

class MyCountry {
  String? choice;
  int index;

  MyCountry(this.choice, this.index);
}

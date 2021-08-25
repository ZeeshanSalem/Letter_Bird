import 'package:country_provider/country_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/graph_ql_configs/qrapgh_ql_provider.dart';
import 'package:letter_bird_project/core/graph_ql_configs/query_mutation.dart';
import 'package:letter_bird_project/core/models/city.dart';
import 'package:letter_bird_project/core/models/country.dart';
import 'package:letter_bird_project/core/other/base_view_model.dart';
import 'package:letter_bird_project/core/services/api_config.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/screens/login/login6_country/city/login_city_models.dart';
import 'package:letter_bird_project/ui/screens/login/login6_country/login_country_models.dart';

import '../../../../../main.dart';

class LoginCityViewModel extends BaseViewModel {
  // List<MyCountry> countryList = [];
  // List<MyCountry> countryFilteredList = [];
  GraphQlClass graphQlClass = GraphQlClass();
  List<City> cities = [];
  String selectedCity = "";


  //List<int> indexList=[];
  // List<CityDataModel> cityList = [];

  //List<CityDataModel> cityFilteredList = [];

  List<City> customCityList = [];
  List<City> customCityFilteredList = [];

  TextEditingController controller = new TextEditingController();

  LoginCityViewModel(String countryId) {
    print(countryId);
    getAllCity(countryId);
    init(countryId);
  }

  init(String id) async {
    isLoading = true;

    isLoading = false;
  }

  onSearchTextChanged(
    String queryString,
  ) async {
    setState(ViewState.busy);
    customCityFilteredList.clear();
    if (queryString.isEmpty) {
      return;
    }
    cities.forEach((data) {
      if (data.name!.toLowerCase().contains(queryString.toLowerCase())) {
        customCityFilteredList.add(data);
      }
    });
    setState(ViewState.idle);
  }


//  Future<void> getAllCities(String countryId) async {
//    setState(ViewState.loading);
//
//    try {
//      dio.options.headers['content-Type'] = 'application/json';
//
//      Response response = await dio.get(ApiConfig.cities + "$countryId");
//
//      logger.i("Country API Implementation");
//      logger.i("Status Code : ${response.statusCode}");
//      logger.i("response :${response.data.toString()}");
//      if (response.statusCode == 200) {
//        logger.i("Status Code : ${response.statusCode}");
//
//        CityModel cityModel = CityModel.fromJson(response.data);
//        logger.i("list size :${cityModel.data!.length}");
//
//        List<CityDataModel> cityList = [];
//        cityList = cityModel.data!;
//
//
//        List<CustomCityDataModel> newList = [];
//        //for custom Model
//        for (int i = 0; i < cityList.length; i++) {
//          CityDataModel item = cityList[i];
//          newList
//              .add(CustomCityDataModel(
//              cityId: item.cityId,
//              cityName: item.cityName,
//              statesId: item.statesId,
//              index: i));
//        }
//
//        customCityList=newList;
//
//
//      }
//    } on DioError catch (e) {
//      logger.e(e.response!.data['message']);
//      Fluttertoast.showToast(msg: e.response!.data['message']);
//    }
//
//    setState(ViewState.idle);
//  }


  ///
  /// Get City of Country
  ///
  void getAllCity(String countryId) async{
    setState(ViewState.loading);
    print("Hello");
    try {
      GraphQLClient graphQLClient = graphQlClass.clientToQuery();
      QueryResult result = await graphQLClient.query(
          QueryOptions(document: gql(QueryAndMutation().getCityByCountryId(countryId))));
      if(result.data != null){

        for(int  i = 0; i < result.data!["Cities"].length; i++ ){
          print(result.data!["Cities"][i]);
          cities.add(City.fromJson(result.data!["Cities"][i]));
        }
      }
    } catch(e,s){
      print("Exception $e");
      print(s);
    }
    setState(ViewState.idle);
  }

  onCitySelection(String city){
    setState(ViewState.busy);
    selectedCity = city;
    setState(ViewState.idle);
  }
}

class MyCountry {
  String? choice;
  int index;

  MyCountry(this.choice, this.index);
}

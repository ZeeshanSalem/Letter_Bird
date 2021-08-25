import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/models/country.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'city/login6_city.dart';
import 'login_country_models.dart';
import 'login_country_view_model.dart';


class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  bool buttonActive = false;

  //TextEditingController controller = new TextEditingController();

  String defaultCountryString = "Pakistan";

  //String countryId = "";

  int defaultIndex = -1;

  // List<MyCountry> countryList = [];

  //List<MyCountry> countryFilteredList = [];

  // List<MyChoice> choices = [
  //   // MyChoice('Pakistan', 0),
  //   // MyChoice('India', 1),
  //   // MyChoice('Bangladesh', 2),
  //   // MyChoice('Sri Lanka', 3),
  //   // MyChoice('UAE', 4),
  // ];

  //late MyCountry defaultCountryObject;

  @override
  void initState() {
    super.initState();

    // isLoading = true;
    // //defaultChoice = choices[0];
    // // Get all countries
    // getAllCountries();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (context) => LoginCountryViewModel(),
        child: Consumer<LoginCountryViewModel>(
          builder: (context, model, child) => Scaffold(
            body: SafeArea(
              child: model.state == ViewState.loading
                  ? Center(
                      child: Platform.isAndroid
                          ? CircularProgressIndicator()
                          : CupertinoActivityIndicator(),
                    )
                  : Container(
                      margin: EdgeInsets.only(left: 50, right: 50),
                      child: Column(
                        children: [
                          buildAppBar(
                              context: context,
                              title: 'Country',
                              isAdd: false,
                              isBack: false),
                          SizedBox(
                            height: 30,
                          ),
                          searchField(context,
                              controller: model.controller,
                              onChanged: model.onSearchTextChanged,
                              //onChanged: onSearchTextChanged,
                              // onChanged: () {
                              //   if (controller.text.isNotEmpty) {
                              //     model.onSearchTextChanged(
                              //         controller.text.toString(),
                              //         model.countryList);
                              //   }
                              // },
                              //onComplete: ()=>model.onSearchTextChanged(controller.text, model.countryList),
                              hintText: "Search",
                              height: 60),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Wrap(
                                children: [
                                  Container(
                                    child:
                                        model.countryFilteredList.length != 0 ||
                                                model.controller.text.isNotEmpty
                                            ? buildCountryList(
                                                model.countryFilteredList, model)
                                            : model.countryList.length != 0
                                                ? buildCountryList(
                                                    model.countryList, model)
                                                : textView(
                                                    text: "No Country Found",
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    textColor: textColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                          buttonActive
                              ? RoundedButton(
                                  text: 'Done',
                                  color: blue,
                                  textColor: whiteColor,
                                  width: size.width,
                                  press: () {
                                    print(
                                        "current Country :$defaultCountryString");
                                    //Move to sign up page
                                    Utils.push(
                                        CityScreen(
                                          country: defaultCountryString,
                                          countryId: model.selectedCountryId,
                                        ),
                                        context);
                                  },
                                )
                              : RoundedButton(
                                  text: 'Done',
                                  color: lightest_grey,
                                  textColor: textColor,
                                  width: size.width,
                                  press: () {
                                    print(
                                        "current Country :$defaultCountryString");
                                    //Move to sign up page
                                    //Utils.push(LoginScreen(), context);
                                  },
                                ),
                        ],
                      ),
                    ),
            ),
          ),
        ));
  }

  Widget buildCountryList(List<CountryModel> list, LoginCountryViewModel model) {
    return Column(
      children: List.generate(
          list.length, (index) => RadioListTile<String>(
              dense: true,
              title: textView(
                  textAlign: TextAlign.start,
                  fontSize: 14,
                  text: '${list[index].country}',
                  textColor: textColor,
                  fontWeight: FontWeight.w700),
              value: index.toString(),
              groupValue: defaultIndex.toString(),
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: Colors.orange,
              isThreeLine: false,
              onChanged: (value) {
                setState(() {
                  defaultCountryString = list[index].country!;
                  model.onCountrySelection(list[index].countryId.toString());
                  defaultIndex = index;

                  buttonActive = true;
                });
              }),),);
  }

// Future<void> getAllCountries() async {
//   List<Country>? countries = await CountryProvider.getAllCountries();
//   print("Country List Size :${countries.length}");
//
//   for (int i = 0; i < countries.length; i++) {
//     countryList.add(MyCountry(countries[i].name, i));
//   }
//
//   setState(() {
//     isLoading = false;
//   });
// }

// onSearchTextChanged(String queryString) async {
//   countryFilteredList.clear();
//   if (queryString.isEmpty) {
//     setState(() {});
//     return;
//   }
//
//   // countryList.forEach((data) {
//   //   if (data.choice!.toLowerCase().contains(queryString.toLowerCase()) ||
//   //       data.choice!.toLowerCase().contains(queryString.toLowerCase())) {
//   //     countryFilteredList.add(data);
//   //   }
//   // });
//
//   setState(() {});
// }
}

// class MyCountry {
//   String? choice;
//   int index;
//
//   MyCountry(this.choice, this.index);
// }

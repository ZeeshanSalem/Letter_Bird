import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/models/city.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/ui/screens/login/login6_country/city/login_city_models.dart';
import 'package:letter_bird_project/ui/screens/login/login6_country/city/login_city_view_model.dart';
import 'package:provider/provider.dart';

import '../../login7.dart';
import '../login_country_models.dart';


class CityScreen extends StatefulWidget {
  final String country;
  final String countryId;
  const CityScreen({Key? key, required this.country, required this.countryId}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  bool buttonActive = false;
  String defaultCountryString = "Pakistan";

  int defaultIndex = -1;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
        create: (context) => LoginCityViewModel(widget.countryId),
      child: Consumer<LoginCityViewModel>(
        builder: (context,model,child) => Scaffold(
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
                      title: 'City',
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
                            model.customCityFilteredList.length != 0 ||
                                model.controller.text.isNotEmpty
                                ? buildCountryList(
                                model.customCityFilteredList, model)

                                : model.cities.length != 0
                                ? buildCountryList(
                                model.cities, model)
                                : Center(
                                  child: textView(
                                  text: "No City Found",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  textColor: textColor),
                                ),
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
                      Utils.push(LoginScreen7(widget.country,defaultCountryString,widget.countryId ), context);
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
      ),
    );
    // return ChangeNotifierProvider(
    //     create: (context) => LoginCityViewModel(),
    //     child: Consumer<LoginCityViewModel>(
    //       builder: (context, model, child) =>
    //     ));
  }

  Widget buildCountryList(List<City> list, LoginCityViewModel model) {
    return Column(
      children: List.generate(list.length, (index) => RadioListTile<String>(
          dense: true,
          title: textView(
              textAlign: TextAlign.start,
              fontSize: 14,
              text: '${list[index].name}',
              textColor: textColor,
              fontWeight: FontWeight.w700),
          value: index.toString(),
          groupValue: defaultIndex.toString(),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: Colors.orange,
          isThreeLine: false,
          onChanged: (value) {
            setState(() {
              defaultCountryString = list[index].name.toString();
              defaultIndex = index;
              model.onCitySelection(list[index].name.toString());
              buttonActive = true;
            });
          })));
  }

}

// class MyCountry {
//   String? choice;
//   int index;
//
//   MyCountry(this.choice, this.index);
// }

import 'dart:io';

import 'package:country_provider/country_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:letter_bird_project/core/constants/colors.dart';
import 'package:letter_bird_project/core/enums/view_state.dart';
import 'package:letter_bird_project/core/utils.dart';
import 'package:letter_bird_project/ui/components/loader.dart';
import 'package:letter_bird_project/ui/custom_widgets/rounded_button.dart';
import 'package:letter_bird_project/ui/custom_widgets/widgets.dart';
import 'package:letter_bird_project/ui/screens/login/login8PickLanguage.dart';
import 'package:letter_bird_project/ui/screens/login/login8_language/language_models.dart';
import 'package:letter_bird_project/ui/screens/login/login8_language/select_language_view_model.dart';
import 'package:provider/provider.dart';

import 'login8LanguageLevel.dart';

class SelectLanguage extends StatefulWidget {
  final bool isNative;
  final String nativeText;
  const SelectLanguage({Key? key,required this.isNative, required this.nativeText}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  bool buttonActive=false;

  // TextEditingController controller = new TextEditingController();
  //
   String defaultCountryString = "Pakistan";
   int defaultIndex = -1;
  //
  // List<MyCountry> countryList = [];
  //
  // List<MyCountry> countryFilteredList = [];


  @override
  void initState() {
    super.initState();

    // isLoading=true;
    // //defaultChoice = choices[0];
    // // Get all countries
    // getAllCountries();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(create: (context) => SelectLanguageViewModel(),
    child: Consumer<SelectLanguageViewModel>(
      builder: (context,model,child) => Scaffold(
        body: SafeArea(
          child: model.state==ViewState.loading ?
          Center(
            child: Platform.isAndroid
                ? CircularProgressIndicator()
                : CupertinoActivityIndicator(),
          ) :
          Container(
            margin: EdgeInsets.only(left: 50, right: 50),
            child: Column(
              children: [
                buildAppBar(
                    context: context, title: 'Language', isAdd: false, isBack: false),
                SizedBox(
                  height: 30,
                ),
                searchField(context,controller: model.controller,onChanged: model.onSearchTextChanged, hintText: "Search", height: 60),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: [
                        Container(
                          child: model.languageFilteredList.length !=0  || model.controller.text.isNotEmpty
                              ? buildCountryList(model.languageFilteredList)
                              : model.languageList.length !=0
                              ? buildCountryList(model.languageList)
                              : textView(text: "No Languages Found",
                              fontSize: 14, fontWeight: FontWeight.w700, textColor: textColor),

                        )
                      ],
                    ),
                  ),
                ),
                buttonActive ?
                RoundedButton(
                  text: 'Done',
                  color: blue,
                  textColor: whiteColor,
                  width: size.width,
                  press: () {
                    print("current Country :${widget.isNative}");
                    print("current Country :$defaultCountryString");

                    if (widget.isNative==true) {
                      //Move to sign up page
                      List<PickLanguageModel> list=[];
                      Utils.push(LoginScreen8PickLanguage(defaultCountryString,list), context);
                    }else{
                      Utils.push(LanguageLevel(languageName: defaultCountryString,nativeText: widget.nativeText,), context);
                    }

                  },
                ):
                RoundedButton(
                  text: 'Done',
                  color: lightest_grey,
                  textColor: textColor,
                  width: size.width,
                  press: () {
                    print("current Country :$defaultCountryString");
                    //Move to sign up page
                    //Utils.push(LoginScreen(), context);
                    Utils.push(LoginScreen8PickLanguage(defaultCountryString,[]), context);


                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }

  Widget buildCountryList(List<Language> list){
    return Column(
      children: List.generate(
          list.length, (index)  => RadioListTile<String>(
          dense: true,
          title: textView(
            textAlign: TextAlign.start,
              fontSize: 14,
              text: '${list[index].name}',
              textColor: textColor,
              fontWeight: FontWeight.w700),
          value: index.toString(),
          groupValue: defaultIndex.toString(),
          controlAffinity:
          ListTileControlAffinity.trailing,
          activeColor: Colors.orange,
          isThreeLine: false,
          onChanged: (value) {
            setState(() {
              defaultCountryString = list[index].name!;
              defaultIndex = index;

              buttonActive=true;
            });
          }))
          .toList(),
    );
  }


}


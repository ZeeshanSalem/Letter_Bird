import 'package:letter_bird_project/core/models/city.dart';

class CountryModel {
  String? countryId;
  String? country;
  String? iso;
  String? capital;
  String? currencyCode;
  String? currencyName;
  String? currencySymbol;
  String? phone;
  String? postalCodeRegex;
  String? postalCodeFormat;
  List<String>? languages;
  List<City>? cities;

  CountryModel(
      {this.countryId,
        this.country,
        this.iso,
        this.capital,
        this.currencyCode,
        this.currencyName,
        this.currencySymbol,
        this.phone,
        this.postalCodeRegex,
        this.postalCodeFormat,
        this.languages,
        this.cities});

  CountryModel.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    country = json['country'];
//    iso = json['iso'];
//    capital = json['capital'];
//    currencyCode = json['currency_code'];
//    currencyName = json['currency_name'];
//    currencySymbol = json['currency_symbol'];
//    phone = json['phone'];
//    postalCodeRegex = json['postal_code_regex'];
//    postalCodeFormat = json['postal_code_format'];
//    languages = json['languages'].cast<String>();
//    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['country'] = this.country;
//    data['iso'] = this.iso;
//    data['capital'] = this.capital;
//    data['currency_code'] = this.currencyCode;
//    data['currency_name'] = this.currencyName;
//    data['currency_symbol'] = this.currencySymbol;
//    data['phone'] = this.phone;
//    data['postal_code_regex'] = this.postalCodeRegex;
//    data['postal_code_format'] = this.postalCodeFormat;
//    data['languages'] = this.languages;
//    if (this.city != null) {
//      data['city'] = this.city.toJson();
//    }
    return data;
  }
}

//
//
//class MyCountry {
//  String? choice;
//  int index;
//
//  MyCountry(this.choice, this.index);
//}
//
//
//
//
//class CountryModel {
//  int? code;
//  List<Data>? data;
//  String? message;
//
//  CountryModel({this.code, this.data, this.message});
//
//  CountryModel.fromJson(Map<String, dynamic> json) {
//    code = json['code'];
//    if (json['data'] != null) {
//      // data = new List<Data>();
//      data=[];
//      json['data'].forEach((v) {
//        data!.add(new Data.fromJson(v));
//      });
//    }
//    message = json['message'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['code'] = this.code;
//    if (this.data != null) {
//      data['data'] = this.data!.map((v) => v.toJson()).toList();
//    }
//    data['message'] = this.message;
//    return data;
//  }
//}
//
//class Data {
//  int? countryId;
//  String? countrySortname;
//  String? countryName;
//  int? countryPhonecode;
//
//  Data(
//      {this.countryId,
//        this.countrySortname,
//        this.countryName,
//        this.countryPhonecode});
//
//  Data.fromJson(Map<String, dynamic> json) {
//    countryId = json['country_id'];
//    countrySortname = json['country_sortname'];
//    countryName = json['country_name'];
//    countryPhonecode = json['country_phonecode'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['country_id'] = this.countryId;
//    data['country_sortname'] = this.countrySortname;
//    data['country_name'] = this.countryName;
//    data['country_phonecode'] = this.countryPhonecode;
//    return data;
//  }
//}

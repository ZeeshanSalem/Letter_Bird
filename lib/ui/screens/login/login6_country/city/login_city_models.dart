






class CityModel {
  int? code;
  List<CityDataModel>? data;
  String? message;

  CityModel({this.code, this.data, this.message});

  CityModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      // data = new List<Data>();
      data = [];
      json['data'].forEach((v) {
        data!.add(new CityDataModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class CityDataModel {
  int? cityId;
  String? cityName;
  int? statesId;

  CityDataModel({this.cityId, this.cityName, this.statesId});

  CityDataModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    statesId = json['states_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['states_id'] = this.statesId;
    return data;
  }
}


class CustomCityDataModel {
  int? cityId;
  String? cityName;
  int? statesId;
  int? index;
  CustomCityDataModel({this.cityId, this.cityName, this.statesId,this.index});

}


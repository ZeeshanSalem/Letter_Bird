class City {
  String? cityId;
  String? name;

  City({this.cityId, this.name});

  City.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['name'] = this.name;
    return data;
  }
}
class Gender {
  String? sId;
  String? name;
  bool? isSelected;

  Gender({this.sId, this.name, this.isSelected = false});

  Gender.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

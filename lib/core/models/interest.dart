class Interest {
  String? sId;
  String? name;
  bool? status;

  Interest({this.sId, this.name, this.status});

  Interest.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}

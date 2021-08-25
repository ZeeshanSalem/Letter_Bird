

class GenderModel {
  int? code;
  List<GenderDataModel>? data;
  String? message;

  GenderModel({this.code, this.data, this.message});

  GenderModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      // data = new List<Data>();
      data=[];
      json['data'].forEach((v) {
        data!.add(new GenderDataModel.fromJson(v));
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

class GenderDataModel {
  int? id;
  String? name;
  String? displayName;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  GenderDataModel(
      {this.id,
        this.name,
        this.displayName,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  GenderDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['display_name'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

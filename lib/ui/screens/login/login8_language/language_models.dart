class LanguageModel {
  int? code;
  List<LanguageDataModel>? data;
  String? message;

  LanguageModel({this.code, this.data, this.message});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      // data = new List<Data>();
      data = [];
      json['data'].forEach((v) {
        data!.add(new LanguageDataModel.fromJson(v));
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

class LanguageDataModel {
  int? id;
  String? langName;
  String? langShort;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  LanguageDataModel(
      {this.id,
        this.langName,
        this.langShort,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  LanguageDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    langName = json['lang_name'];
    langShort = json['lang_short'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lang_name'] = this.langName;
    data['lang_short'] = this.langShort;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

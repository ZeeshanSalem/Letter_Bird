class Language {
  String? sId;
  String? name;
  String? description;
  String? wordCode;

  Language({this.sId, this.name, this.description, this.wordCode});

  Language.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    wordCode = json['word_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['word_code'] = this.wordCode;
    return data;
  }
}
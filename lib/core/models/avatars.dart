class Avatars {
  String? sId;
  bool? isActive;
  bool? isPremium;
  int? coin;
  String? avatar;

  Avatars({this.sId, this.isActive, this.isPremium, this.coin, this.avatar});

  Avatars.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isActive = json['is_active'];
    isPremium = json['is_premium'];
    coin = json['coin'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['is_active'] = this.isActive;
    data['is_premium'] = this.isPremium;
    data['coin'] = this.coin;
    data['avatar'] = this.avatar;
    return data;
  }
}
/// typeId is
/// 2 -> supplier
/// 3 -> customer

class UserLogin {
  String? message;
  bool? hasHistory;
  int? typeId;

  UserLogin({this.message, this.hasHistory, this.typeId});

  UserLogin.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    hasHistory = json['has_history'];
    typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['message'] = message;
    data['has_history'] = hasHistory;
    data['type_id'] = typeId;
    return data;
  }
}
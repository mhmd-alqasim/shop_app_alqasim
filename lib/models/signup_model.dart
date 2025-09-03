class SignUpModel {
  bool? status;
  String? message;
  Data? data;

  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  User? user;
  String? token;
  int? expiresIn;

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    expiresIn = json['expires_in'];
  }
}

class User {
  String? id;
  String? username;
  String? email;
  String? role;
  String? status;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    status = json['status'];
  }
}

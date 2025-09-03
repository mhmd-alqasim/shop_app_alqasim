class LoginModel {
  bool? status;
  String? message;
  String? token;
  User? user;
  int? expiresIn;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    expiresIn = json['expires_in'];
  }
}

class User {
  int? id;
  String? email;
  String? username;
  String? role;
  String? status;
  String? createdAt;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    role = json['role'];
    status = json['status'];
    createdAt = json['created_at'];
  }
}

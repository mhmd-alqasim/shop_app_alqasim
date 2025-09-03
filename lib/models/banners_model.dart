class bannersModel {
  bool? status;
  String? message;
  List<Data>? data;

  bannersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? title;
  String? image;
  String? position;
  String? createdAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    position = json['position'];
    createdAt = json['created_at'];
  }
}

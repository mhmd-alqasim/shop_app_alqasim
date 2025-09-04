import 'package:alqasim_market/network/remote/diohelper.dart';

class CategroiesModel {
  bool? status;
  List<Data>? data;

  CategroiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
  String? name;
  String? description;
  String? image;
  String? createdAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = DioHelper.baseUrl + json['image'];
    createdAt = json['created_at'];
  }
}

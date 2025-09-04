import 'package:alqasim_market/network/remote/diohelper.dart';

class SearchModel {
  bool? status;
  String? message;
  List<Data>? data;

  SearchModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? description;
  String? price;
  int? stock;
  String? mainImage;
  String? detailImages;
  int? categoryId;
  String? createdAt;
  String? oldPrice;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    mainImage = DioHelper.baseUrl + json['main_image'];
    detailImages = json['detail_images'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    oldPrice = json['old_price'];
  }
}

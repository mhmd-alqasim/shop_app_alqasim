import 'package:alqasim_market/network/remote/diohelper.dart';

class CategorieDetailsModel {
  bool? status;
  Data? data;

  CategorieDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? image;
  String? createdAt;
  List<Products>? products;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = DioHelper.baseUrl + json['image'];
    createdAt = json['created_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  String? price;
  String? oldPrice;
  int? stock;
  String? mainImage;
  String? detailImages;
  int? categoryId;
  String? createdAt;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    oldPrice = json['old_price'];
    stock = json['stock'];
    mainImage = DioHelper.baseUrl + json['main_image'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
  }
}

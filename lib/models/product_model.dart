import 'package:alqasim_market/network/remote/diohelper.dart';

class ProductModel {
  bool? status;
  String? message;
  Data? data;

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? price;
  String? oldPrice;
  int? stock;
  String? mainImage;
  List<String>? detailImages;
  int? categoryId;
  String? createdAt;
  int? isCart;
  int? isFavorite;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    oldPrice = json['old_price'];
    stock = json['stock'];
    mainImage = DioHelper.baseUrl + json['main_image'];
    detailImages = json['detail_images'].cast<String>();
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    isCart = json['is_cart'];
    isFavorite = json['is_favorite'];
  }
}

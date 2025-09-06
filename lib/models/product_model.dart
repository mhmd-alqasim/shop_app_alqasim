import 'package:alqasim_market/network/remote/diohelper.dart';
import 'dart:convert';

class ProductModel {
  bool? status;
  String? message;
  Product? data;

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Product.fromJson(json['data']) : null;
  }
}

class Product {
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

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    oldPrice = json['old_price'];
    stock = json['stock'];
    mainImage = DioHelper.baseUrl + json['main_image'];
    if (json['detail_images'] is String) {
      // إذا كانت البيانات عبارة عن String، قم بتحليلها
      final decodedList = jsonDecode(json['detail_images']) as List;
      detailImages = decodedList.cast<String>();
    } else if (json['detail_images'] is List) {
      // إذا كانت البيانات عبارة عن قائمة (وهو الوضع الصحيح)، استخدمها مباشرة
      detailImages = (json['detail_images'] as List).cast<String>();
    }
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    isCart = json['is_cart'];
    isFavorite = json['is_favorite'];
  }
}

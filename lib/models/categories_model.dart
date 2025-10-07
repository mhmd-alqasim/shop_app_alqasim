import 'package:alqasim_market/models/product_model.dart';
import 'package:alqasim_market/network/remote/diohelper.dart';

class CategoriesModel {
  bool? status;
  List<Category>? data;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Category>[];
      json['data'].forEach((v) {
        data!.add(Category.fromJson(v));
      });
    }
  }
}

class Category {
  int? id;
  String? name;
  String? description;
  String? image;
  String? createdAt;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = DioHelper.baseUrl + json['image'];
    createdAt = json['created_at'];
  }
}

// ---

class CategorieDetailsModel {
  bool? status;
  CategoryDetails? data;

  CategorieDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? CategoryDetails.fromJson(json['data']) : null;
  }
}

class CategoryDetails extends Category {
  List<Product>? products;

  CategoryDetails.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }
}

import 'package:alqasim_market/network/remote/diohelper.dart';

class HomeModel {
  bool? status;
  Data? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<DiscountedProduct>? discountedProducts;
  List<Banner>? banners;
  List<Category>? categories;
  List<LatestProduct>? latestProducts;
  List<CategoryWithProducts>? categoriesWithProducts;

  Data.fromJson(Map<String, dynamic> json) {
    discountedProducts =
        (json['discounted_products'] as List?)
            ?.map((v) => DiscountedProduct.fromJson(v))
            .toList();
    banners =
        (json['banners'] as List?)?.map((v) => Banner.fromJson(v)).toList();
    categories =
        (json['categories'] as List?)
            ?.map((v) => Category.fromJson(v))
            .toList();
    latestProducts =
        (json['latest_products'] as List?)
            ?.map((v) => LatestProduct.fromJson(v))
            .toList();
    categoriesWithProducts =
        (json['categories_with_products'] as List?)
            ?.map((v) => CategoryWithProducts.fromJson(v))
            .toList();
  }
}

class DiscountedProduct {
  int? id;
  String? name;
  String? mainImage;
  String? price;
  String? oldPrice;

  DiscountedProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mainImage = DioHelper.baseUrl + json['main_image'];
    price = json['price'];
    oldPrice = json['old_price'];
  }
}

class Banner {
  int? id;
  String? title;
  String? image;
  String? position;

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = DioHelper.baseUrl + json['image'];
    position = json['position'];
  }
}

class Category {
  int? id;
  String? name;
  String? image;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = DioHelper.baseUrl + json['image'];
  }
}

class LatestProduct {
  int? id;
  String? name;
  String? mainImage;
  String? price;
  String? oldPrice;
  int? categoryId;

  LatestProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mainImage = DioHelper.baseUrl + json['main_image'];
    price = json['price'];
    oldPrice = json['old_price'];
    categoryId = json['category_id'];
  }
}

class CategoryWithProducts {
  int? id;
  String? name;
  String? image;
  List<Product>? products;

  CategoryWithProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = DioHelper.baseUrl + json['image'];
    products =
        (json['products'] as List?)?.map((v) => Product.fromJson(v)).toList();
  }
}

class Product {
  int? id;
  String? name;
  String? mainImage;
  String? price;
  String? oldPrice;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mainImage = DioHelper.baseUrl + json['main_image'];
    price = json['price'];
    oldPrice = json['old_price'];
  }
}

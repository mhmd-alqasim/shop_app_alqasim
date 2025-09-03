class FavModel {
  bool? status;
  String? message;
  List<Data>? data;

  FavModel.fromJson(Map<String, dynamic> json) {
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
  String? mainImage;
  int? categoryId;
  String? createdAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    mainImage = json['main_image'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
  }
}

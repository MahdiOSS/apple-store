import 'package:apple_store/Base/Utils.dart';

class Product {
  String? product_image;
  String? name;
  int? price;
  int? discount;
  String? category;
  String? id;
  String? sort;

  Product(this.product_image, this.name, this.price, this.discount,
      this.category, this.id, this.sort);

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      setPocketBaseUriImage('product_image', json),
      json['name'],
      json['price'],
      json['price_discount'],
      json['category'],
      json['id'],
      json['sort']);
}

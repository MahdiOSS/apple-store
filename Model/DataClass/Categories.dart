import 'package:apple_store/Base/Constant.dart';

import '../../Base/Utils.dart';

class Categories {
  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<CategoryItem> items;

  Categories(
      this.items, this.page, this.perPage, this.totalItems, this.totalPages);

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
      List<CategoryItem>.generate(json['totalItems'],
          (index) => CategoryItem.fromJson(json['items'][index])),
      json['page'],
      json['perPage'],
      json['totalItems'],
      json['totalPages']);
}

class CategoryItem {
  String? background_color;
  String? collectionId;
  String? collectionName;
  String? created;
  String? icon_category;
  int? icon_size;
  String? id;
  String? image_category;
  String? name_category;
  String? updated;

  CategoryItem(
      this.background_color,
      this.collectionId,
      this.collectionName,
      this.created,
      this.icon_category,
      this.icon_size,
      this.id,
      this.image_category,
      this.name_category,
      this.updated);

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
      json['background_color'],
      json['collectionId'],
      json['collectionName'],
      json['created'],
      //setting your img from pocketBase
      setPocketBaseUriImage('icon_category', json),
      json['icon_size'],
      json['id'],
      setPocketBaseUriImage('image_category', json),
      json['name_category'],
      json['updated']);
}

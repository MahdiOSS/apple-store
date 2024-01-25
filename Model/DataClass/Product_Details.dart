import '../../Base/Constant.dart';
import 'Product_Variant.dart';

class ProductDetail {
  String? category_id;
  String? collectionId;
  String? collectionName;
  String? created;
  List<String>? gallery;
  String? id;
  String? product_id;
  num? rate;
  String? title;
  String? content;
  String? updated;
  List<Variant> variant;

  ProductDetail(
      this.category_id,
      this.collectionId,
      this.collectionName,
      this.created,
      this.gallery,
      this.id,
      this.product_id,
      this.rate,
      this.title,
      this.updated,
      this.variant,this.content);

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      ProductDetail(
          json['category_id'],
          json['collectionId'],
          json['collectionName'],
          json['created'],
          List<String>.generate(
              (json['gallery'] as List<dynamic>).length,
                  (index) =>
              '${BaseDomain
                  .baseUrl}files/${json['collectionName']}/${json['id']}/${json['gallery'][index]}'),
          json['id'],
          json['product_id'],
          json['rate'],
          json['title'],
          json['updated'],
          List<Variant>.generate(
              (json['variant_type'] as List<dynamic>).length, (
              index) => getVariantFromVariantTypeId(json['variant_type'][index])),json['content']
      );
}


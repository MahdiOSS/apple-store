import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Model/DataClass/Product_Details.dart';
import 'package:apple_store/Model/DataClass/Product_Variant.dart';
import 'package:apple_store/Model/DataClass/Properties.dart';
import 'package:dartz/dartz.dart';
import '../DataClass/Product.dart';

abstract class ProductRepository {
  Future<Either<String, List<Product>>> getProduct(
      {ProductSort sort = ProductSort.allProduct, String categoryId = ''});

  Future<Either<String, ProductDetail>> getProductDetails(String productId);

  Future<Either<String, ProductVariant>> getProductVariants(String productId);

  Future<Either<String, String>> getCategoryName(String categoryId);

  Future<Either<String, List<Properties>>> getProperties(String productId);
}

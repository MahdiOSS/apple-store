import 'package:apple_store/Model/DataClass/BannerSlider.dart';
import 'package:dartz/dartz.dart';

abstract class BannerRepository {
  Future<Either<String,BannerSliders>> getBanners();
}
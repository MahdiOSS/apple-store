import 'package:apple_store/Base/MyExcaption.dart';
import 'package:apple_store/Model/DataClass/BannerSlider.dart';
import 'package:apple_store/Model/Repository/BannerSliderRepository.dart';
import 'package:apple_store/Model/Repository/DataSource/BannerSliderDataSource.dart';
import 'package:dartz/dartz.dart';

class BannerSliderRepositoryImpl extends BannerRepository {
  final BannerDataSource _bannerDataSource;
  BannerSliderRepositoryImpl(this._bannerDataSource);

  @override
  Future<Either<String,BannerSliders>> getBanners() async {
    try {
      var response = await _bannerDataSource.getBanners();
      print(response);
      Map<String,dynamic> json = response.data;
      BannerSliders bannerSliders = BannerSliders.fromJson(json);
      return Right(bannerSliders);
    } on ApiException catch(ex){
      return Left(ex.message);
    } catch(ex){
      print(ex.toString());
      return const Left('exception');
    }
  }

}
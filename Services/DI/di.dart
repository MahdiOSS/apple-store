import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Model/Repository/AuthRepositoryImpl.dart';
import 'package:apple_store/Model/Repository/BannerSliderRepository.dart';
import 'package:apple_store/Model/Repository/BannerSliderRepositoryImpl.dart';
import 'package:apple_store/Model/Repository/CardRepository.dart';
import 'package:apple_store/Model/Repository/CardRepositoryImpl.dart';
import 'package:apple_store/Model/Repository/CategoryRepository.dart';
import 'package:apple_store/Model/Repository/CategoryRepositoryImpl.dart';
import 'package:apple_store/Model/Repository/DataSource/AuthDataSource_impl.dart';
import 'package:apple_store/Model/Repository/DataSource/BannerSliderDataSource.dart';
import 'package:apple_store/Model/Repository/DataSource/BannerSliderDataSource_Impl.dart';
import 'package:apple_store/Model/Repository/DataSource/CardDataSource.dart';
import 'package:apple_store/Model/Repository/DataSource/CardDataSource_impl.dart';
import 'package:apple_store/Model/Repository/DataSource/CategoryDataSource.dart';
import 'package:apple_store/Model/Repository/DataSource/CategoryDataSource_impl.dart';
import 'package:apple_store/Model/Repository/DataSource/ProductDataSource.dart';
import 'package:apple_store/Model/Repository/DataSource/ProductDataSource_Impl.dart';
import 'package:apple_store/Model/Repository/Local/Auth_Repository_Local.dart';
import 'package:apple_store/Model/Repository/Local/Card_Repository_Local.dart';
import 'package:apple_store/Model/Repository/ProductRepository.dart';
import 'package:apple_store/Model/Repository/ProductRepositoryImpl.dart';
import 'package:apple_store/Model/Repository/Remote/Auth_Repository_Remote.dart';
import 'package:apple_store/Model/Repository/Remote/BannerSlider_Repository_Remote.dart';
import 'package:apple_store/Model/Repository/Remote/Category_Repository_Remote.dart';
import 'package:apple_store/Model/Repository/Remote/Product_Repository_Remote.dart';
import 'package:apple_store/Services/DB/Hive.dart';
import 'package:apple_store/Services/DB/Shared_Perf.dart';
import 'package:apple_store/Services/Dio/ApiService.dart';
import 'package:apple_store/Services/Dio/DIO.dart';
import 'package:apple_store/Services/Payment/Payment.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zarinpal/zarinpal.dart';
import '../../Bloc/Cart_Bloc/Card_Bloc.dart';
import '../../Model/Repository/AuthRepository.dart';
import '../../Model/Repository/DataSource/AuthDataSource.dart';

GetIt di = GetIt.I;

Future<void> initGetIt() async {
  //singleton
  di.registerSingleton<Dio>(createDio());
  di.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  di.registerSingleton<PaymentRequest>(PaymentRequest());
  di.registerSingleton<MyPayment>(ZarinPal_Payment(di.get()));
  //factory
  di.registerFactory<ApiService>(() => ApiService(di.get()));
  di.registerFactory<SharedPref>(() => SharedPref(di.get()));
  di.registerFactory<MyHive>(() => MyHive());
  di.registerFactory<AuthRepositoryRemote>(() => AuthRepositoryRemote(di.get()));
  di.registerFactory<AuthRepositoryLocal>(() => AuthRepositoryLocal(di.get()));
  di.registerFactory<AuthDataSource>(() => AuthDataSourceImpl(di.get(),di.get()));
  di.registerFactory<AuthRepository>(() => AuthRepositoryImpl(di.get()));
  di.registerFactory<CategoryRepositoryRemote>(() => CategoryRepositoryRemote(di.get()));
  di.registerFactory<CategoryDataSource>(() => CategoryDataSourceImpl(di.get()));
  di.registerFactory<CategoryRepository>(() => CategoryRepositoryImpl(di.get()));
  di.registerFactory<BannerSliderRepositoryRemote>(() => BannerSliderRepositoryRemote(di.get()));
  di.registerFactory<BannerDataSource>(() => BannerSliderDataSourceImpl(di.get()));
  di.registerFactory<BannerRepository>(() => BannerSliderRepositoryImpl(di.get()));
  di.registerFactory<ProductRepositoryRemote>(() => ProductRepositoryRemote(di.get()));
  di.registerFactory<ProductDataSource>(() => ProductDataSourceImpl(di.get()));
  di.registerFactory<ProductRepository>(() => ProductRepositoryImpl(di.get()));
  di.registerFactory<CardRepositoryLocal>(() => CardRepositoryLocal(di.get()));
  di.registerFactory<CardDataSource>(() => CardDataSourceImpl(di.get()));
  di.registerFactory<CardRepository>(() => CardRepositoryImpl(di.get(),di.get()));
  //bloc
  di.registerSingleton<CartBloc>(CartBloc(di.get()));

  _loadToken();
}

_loadToken(){
  AuthDataSource repository = di.get();
  repository.runToken();
}

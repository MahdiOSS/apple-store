import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Base/Utils.dart';
import 'package:apple_store/Base/Widget/MyDivider.dart';
import 'package:apple_store/Bloc/Home_Bloc/Home_Bloc.dart';
import 'package:apple_store/Bloc/Home_Bloc/Home_Event.dart';
import 'package:apple_store/Bloc/Home_Bloc/Home_State.dart';
import 'package:apple_store/Model/DataClass/Product.dart';
import 'package:apple_store/View/Home/Widget/Category_Widget.dart';
import 'package:apple_store/View/Home/Widget/DividerSection_Widget.dart';
import 'package:apple_store/View/Home/Widget/Product_Widget.dart';
import 'package:apple_store/View/Home/Widget/SearchBar_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Model/DataClass/BannerSlider.dart';
import '../../Model/DataClass/Categories.dart';
import 'Widget/BannerSlider_Widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BannerSliderItem> _sliders = [];
  List<CategoryItem> _categories = [];
  List<Product> _bestSeller = [];
  List<Product> _bestViewer = [];

  @override
  void initState() {
    _designScreen();
    myDelay(500, () =>  _getBanners());
    myDelay(1000, () => _getCategories());
    myDelay(1500, () => _getProducts(ProductSort.bestSeller));
    myDelay(2000, () => _getProducts(ProductSort.mostVisited));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: MyColor.white,
        body: SafeArea(
          child: _getBody(),
        ),
      );

  _getBody() => BlocListener<HomeBloc, HomeState>(
        listener: (context, state) async {
          if (state is HomeBannersState) {
            state.sliders.fold((l) => {}, (r) => _sliders = r.sliders);
          }
          if (state is HomeCategoryState) {
            state.categories.fold((l) => {}, (r) => _categories = r.items);
          }
          if (state is HomeBestSellerProductsState) {
            state.products.fold((l) => {}, (r) => _bestSeller = r);
          }
          if (state is HomeMostVisitedProductsState) {
            state.products.fold((l) => {}, (r) => _bestViewer = r);
          }
          print(_bestSeller.length);
          setState(() {});
        },
        child: RefreshIndicator(
          onRefresh: () async {
            myDelay(500, () =>  _getBanners());
            myDelay(1000, () => _getCategories());
            myDelay(1500, () => _getProducts(ProductSort.bestSeller));
            myDelay(2000, () => _getProducts(ProductSort.mostVisited));
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: CustomScrollView(
              slivers: [
                if (_sliders.isNotEmpty) _getSearchBar(),
                _getBannerSliderWidget(_sliders),
                _getCategoryTitle(),
                _getCategoryListWidget(_categories),
                _getCategoryTitle2(),
                _getProductList(_bestSeller),
                _getCategoryTitle3(),
                _getProductList(_bestViewer),
              ],
            ),
          ),
        ),
      );

  _getCategoryTitle3() => SliverPadding(
        padding: const EdgeInsets.only(top: 32, bottom: 20, right: 15),
        sliver: DividerSection(
          title: 'پر بازدید ترین ها',
        ),
      );

  Widget _getProductList(List<Product> list) => ProductList(list: list);

  _getCategoryTitle2() => SliverPadding(
        padding: const EdgeInsets.only(top: 32, bottom: 20, right: 15),
        sliver: DividerSection(
          title: 'پر فروش ترین ها',
        ),
      );

  _getCategoryTitle() => SliverPadding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 20, right: 15, left: 20),
        sliver: SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'دسته بندی',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 13),
                textAlign: TextAlign.right,
              ),
              MyDivider(color: Colors.grey.withOpacity(0.4), width: 240,),
              const SizedBox(width: 20,)
            ],
          ),
        ),
      );

  _getSearchBar() => const SliverPadding(
      padding: EdgeInsets.only(top: 15),
      sliver: SliverToBoxAdapter(child: CustomSearchBar()));

  _getBanners() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetBannersEvent());
  }

  _getCategories() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetCategoryEvent());
  }

  _getProducts(ProductSort sort) {
    HomeEvent? event;
    if (sort == ProductSort.bestSeller) {
      event = HomeGetBestSellerProductsEvent(sort);
    } else if (sort == ProductSort.mostVisited) {
      event = HomeGetMostVisitedProductsEvent(sort);
    }
    BlocProvider.of<HomeBloc>(context).add(event!);
  }

  Widget _getBannerSliderWidget(List<BannerSliderItem> sliders) =>
      SliverPadding(
        padding: const EdgeInsets.only(top: 30.0),
        sliver: BannerSliderSection(
          url: _generatorBannerSliderToUri(sliders),
        ),
      );

  Widget _getCategoryListWidget(List<CategoryItem> categories) =>
      SliverToBoxAdapter(child: CategorySection(categories: categories));

  List<String> _generatorBannerSliderToUri(List<BannerSliderItem> list) {
    List<String> images = [];
    for (var element in list) {
      images.add(element.banner_image!);
    }
    return images;
  }

  _designScreen() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: MyColor.white,statusBarIconBrightness: Brightness.dark));
  }
}

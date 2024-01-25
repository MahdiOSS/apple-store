import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Bloc/Category_Bloc/Category_Bloc.dart';
import 'package:apple_store/Bloc/Category_Bloc/Category_Event.dart';
import 'package:apple_store/Bloc/Category_Bloc/Category_State.dart';
import 'package:apple_store/Model/DataClass/Categories.dart';
import 'package:apple_store/View/Category/Widget/CatItem_Widget.dart';
import 'package:apple_store/View/Home/Widget/AppBar_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Base/Utils.dart';
import '../../Bloc/Product_Bloc/Product_Bloc.dart';
import '../../Services/DI/di.dart';
import '../ProductList/ProductList_Screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    _getCategory(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      body: SafeArea(
        child: _getBody(),
      ),
    );
  }

  _getWidgetFromState(CategoryState state) {
    if (state is LoadCategoryState) {
      return state.categories.fold(
          (l) => SliverToBoxAdapter(child: Text(l)), (r) => _getGridItems(r));
    }
    return const SliverToBoxAdapter(child: Text('error'));
  }

  _getBody() => CustomScrollView(
        slivers: [
          SliverPadding(
            sliver: SliverToBoxAdapter(child: AppBarWidget(title: 'دسته بندی')),
            padding: const EdgeInsets.only(top: 20, bottom: 20),
          ),
          //
          BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
            return _getWidgetFromState(state);
          })
          //
        ],
      );

  _getGridItems(Categories categories) => SliverPadding(
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: categories.items.length,
            (context, index) => GestureDetector(
                onTap: () {
                  myPushNavigate(
                      context,
                      BlocProvider<ProductBloc>(
                          create: (BuildContext context) =>
                              ProductBloc(di.get(),di.get()),
                          child: ProductListScreen(
                            categoryId: categories.items[index].id!,
                            title: categories.items[index].name_category!,
                          )));
                },
                child: CategoryItem_Widget(
                    img: categories.items[index].image_category ?? '')),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40),
      );

  _getCategory(BuildContext context) {
    BlocProvider.of<CategoryBloc>(context).add(LoadCategoriesEvent());
  }
}

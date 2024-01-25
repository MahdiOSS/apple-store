import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Base/Widget/MyProgressIndicator.dart';
import 'package:apple_store/Bloc/Product_Bloc/Product_Bloc.dart';
import 'package:apple_store/Bloc/Product_Bloc/Product_Event.dart';
import 'package:apple_store/Bloc/Product_Bloc/Product_State.dart';
import 'package:apple_store/View/Home/Widget/Product_Widget.dart';
import 'package:apple_store/View/ProductList/Widget/ProductListAppbar_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key, required this.categoryId,required this.title});

  String categoryId;
  String title;

  @override
  Widget build(BuildContext context) {
    _getProducts(categoryId == 'all_category_id' ? '' : categoryId, context);
    return Scaffold(
      backgroundColor: MyColor.white,
      body: SafeArea(
        child: _getBody(),
      ),
    );
  }

  _getBody() => BlocBuilder<ProductBloc, ProductState>(
          builder: (BuildContext context, state) {
        return CustomScrollView(
          slivers: [
            SliverPadding(
                padding: const EdgeInsets.only(top: 20, bottom: 32),
                sliver: SliverToBoxAdapter(
                    child: ProductAppbar(title: title))),
            if (state is ProductLoadingState) ...{
              const SliverToBoxAdapter(child: Center(
                child: MyProgress(),
              )
              )},
            if (state is ProductProductsState) ...{
              state.product.fold((l) {
                return const SliverToBoxAdapter(child: Text('error'));
              }, (r) {
                return SliverPadding(
                  sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                          childCount: r.length,
                          (context, index) => Directionality(
                              textDirection: TextDirection.rtl,
                              child: ProductItem(
                                  context: context, product: r[index]))),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 160 / 221,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 5)),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                );
              })
            }
          ],
        );
      });

  _getProducts(String categoryId, BuildContext context) {
    BlocProvider.of<ProductBloc>(context).add(GetProductsEvent(categoryId));
  }
}

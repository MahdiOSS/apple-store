import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Base/Extentions.dart';
import 'package:apple_store/Services/Image_Loading/Cached_Network_Image.dart';
import 'package:apple_store/View/Product_Detail/Product_Detail_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Base/Utils.dart';
import '../../../Bloc/Cart_Bloc/Card_Bloc.dart';
import '../../../Model/DataClass/Product.dart';
import 'package:apple_store/Services/DI/di.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key, required this.list});

  List<Product> list;

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        sliver: SliverToBoxAdapter(
            child: SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                ProductItem(product: list[index], context: context),
            itemCount: list.length,
          ),
        )),
      );
}

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.context, required this.product});

  Product product;
  BuildContext context;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider<CartBloc>.value(
                  value: di.get<CartBloc>(),
                  child: ProductDetailScreen(product: product))));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3)
              .copyWith(bottom: 20),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              width: 150,
              height: 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: ImageLoader(
                                imageUrl: product.product_image ?? '',
                                fit: BoxFit.scaleDown,
                                placeholder: Container(),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Image.asset(
                                  'assets/images/icon_favorite_deactive.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              if (product.discount != 0)
                                SizedBox(
                                  width: 24,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 1.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: MyColor.red,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      height: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Center(
                                            child: Text(
                                          "%${product.discount.toString()}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 8),
                    child: SizedBox(
                      width: 150,
                      child: Text(
                        product.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: Colors.black87.withOpacity(0.6),
                                fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          color: MyColor.blue),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Image.asset(
                                'assets/images/icon_right_arrow_cricle.png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (product.discount != 0)
                                  Flexible(
                                    child: Text(
                                      product.price!
                                          .parseNumberToStringWithComma(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              color: MyColor.white,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationThickness: 4),
                                    ),
                                  ),
                                Text(
                                  discount(product.price ?? 0,
                                          product.discount ?? 0)
                                      .parseNumberToStringWithComma(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          fontSize: 14, letterSpacing: 0.2),
                                )
                              ],
                            ),
                            Text(
                              'تومان',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: MyColor.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

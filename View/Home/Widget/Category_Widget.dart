import 'package:apple_store/Base/Utils.dart';
import 'package:apple_store/Bloc/Product_Bloc/Product_Bloc.dart';
import 'package:apple_store/Services/Image_Loading/Cached_Network_Image.dart';
import 'package:apple_store/View/ProductList/ProductList_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Model/DataClass/Categories.dart';
import '../../../Services/DI/di.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key, required this.categories});

  List<CategoryItem> categories;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 96,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) =>
              _getCategoryItem(categories[index], context, index)));

  _getCategoryItem(CategoryItem category, BuildContext context, int index) =>
      AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: GestureDetector(
            onTap: () {
              myPushNavigate(
                  context,
                  BlocProvider<ProductBloc>(
                      create: (BuildContext context) => ProductBloc(di.get(),di.get()),
                      child: ProductListScreen(categoryId: categories[index].id!, title: categories[index].name_category!,)));
            },
            child: Column(
              children: [
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(0),
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: AnimatedContainer(
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 400),
                    width: category.icon_size?.toDouble() ?? 56.0,
                    height: category.icon_size?.toDouble() ?? 56.0,
                    decoration: ShapeDecoration(
                        color:
                            HexColor(category.background_color ?? '0xffE5E5E5'),
                        shape: const ContinuousRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40)))),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: ImageLoader(
                          imageUrl: category.icon_category ?? '',
                          fit: BoxFit.scaleDown,
                          placeholder: Container(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(category.name_category ?? '',
                    style: Theme.of(context).textTheme.headlineSmall)
              ],
            ),
          ),
        ),
      );
}

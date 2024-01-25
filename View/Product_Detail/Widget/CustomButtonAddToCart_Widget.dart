import 'dart:ui';
import 'package:apple_store/Bloc/Product_Bloc/Product_Bloc.dart';
import 'package:apple_store/Bloc/Product_Bloc/Product_Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Base/Constant.dart';
import '../../../Bloc/Cart_Bloc/Card_Bloc.dart';
import '../../../Bloc/Cart_Bloc/Card_Event.dart';
import '../../../Model/DataClass/Card_Item.dart';
import '../../../Model/DataClass/Product.dart';

class CustomButtonProductDetail extends StatelessWidget {
  CustomButtonProductDetail({super.key, required this.color,required this.title,required this.product});

  Color color;
  String title;
  Product product;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: (){
      CardItem card = CardItem(
          product.name,
          product.price,
          product.product_image,
          1,
          false,
          product.discount);
      BlocProvider.of<ProductBloc>(context).add(PutCardItemsEvent(
          DBName.HIVE_BOX_NAME,
          card
      ));
      print('added');
      context.read<CartBloc>().add(CartGetCartItemsEvent("card_item_box_db"));
    },
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 130,
          height: 47,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15)),
        ),
        Positioned(
          top: 5,
          child: ClipRRect(
    borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10
              ),
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(child: Text(title,style: Theme.of(context).textTheme.displaySmall,)),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

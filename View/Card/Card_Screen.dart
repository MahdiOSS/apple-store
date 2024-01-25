import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Base/Widget/MyProgressIndicator.dart';
import 'package:apple_store/Bloc/Cart_Bloc/Card_Bloc.dart';
import 'package:apple_store/Bloc/Cart_Bloc/Card_Event.dart';
import 'package:apple_store/View/Card/Widget/Empty_State.dart';
import 'package:apple_store/View/Home/Widget/AppBar_Widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zarinpal/zarinpal.dart';
import '../../Bloc/Cart_Bloc/Card_State.dart';
import '../../Model/DataClass/Card_Item.dart';
import 'Widget/CartItem_Widget.dart';

class CardScreen extends StatelessWidget {
  CardScreen({super.key});

  int totalPrice = 0;

  BuildContext? buildContext;

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return Scaffold(
      backgroundColor: MyColor.white,
      body: SafeArea(
        child: _getBody(context),
      ),
    );
  }

  _getBody(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(CartGetCartItemsEvent('card_box'));
    return BlocBuilder<CartBloc, CartState>(
      builder: (BuildContext context, state) {
        return Stack(
            children: [
              if(state is CartEmptyState) ...{
                const EmptyStateWidget()
              } else
              CustomScrollView(slivers: [
                SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 32),
                      child: AppBarWidget(title: 'سبد خرید'),
                    )),
                if (state is CartLoadingState) ...{
                  SliverToBoxAdapter(
                    child: Visibility(
                      visible: state.progress,
                      child: const Center(
                        child: MyProgress(),
                      ),
                    ),
                  )
                },
                if (state is CartItemsState) ...{
                  state.cardItems.fold((l) {
                    return SliverToBoxAdapter(child: Text(l.toString()));
                  }, (r) {
                    totalPrice = _calculateTotalPrice(r);
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: r.length,
                            (context, index) =>
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35.0, vertical: 10),
                              child: CardItem_Widget(cardItem: r[index]),
                            ),
                      ),
                    );
                  })
                },
                if (state is CartPaymentRequestState) ...{
                  state.payRequest.fold((l) {
                    return const SliverToBoxAdapter(
                      child: Text('error'),
                    );
                  }, (r) {
                    _startPay(buildContext!, r);
                    return const SliverToBoxAdapter(child: Text(''));
                  })
                },
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _getFloatingActionButton(context)
                    ],
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.symmetric(vertical: 40))
              ]),
            ]);
      },
    );
  }

  _getFloatingActionButton(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 48,
          width: 200,
          decoration: BoxDecoration(
              color: MyColor.green,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(0, 5))
              ]),
          child: InkWell(
            onTap: () async {
              _initPay(buildContext!);
            },
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DottedLine(
                    direction: Axis.vertical,
                    dashColor: Colors.white,
                  ),
                  Text(
                    'نهایی کردن '
                        'خرید',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: MyColor.white),
                  ),
                  const DottedLine(
                    direction: Axis.vertical,
                    dashColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  int _calculateTotalPrice(List<CardItem> list) {
    return list.fold(
      0, (previousValue, element) {
      return previousValue += element.price!.toInt();
    },
    );
  }

  _initPay(BuildContext context) {
    context.read<CartBloc>().add(CartInitPaymentEvent(totalPrice, 'dec'));
  }

  _startPay(BuildContext context, PaymentRequest paymentRequest) {
    context.read<CartBloc>().add(CartStartPaymentEvent(paymentRequest));
  }
}


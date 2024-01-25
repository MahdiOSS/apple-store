import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Base/Extentions.dart';
import 'package:apple_store/Model/DataClass/Card_Item.dart';
import 'package:apple_store/Services/Image_Loading/Cached_Network_Image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../../Base/Utils.dart';

class CardItem_Widget extends StatelessWidget {
  CardItem_Widget({super.key, required this.cardItem});

  CardItem cardItem;

  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          //Media Query provide the size of user device
          width: MediaQuery.sizeOf(context).width,
          height: 240,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 80,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 0, left: 0),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: ImageLoader(
                            imageUrl: cardItem.imageUrl ?? '',
                            placeholder: Container(),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 180,
                                child: Text(
                                  cardItem.title ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(color: Colors.black87),
                                  overflow: TextOverflow.ellipsis,
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '7 روز مهلت تست فروشگاه اپل',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: MyColor.gray),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              (cardItem.price!.toInt())
                                  .parseNumberToStringWithComma(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: MyColor.gray),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            // Row(
                            //   mainAxisSize: MainAxisSize.max,
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     _getDetailCartWidgetWithIcon(Icons.settings_rounded,
                            //         '256 گیگابایت', context),
                            //     const SizedBox(
                            //       width: 10,
                            //     ),
                            //     Container(
                            //       decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(15),
                            //           border: Border.all(
                            //               width: 0.5, color: MyColor.gray)),
                            //       padding:
                            //           const EdgeInsets.symmetric(horizontal: 5),
                            //       height: 24,
                            //       child: Row(
                            //         crossAxisAlignment: CrossAxisAlignment.center,
                            //         children: [
                            //           Container(
                            //             width: 10,
                            //             height: 10,
                            //             decoration: BoxDecoration(
                            //                 borderRadius: BorderRadius.circular(50),
                            //                 color: Colors.green),
                            //           ),
                            //           const SizedBox(
                            //             width: 5,
                            //           ),
                            //           Text(
                            //             'سبز',
                            //             style: Theme.of(context)
                            //                 .textTheme
                            //                 .titleLarge
                            //                 ?.copyWith(color: MyColor.gray),
                            //           ),
                            //           const SizedBox(
                            //             width: 10,
                            //           ),
                            //           const Icon(
                            //             Icons.colorize_rounded,
                            //             size: 14,
                            //             color: MyColor.gray,
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                _getDetailCartWidgetWithImage(
                                    'icon_options.png', '1', context),
                                const SizedBox(width: 10),
                                Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: _getDetailCartWidgetWithImageAndLike(
                                        'دخیره', context, false)),
                                const SizedBox(width: 10),
                                Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: _getDetailCartWidgetWithImage(
                                        'icon_trash.png', 'حذف', context))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 25,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: DottedLine(
                            dashColor: MyColor.gray.withOpacity(0.7),
                            dashLength: 4,
                            dashRadius: 50,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              discount(cardItem.price!.toInt(),
                                  cardItem.discount!.toInt())
                                  .parseNumberToStringWithComma(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontSize: 16, color: Colors.black87),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'تومان',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: Colors.black87),
                            ),
                          ],
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      );

  _getDetailCartWidgetWithIcon(
          IconData icon, String title, BuildContext context) =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 0.5, color: MyColor.gray)),
        height: 24,
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MyColor.gray),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              size: 14,
              color: MyColor.gray,
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
      );

  _getDetailCartWidgetWithImage(
          String icon, String title, BuildContext context) =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 0.5, color: MyColor.gray)),
        height: 24,
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MyColor.gray),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/$icon',
              width: 14,
              height: 14,
              color: MyColor.gray,
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
      );

  _getDetailCartWidgetWithImageAndLike(
          String title, BuildContext context, bool liked) =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 0.5, color: MyColor.gray)),
        height: 24,
        child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MyColor.gray),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              liked
                  ? 'assets/images/active_fav_product.png'
                  : 'assets/images/icon_favorite_deactive.png',
              width: 14,
              height: 14,
              color: MyColor.gray,
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
      );
}

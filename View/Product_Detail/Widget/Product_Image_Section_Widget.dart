import 'package:apple_store/Base/Constant.dart';
import 'package:apple_store/Services/Image_Loading/Cached_Network_Image.dart';
import 'package:flutter/material.dart';

class ProductImageSection extends StatefulWidget {
  ProductImageSection({super.key, required this.images, required this.rate});

  List<String> images;
  num rate;

  @override
  State<ProductImageSection> createState() => _ProductImageSectionState();
}

class _ProductImageSectionState extends State<ProductImageSection> {
  int selectedImage = 0;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Card(
          elevation: 4,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: SizedBox(
            height: 320,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      if (widget.images.isNotEmpty)
                        SizedBox(
                          height: 220,
                          child: ImageLoader(
                            imageUrl: widget.images[selectedImage],
                            placeholder: Container(),
                            fit: BoxFit.scaleDown,
                          ),
                        )
                      else
                        const SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Image.asset(
                                'assets/images/icon_favorite_deactive.png'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  widget.rate.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: Colors.black87,
                                          letterSpacing: -0.2),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Image.asset(
                                'assets/images/icon_star.png',
                                width: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SizedBox(
                    height: 60,
                    child: Center(
                      child: ListView.builder(
                          controller: controller,
                          itemCount: widget.images.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedImage = index;
                                      controller.animateTo(
                                          selectedImage > 1
                                              ? selectedImage * 50
                                              : 0,
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          curve: Curves.linearToEaseOut);
                                    });
                                  },
                                  child: Container(
                                    width: 60,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border:
                                            Border.all(color: MyColor.gray)),
                                    child: ImageLoader(
                                        imageUrl: widget.images[index],
                                        placeholder: Container()),
                                  ),
                                ),
                              )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

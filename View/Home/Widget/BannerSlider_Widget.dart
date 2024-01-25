import 'package:apple_store/Base/Widget/MyProgressIndicator.dart';
import 'package:apple_store/Services/Image_Loading/Cached_Network_Image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSliderSection extends StatelessWidget {
  BannerSliderSection({super.key, required this.url});

  List<String> url;

  PageController controller = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          SizedBox(
            height: 180,
            child: PageView.builder(
                controller: controller,
                itemCount: url.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)),
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Card(
                            margin: const EdgeInsets.all(0),
                            child: ImageLoader(
                              imageUrl: url[index],
                              fit: BoxFit.cover, placeholder: const MyProgress(),
                            ),
                          ),
                        ),
                      ),
                    )),
          ),
          Positioned(
            bottom: 8,
            child: SmoothPageIndicator(
              controller: controller,
              count: url.length,
              effect: const ExpandingDotsEffect(
                expansionFactor: 4,
                spacing: 3,
                dotHeight: 7,
                dotWidth: 7,
                dotColor: Colors.white,
              ),
            ),
          )
        ]),
      );
}


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  String imageUrl;
  BoxFit fit;
  Widget placeholder;

  ImageLoader(
      {super.key,
      required this.imageUrl,
      this.fit = BoxFit.cover,
       required this.placeholder
      });

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, uri) => placeholder,
        errorWidget: (context, uri, object) => _getErrorWidget(),
        fit: fit,
      );

  _getErrorWidget() => Container(
        color: Colors.red,
      );
}

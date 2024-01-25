import 'dart:convert';

import '../../Base/Constant.dart';
import '../../Base/Utils.dart';

class BannerSliders {
  List<BannerSliderItem> sliders;

  BannerSliders(this.sliders);

  factory BannerSliders.fromJson(Map<String, dynamic> json) =>
      BannerSliders(List<BannerSliderItem>.generate(json['totalItems'],
          (index) => BannerSliderItem.fromJson(json['items'][index])));
}

class BannerSliderItem {
  String? banner_image;
  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? updated;
  String? uri_link;

  BannerSliderItem(this.banner_image, this.collectionId, this.collectionName,
      this.created, this.id, this.updated, this.uri_link);

  factory BannerSliderItem.fromJson(Map<String, dynamic> json) =>
      BannerSliderItem(
          setPocketBaseUriImage('banner_image', json),
          json['collectionId'],
          json['collectionName'],
          json['created'],
          json['id'],
          json['updated'],
          json['uri_link']);
}

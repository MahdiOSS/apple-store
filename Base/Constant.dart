import 'dart:ui';

class MyColor {
  static const white = Color(0xffeeeeee);
  static const gray = Color(0xff858585);
  static const blue = Color(0xff3B5EDF);
  static const blueLow = Color(0xff3bdfdf);
  static const green = Color(0xff1DB68B);
  static const red = Color(0xffD02026);
}

class BaseDomain {
  static const baseUrl = 'https://pocketbase-kyde56ist.liara.run/api/' ;
}

class DBName {
  static const ACCESS_TOKEN = 'access_token';
  static const ACCESS_REFRESH_TOKEN = 'access_refresh_token';

  static const HIVE_BOX_NAME = 'card_item_box';
  static const HIVE_BOX_CARD_ITEM_KEY = 'card_key';
}

enum ProductSort {
  allProduct,bestSeller,mostVisited
}
class ProductVariant {
  String? id;
  String? product_id;
  Map<String, dynamic>? values;

  ProductVariant(this.id, this.product_id, this.values);

  factory ProductVariant.fromJson(Map<String, dynamic> json) =>
      ProductVariant(json['id'], json['product_id'], json['values']);
}

enum Variant { COLOR, STORAGE, GUARANTEE, WAT }

Variant getVariantFromVariantTypeId(String id) {
  if (id == 'smpyt8a139psoic') {
    return Variant.COLOR;
  } else if (id == 'ctkcn83r0ehywie') {
    return Variant.STORAGE;
  } else if (id == 'cth28xtiucx18m4') {
    return Variant.GUARANTEE;
  } else if (id == '0wx7er6iz83vufs') {
    return Variant.WAT;
  } else {
    return Variant.GUARANTEE;
  }
}

class ProductColorVariant {
  String? name;
  String? value;
  int? change_price;

  ProductColorVariant(this.name, this.value, this.change_price);

  factory ProductColorVariant.fromJson(Map<String, dynamic> json) =>
      ProductColorVariant(json['name'], json['value'], json['change_price']);
}

class ProductStorageVariant {
  int? value;
  int? change_price;

  ProductStorageVariant(this.value, this.change_price);

  factory ProductStorageVariant.fromJson(Map<String, dynamic> json) =>
      ProductStorageVariant(json['value'], json['change_price']);
}

class ProductWatVariant {
  String? value;
  int? change_price;

  ProductWatVariant(this.value, this.change_price);

  factory ProductWatVariant.fromJson(Map<String, dynamic> json) =>
      ProductWatVariant(json['value'], json['change_price']);
}

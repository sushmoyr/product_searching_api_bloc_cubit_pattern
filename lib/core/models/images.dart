import 'dart:convert';

Images imagesFromJson(String str) => Images.fromJson(json.decode(str));
String imagesToJson(Images data) => json.encode(data.toJson());

class Images {
  Images({
    this.id,
    this.image,
    this.isPrimary,
    this.product,
  });

  Images.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    isPrimary = json['is_primary'];
    product = json['product'];
  }
  int? id;
  String? image;
  bool? isPrimary;
  int? product;
  Images copyWith({
    int? id,
    String? image,
    bool? isPrimary,
    int? product,
  }) =>
      Images(
        id: id ?? this.id,
        image: image ?? this.image,
        isPrimary: isPrimary ?? this.isPrimary,
        product: product ?? this.product,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['is_primary'] = isPrimary;
    map['product'] = product;
    return map;
  }
}

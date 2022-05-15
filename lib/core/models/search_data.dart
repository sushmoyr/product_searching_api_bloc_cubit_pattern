import 'products.dart';
import 'dart:convert';

SearchData dataFromJson(String str) => SearchData.fromJson(json.decode(str));
String dataToJson(SearchData data) => json.encode(data.toJson());

class SearchData {
  SearchData({
    this.products,
  });

  SearchData.fromJson(dynamic json) {
    products =
        json['products'] != null ? Products.fromJson(json['products']) : null;
  }
  Products? products;
  SearchData copyWith({
    List<dynamic>? categories,
    Products? products,
  }) =>
      SearchData(
        products: products ?? this.products,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.toJson();
    }
    return map;
  }
}

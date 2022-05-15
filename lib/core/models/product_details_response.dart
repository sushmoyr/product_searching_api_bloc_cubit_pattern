import 'dart:convert';

import 'package:product_searching_api_bloc_cubit_pattern/core/models/api_response.dart';
import 'package:product_searching_api_bloc_cubit_pattern/core/models/product.dart';

ProductDetailsResponse productDetailsResponseFromJson(String str) =>
    ProductDetailsResponse.fromJson(json.decode(str));
String productDetailsResponseToJson(ProductDetailsResponse data) =>
    json.encode(data.toJson());

class ProductDetailsResponse extends ApiResponse {
  ProductDetailsResponse({
    this.status,
    this.statusCode,
    this.product,
    this.error,
  });

  ProductDetailsResponse.fromJson(dynamic json) {
    status = json['status'];
    statusCode = json['statusCode'];
    product = json['data'] != null ? Product.fromJson(json['data']) : null;
    error = json['error'];
  }
  String? status;
  int? statusCode;
  Product? product;
  String? error;
  ProductDetailsResponse copyWith({
    String? status,
    int? statusCode,
    Product? data,
    String? error,
  }) =>
      ProductDetailsResponse(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        product: data ?? this.product,
        error: error ?? this.error,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusCode'] = statusCode;
    if (product != null) {
      map['data'] = product?.toJson();
    }
    map['error'] = error;
    return map;
  }
}

import 'package:product_searching_api_bloc_cubit_pattern/core/models/api_response.dart';

import 'search_data.dart';
import 'dart:convert';

SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));
String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse extends ApiResponse {
  SearchResponse({
    this.status,
    this.data,
  });

  SearchResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? SearchData.fromJson(json['data']) : null;
  }
  String? status;
  SearchData? data;
  SearchResponse copyWith({
    String? status,
    SearchData? data,
  }) =>
      SearchResponse(
        status: status ?? this.status,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:product_searching_api_bloc_cubit_pattern/core/models/search_response.dart';

import 'api_service.dart';

class ProductSearchService extends ApiService {
  @override
  String get baseUrl =>
      'https://panel.supplyline.network/api/product/search-suggestions/?format=json';
  static const limit = 10;

  Future<SearchResponse> searchProducts(String term, int page) async {
    try {
      final int offset = limit * (page - 1);
      final response = await get(
        Uri.parse('$baseUrl&limit=$limit&offset=$offset&search=$term'),
      );
      return searchResponseFromJson(response.body);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Future.error(e);
    }
  }
}

import 'package:product_searching_api_bloc_cubit_pattern/core/models/product.dart';
import 'package:product_searching_api_bloc_cubit_pattern/core/service/product_search_service.dart';

class SearchRepository {
  final ProductSearchService service;

  SearchRepository(this.service);

  Future<List<Product>> searchProducts(String term, int page) async {
    try {
      final searchResult = await service.searchProducts(term, page);
      return searchResult.data?.products?.results ?? [];
    } catch (e) {
      return [];
    }
  }
}

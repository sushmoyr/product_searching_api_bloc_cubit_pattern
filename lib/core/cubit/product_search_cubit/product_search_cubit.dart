import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_searching_api_bloc_cubit_pattern/core/models/api_response.dart';
import 'package:product_searching_api_bloc_cubit_pattern/core/models/product.dart';
import 'package:product_searching_api_bloc_cubit_pattern/core/models/products.dart';
import 'package:product_searching_api_bloc_cubit_pattern/core/models/search_response.dart';
import 'package:product_searching_api_bloc_cubit_pattern/core/repository/remository.dart';

part 'product_search_state.dart';

class ProductSearchCubit extends Cubit<ProductSearchState> {
  ProductSearchCubit(this.repository) : super(ProductSearchInitial());

  int page = 1;
  int limit = 10;

  final SearchRepository repository;

  void searchProducts(String term) {
    if (state is ProductSearchLoading) {
      return;
    }

    final currentState = state;

    List<Product> oldProducts = [];

    if (currentState is ProductSearchLoaded) {
      oldProducts = currentState.products;
    }

    emit(ProductSearchLoading(oldProducts, page == 1));

    repository.searchProducts(term, page).then((newProducts) {
      page++;

      final products = (state as ProductSearchLoading).oldProducts;
      products.addAll(newProducts);

      emit(ProductSearchLoaded(products));
    });
  }
}

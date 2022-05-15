part of 'product_search_cubit.dart';

abstract class ProductSearchState extends Equatable {
  const ProductSearchState();
}

class ProductSearchInitial extends ProductSearchState {
  @override
  List<Object> get props => [];
}

class ProductSearchLoading extends ProductSearchState {
  final List<Product> oldProducts;
  final bool isFirstFetch;

  const ProductSearchLoading(this.oldProducts, [this.isFirstFetch = false]);

  @override
  List<Object?> get props => [oldProducts, isFirstFetch];
}

class ProductSearchLoaded extends ProductSearchState {
  final List<Product> products;

  const ProductSearchLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

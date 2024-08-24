part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsFailure extends ProductsState {
  final String error;

  ProductsFailure({required this.error});
}

class ProductsLoaded extends ProductsState{
  final List<Product> products;

  ProductsLoaded(this.products);

}


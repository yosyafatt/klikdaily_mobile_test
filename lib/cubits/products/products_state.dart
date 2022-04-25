part of 'products_cubit.dart';

@immutable
abstract class ProductsState extends Equatable {
  ProductsState();
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;
  ProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class ProductsError extends ProductsState {
  final error;
  ProductsError(this.error);

  @override
  List<Object> get props => [error];
}

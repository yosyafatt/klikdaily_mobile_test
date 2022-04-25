part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final Cart cart;
  CartLoaded(this.cart);

  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {
  final error;
  CartError(this.error);

  @override
  List<Object> get props => [error];
}

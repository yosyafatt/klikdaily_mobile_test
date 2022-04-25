import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import './../../repos/localstorage_repos.dart';
import './../../services/localstorage_services.dart';
import './../../models/product.dart';
import './../../models/cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final LocalStorageRepos localStorageRepos =
      LocalStorageRepos(LocalStorageService('localcart'));

  Cart cart = Cart(cartItems: []);

  CartCubit() : super(CartInitial());

  void getCart() async {
    emit(CartLoading());

    try {
      final storage = await localStorageRepos.getStorage('cart');
      if (storage != null) {
        // cart = Cart.fromJson(storage.)
        cart = Cart.fromJson(storage);
        emit(CartLoaded(cart));
      } else
        emit(CartError('No product in cart'));
    } catch (err) {
      emit(CartError(err));
    }
  }

  void addToCart(Product product) async {
    emit(CartLoading());

    cart.cartItems.add(product);
    final json = cart.toJson();
    await localStorageRepos.saveToStorage('cart', json);

    emit(CartLoaded(cart));
  }

  void removeFromCart(int id) async {
    emit(CartLoading());

    cart.cartItems.removeWhere((item) => item.id == id);
    final json = cart.toJson();

    await localStorageRepos.saveToStorage('cart', json);

    emit(CartLoaded(cart));
  }

  void removeOneFromCart(Product product) async {
    emit(CartLoading());

    cart.cartItems.remove(product);
    final json = cart.toJson();
    await localStorageRepos.saveToStorage('cart', json);
    
    emit(CartLoaded(cart));
  }

  void clearCart() async {
    emit(CartLoading());

    cart.cartItems.clear();

    await localStorageRepos.removeFromStorage('cart');

    emit(CartLoaded(cart));
  }
}

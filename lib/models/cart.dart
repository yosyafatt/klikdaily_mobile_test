import './product.dart';

class Cart {
  List<Product> cartItems;

  Cart({this.cartItems});

  Cart.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cartItems = new List<Product>();

      json['cart'].forEach((cartItem) {
        cartItems.add(new Product.fromJson(cartItem));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.cartItems != null) {
      data['cart'] = this.cartItems.map((item) => item.toJson()).toList();
    }
    return data;
  }
}

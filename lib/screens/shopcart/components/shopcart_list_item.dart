import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import './../../../cubits/cart/cart_cubit.dart';
import './../../../models/product.dart';
import './../../../utils/app_colors.dart';
import './../../../utils/size_config.dart';
import './../../components/app_item_name.dart';

class ShopCartListItem extends StatelessWidget {
  const ShopCartListItem(
    this.product, {
    Key key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(vH(12.0)),
        margin: EdgeInsets.only(bottom: vH(12.0)),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(vW(12.0)),
            side: BorderSide(color: AppColors.platinumWhite),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppItemName(
                    name: product.title,
                    fontColor: Colors.grey.shade800,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: vW(24.0)),
                AppRemoveListItem(product.id),
              ],
            ),
            SizedBox(height: vH(8.0)),
            Row(
              children: [
                Container(
                  height: vH(100.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      vW(10.0),
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      product.image,
                    ),
                  ),
                ),
                SizedBox(width: vW(12.0)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppItemPrice(
                        price: NumberFormat.simpleCurrency(locale: 'en')
                            .format(product.price),
                        fontColor: AppColors.sonicSilver,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      AppItemRating(rating: product.rating.rate.round()),
                    ],
                  ),
                ),
                AppAddSubsItemButton(product)
              ],
            ),
          ],
        ));
  }
}

class AppAddSubsItemButton extends StatelessWidget {
  const AppAddSubsItemButton(
    this.product, {
    Key key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    return Container(
      child: Row(
        children: [
          Container(
            color: AppColors.seaGreen,
            child: IconButton(
              icon: Icon(Icons.remove_rounded),
              onPressed: () {
                print('decrement -> cart');
                context.read<CartCubit>().removeOneFromCart(product);
              },
              iconSize: 20.0,
              color: AppColors.antiflashWhite,
              constraints: BoxConstraints.tight(Size.square(24.0)),
              splashRadius: vH(32.0),
              padding: EdgeInsets.zero,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: vW(12.0),
            ),
            child: Text(
                '${cartCubit.cart.cartItems.where((element) => element.id == product.id).length}'),
          ),
          Container(
            color: AppColors.seaGreen,
            child: IconButton(
              icon: Icon(Icons.add_rounded),
              onPressed: () {
                print('increment -> cart');
                context.read<CartCubit>().addToCart(product);
              },
              iconSize: 20.0,
              color: AppColors.antiflashWhite,
              constraints: BoxConstraints.tight(Size.square(24.0)),
              splashRadius: vH(32.0),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}

class AppRemoveListItem extends StatelessWidget {
  const AppRemoveListItem(
    this.id, {
    Key key,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<CartCubit>().removeFromCart(id);
      },
      icon: Icon(Icons.close_rounded),
      color: Colors.red.shade800,
      iconSize: vH(24.0),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints.tight(
        Size.square(vH(24.0)),
      ),
      splashRadius: vH(18.0),
      visualDensity: VisualDensity.compact,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:klikdaily_mobile_test/cubits/cart/cart_cubit.dart';
import '../../../cubits/products/products_cubit.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/size_config.dart';
import '../../components/app_item_name.dart';

class HomeItemList extends StatelessWidget {
  const HomeItemList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is ProductsError) {
          return Center(child: Text('Ouchh : ${state.error}'));
        }

        if (state is ProductsLoaded) {
          final products = state.products;
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: vW(32.0)),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                height: vH(120.0),
                padding: EdgeInsets.all(vH(12.0)),
                margin: EdgeInsets.only(bottom: vH(12.0)),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(vW(12.0)),
                    side: BorderSide(color: AppColors.platinumWhite),
                  ),
                ),
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(vW(10.0)),
                          ),
                        ),
                        child: Image.network(
                          product.image,
                        ),
                      ),
                    ),
                    SizedBox(width: vW(12.0)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppItemName(
                            name: product.title,
                            fontColor: Colors.grey.shade800,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                          AppItemPrice(
                            price: NumberFormat.simpleCurrency(locale: 'en')
                                .format(product.price),
                            fontColor: AppColors.sonicSilver,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          AppItemRating(rating: product.rating.rate.round())
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final cart = context.read<CartCubit>();
                        cart.addToCart(product);
                      },
                      child: Text('Buy'),
                    )
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}

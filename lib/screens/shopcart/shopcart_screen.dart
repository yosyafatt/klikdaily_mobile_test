import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/size_config.dart';
import 'components/shopcart_list_item.dart';

class ShopCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
            color: AppColors.antiflashWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: vW(32.0)),
        itemCount: 3,
        itemBuilder: (context, index) {
          return ShopCartListItem();
        },
      ),
    );
  }
}

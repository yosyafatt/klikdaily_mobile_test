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
        padding:
            EdgeInsets.symmetric(horizontal: vW(32.0)).copyWith(top: vH(32.0)),
        itemCount: 3,
        itemBuilder: (context, index) {
          return ShopCartListItem();
        },
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - vW(32.0),
        padding: EdgeInsets.symmetric(horizontal: vW(24.0)),
        height: kToolbarHeight,
        decoration: ShapeDecoration(
          color: AppColors.seaGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(vH(12.0)),
          ),
        ),
        child: Row(
          children: [
            Text(
              'Total',
              style: TextStyle(
                color: AppColors.antiflashWhite,
                fontSize: vH(20.0),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: vW(16.0)),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '8 items',
                  style: TextStyle(
                    color: AppColors.antiflashWhite,
                  ),
                ),
                Text(
                  'Rp. 180.000',
                  style: TextStyle(
                    color: AppColors.antiflashWhite,
                    fontSize: vH(16.0),
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              'Checkout',
              style: TextStyle(
                color: AppColors.antiflashWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

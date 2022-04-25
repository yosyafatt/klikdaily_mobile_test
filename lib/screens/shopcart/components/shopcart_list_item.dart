import 'package:flutter/material.dart';
import './../../../utils/app_colors.dart';
import './../../../utils/size_config.dart';
import './../../components/app_item_name.dart';

class ShopCartListItem extends StatelessWidget {
  const ShopCartListItem({
    Key key,
  }) : super(key: key);

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
                AppItemName(
                  name: 'Sweet Orange China',
                  fontColor: Colors.grey.shade800,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                AppRemoveListItem(),
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
                      'https://picsum.photos/200',
                    ),
                  ),
                ),
                SizedBox(width: vW(12.0)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppItemPrice(
                        price: '12.000',
                        fontColor: AppColors.sonicSilver,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      AppItemRating(rating: 4),
                    ],
                  ),
                ),
                AppAddSubsItemButton()
              ],
            ),
          ],
        ));
  }
}

class AppAddSubsItemButton extends StatelessWidget {
  const AppAddSubsItemButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            color: AppColors.seaGreen,
            child: IconButton(
              icon: Icon(Icons.remove_rounded),
              onPressed: () {
                print('decrement -> cart');
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
            child: Text('12'),
          ),
          Container(
            color: AppColors.seaGreen,
            child: IconButton(
              icon: Icon(Icons.add_rounded),
              onPressed: () {
                print('increment -> cart');
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
  const AppRemoveListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        print('remove cart item');
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

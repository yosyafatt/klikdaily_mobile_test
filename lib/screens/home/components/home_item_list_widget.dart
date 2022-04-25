import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/size_config.dart';
import '../../components/app_item_name.dart';

class HomeItemList extends StatelessWidget {
  const HomeItemList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: vW(32.0)),
      itemCount: 10,
      itemBuilder: (context, index) {
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(vW(10.0)),
                  child: Image.network(
                    'https://picsum.photos/200',
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
                      name: 'Sweet Lemon Singapore',
                      fontColor: Colors.grey.shade800,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    AppItemPrice(
                      price: '12.000',
                      fontColor: AppColors.sonicSilver,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    AppItemRating(rating: 3)
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Buy'),
              )
            ],
          ),
        );
      },
    );
  }
}

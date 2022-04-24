import 'package:flutter/material.dart';
import './utils/app_colors.dart';
import './utils/size_config.dart';

class AppItemList extends StatelessWidget {
  const AppItemList({
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
                    ),
                    AppItemPrice(
                      price: '12.000',
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

class AppItemName extends StatelessWidget {
  const AppItemName({
    Key key,
    @required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: vH(16.0),
        color: Colors.grey.shade800,
      ),
    );
  }
}

class AppItemPrice extends StatelessWidget {
  const AppItemPrice({
    Key key,
    @required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price / kg',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: vH(30.0),
        color: AppColors.sonicSilver,
      ),
    );
  }
}

class AppItemRating extends StatelessWidget {
  const AppItemRating({
    Key key,
    @required this.rating,
  }) : super(key: key);
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 1; i <= 5; i++)
          Icon(
            Icons.star_rounded,
            size: vH(24.0),
            color: i <= rating ? AppColors.chineseYellow : AppColors.argent,
          )
      ],
    );
  }
}

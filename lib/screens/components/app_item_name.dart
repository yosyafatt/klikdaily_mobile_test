import 'package:flutter/material.dart';
import '../../utils/size_config.dart';
import '../../utils/app_colors.dart';

class AppItemName extends StatelessWidget {
  const AppItemName({
    Key key,
    @required this.name,
    @required this.fontSize,
    @required this.fontWeight,
    @required this.fontColor,
  }) : super(key: key);
  final String name;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: vH(fontSize),
        color: fontColor,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class AppItemPrice extends StatelessWidget {
  const AppItemPrice({
    Key key,
    @required this.price,
    @required this.fontSize,
    @required this.fontWeight,
    @required this.fontColor,
  }) : super(key: key);

  final String price;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price',
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: vH(fontSize),
        color: fontColor,
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
            size: vH(18.0),
            color: i <= rating ? AppColors.chineseYellow : AppColors.argent,
          )
      ],
    );
  }
}

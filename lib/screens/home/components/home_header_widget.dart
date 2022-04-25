import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: vH(36.0),
        horizontal: vW(32.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  'Find ',
                  style: TextStyle(
                    fontSize: vH(24.0),
                    fontWeight: FontWeight.w600,
                    color: AppColors.chineseYellow,
                  ),
                ),
                Expanded(
                  child: RotateAnimatedTextKit(
                    text: [
                      'groceries',
                      'dairy & eggs',
                      'meat & fish',
                      'bakeries',
                      'snacks',
                      'fruits & vegetables',
                      'drinks',
                    ],
                    textStyle: TextStyle(
                      fontSize: vH(24.0),
                      fontWeight: FontWeight.w700,
                      color: AppColors.seaGreen,
                    ),
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    repeatForever: true,
                    transitionHeight: vH(64.0),
                  ),
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://picsum.photos/200',
            ),
            backgroundColor: AppColors.argent,
            radius: vH(32.0),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './../../../utils/size_config.dart';

class AppProfileInfo extends StatelessWidget {
  const AppProfileInfo({
    Key key,
    this.icon = Icons.account_circle,
    this.text = 'string here',
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(vH(18.0)),
            child: Icon(
              icon,
              size: vH(36.0),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: vH(20.0)),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './utils/app_colors.dart';
import './utils/size_config.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: vH(20.0),
        horizontal: vW(32.0),
      ),
      // color: Colors.grey.shade400,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(vW(10.0)),
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: AppColors.seaGreen,
          ),
          hintText: 'Search groceries',
          hintStyle: TextStyle(color: AppColors.sonicSilver),
        ),
        cursorColor: AppColors.seaGreen,
        style: TextStyle(
          fontSize: vH(16.0),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:klikdaily_mobile_test/utils/size_config.dart';
import 'components/home_header_widget.dart';
import 'components/home_search_field_widget.dart';
import 'components/home_filter_list_widget.dart';
import 'components/home_item_list_widget.dart';
import '../../utils/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              HomeSearchField(),
              Padding(
                padding: EdgeInsets.only(left: vW(32.0), top: vH(24.0)),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: vH(18.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              HomeFilterList(),
              HomeItemList()
            ],
          ),
        ),
      ),
    );
  }
}

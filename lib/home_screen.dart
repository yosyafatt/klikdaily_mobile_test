import 'package:flutter/material.dart';
import 'package:klikdaily_mobile_test/utils/size_config.dart';
import './app_header_widget.dart';
import './app_search_field_widget.dart';
import './app_filter_list_widget.dart';
import 'app_item_list_widget.dart';
import './utils/size_config.dart';

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
              AppHeader(),
              AppSearchField(),
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
              AppFilterList(),
              AppItemList()
            ],
          ),
        ),
      ),
    );
  }
}

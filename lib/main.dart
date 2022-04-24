import 'package:flutter/material.dart';
import 'package:klikdaily_mobile_test/utils/size_config.dart';
import './home_screen.dart';
import './utils/theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildKlikDailyTheme(context),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

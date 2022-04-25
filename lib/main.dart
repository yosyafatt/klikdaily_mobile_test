import 'package:flutter/material.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/shopcart/shopcart_screen.dart';
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
      home: ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

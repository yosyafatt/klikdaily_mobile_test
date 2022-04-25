import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import './repos/api_repos.dart';
import './services/api_services.dart';
import './cubits/products/products_cubit.dart';
import './cubits/pageview/pageview_cubit.dart';
import './cubits/categories/categories_cubit.dart';
import './cubits/filterchips/filterchips_cubit.dart';
import './cubits/cart/cart_cubit.dart';
import './screens/profile/profile_screen.dart';
import './screens/home/home_screen.dart';
import './screens/shopcart/shopcart_screen.dart';
import './utils/theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp(apiService: ApiService()));
}

class MainApp extends StatelessWidget {
  MainApp({Key key, this.apiService}) : super(key: key);
  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductsCubit(ApiRepos(apiService))..fetchProducts(),
        ),
        BlocProvider(create: (context) => PageViewCubit()),
        BlocProvider(
          create: (context) =>
              CategoriesCubit(ApiRepos(apiService))..fetchCategories(),
        ),
        BlocProvider(create: (context) => FilterChipsCubit()),
        BlocProvider(create: (context) => CartCubit()..getCart()),
      ],
      child: MaterialApp(
        theme: buildKlikDailyTheme(context),
        home: PageViewScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageViewCubit = context.read<PageViewCubit>();
    return Scaffold(
      body: PageView(
        controller: pageViewCubit.pageController,
        onPageChanged: (page) {
          pageViewCubit.setPageView(page: page);
        },
        children: [
          HomeScreen(),
          ShopCartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<PageViewCubit>().state,
        onTap: (page) {
          pageViewCubit.setPageView(page: page);
          pageViewCubit.pageController.animateToPage(
            page,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

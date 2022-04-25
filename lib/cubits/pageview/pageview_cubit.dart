import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewCubit extends Cubit<int> {
  final PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;

  PageViewCubit() : super(0);

  void setPageView({int page}) {
    emit(page);
  }
}

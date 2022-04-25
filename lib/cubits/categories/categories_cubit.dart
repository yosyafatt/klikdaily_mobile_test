import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import './../../repos/api_repos.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final ApiRepos apiRepos;
  CategoriesCubit(this.apiRepos) : super(CategoriesInitial());

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());

    try {
      final categories = await apiRepos.getCategories();
      emit(CategoriesLoaded(categories ?? []));
    } catch (err) {
      emit(CategoriesError(err));
    }
  }
}

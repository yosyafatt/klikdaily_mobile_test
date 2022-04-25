import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import './../../repos/api_repos.dart';
import './../../models/product.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ApiRepos apiRepos;
  ProductsCubit(this.apiRepos) : super(ProductsInitial());

  Future<void> fetchProducts() async {
    emit(ProductsLoading());

    try {
      final products = await apiRepos.getProducts();
      emit(ProductsLoaded(products ?? []));
    } catch (err) {
      emit(ProductsError(err));
    }
  }

  Future<void> fetchProductsByCategory({String category}) async {
    emit(ProductsLoading());

    try {
      final products = await apiRepos.getProductsByCategory(category: category);
      emit(ProductsLoaded(products ?? []));
    } catch (err) {
      emit(ProductsError(err));
    }
  }
}

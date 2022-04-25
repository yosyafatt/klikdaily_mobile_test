import 'dart:developer';
import './../models/product.dart';
import './../services/api_services.dart';

class ApiRepos {
  ApiRepos(this.apiService);
  final ApiService apiService;

  Future<List<Product>> getProducts() async {
    final response = await apiService.getData(endpoint: '/products');
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((el) => Product.fromJson(el)).toList();
    }
    return [];
  }

  Future<List<Product>> getProductsByCategory({String category}) async {
    final response =
        await apiService.getData(endpoint: '/products/category/$category');
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map((el) => Product.fromJson(el)).toList();
    }
    return [];
  }

  Future getCategories() async {
    final response = await apiService.getData(endpoint: '/products/categories');
    if (response != null) {
      return response.data;
    }
    return [];
  }
}

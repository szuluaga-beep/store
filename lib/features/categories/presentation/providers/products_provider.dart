import 'package:flutter/material.dart';
import 'package:store/features/categories/domain/domain.dart';
import 'package:store/features/categories/infrastructure/datasources/products_datasource_impl.dart';
import 'package:store/features/categories/infrastructure/repositories/products_repository_impl.dart';

class ProductProvider extends ChangeNotifier {
  final productsRepository = ProductsRepositoryImpl(ProductsDatasourceImpl());

  List<Product> _products = [];

  List<Product> get products => _products;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchProducts(int categoryId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await productsRepository.getProducts(categoryId);
    } catch (e) {
      // Handle error appropriately, e.g., log it or show a message
      print('Error fetching categories: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:store/features/categories/domain/domain.dart';
import 'package:store/features/categories/infrastructure/infrastructure.dart';

class CategoryProvider extends ChangeNotifier {
  final categoriesRepository = CategoriesRepositoryImpl(
    CategoriesDatasourceImpl(),
  );

  List<Category> _categories = [];

  List<Category> get categories => _categories;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categories = await categoriesRepository.getCategories();
    } catch (e) {
      // Handle error appropriately, e.g., log it or show a message
      print('Error fetching categories: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

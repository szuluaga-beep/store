import 'package:store/features/categories/domain/domain.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getCategories();
}

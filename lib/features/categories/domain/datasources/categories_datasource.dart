import 'package:store/features/categories/domain/domain.dart';

abstract class CategoriesDatasource {
  Future<List<Category>> getCategories();
}

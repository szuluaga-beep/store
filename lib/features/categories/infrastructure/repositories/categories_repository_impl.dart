import '../../domain/domain.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesDatasource datasource;

  CategoriesRepositoryImpl(this.datasource);

  @override
  Future<List<Category>> getCategories() {
    return datasource.getCategories();
  }
}

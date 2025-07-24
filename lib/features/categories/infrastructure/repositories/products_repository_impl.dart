import 'package:store/features/categories/domain/datasources/products_datasource.dart';
import 'package:store/features/categories/domain/repositories/products_repository.dart';

import '../../domain/domain.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDatasource datasource;

  ProductsRepositoryImpl(this.datasource);

  @override
  Future<List<Product>> getProducts(int categoryId) {
    return datasource.getProducts(categoryId);
  }
}

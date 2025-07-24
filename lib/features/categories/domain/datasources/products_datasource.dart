import 'package:store/features/categories/domain/entities/product.dart';

abstract class ProductsDatasource {
  Future<List<Product>> getProducts(int categoryId);
}

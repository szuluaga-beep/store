
import 'package:store/features/categories/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts(int categoryId);
}

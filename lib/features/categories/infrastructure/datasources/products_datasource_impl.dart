import 'package:dio/dio.dart';
import 'package:store/features/categories/domain/datasources/products_datasource.dart';
import 'package:store/features/categories/domain/domain.dart';
import 'package:store/features/categories/infrastructure/mappers/product_mapper.dart';

class ProductsDatasourceImpl extends ProductsDatasource {
  late final Dio dio;

  ProductsDatasourceImpl() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://api.escuelajs.co/api/v1/",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );
  }

  @override
  Future<List<Product>> getProducts(int categoryId) {
    return dio
        .get("categories/$categoryId/products")
        .then((response) {
          final List<Product> products = [];
          for (final product in response.data ?? []) {
            products.add(ProductMapper.jsonToEntity(product));
          }
          return products;
        })
        .catchError((error) {
          throw Exception("Failed to load products: $error");
        });
  }
}

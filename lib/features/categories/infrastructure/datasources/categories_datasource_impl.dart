import 'package:dio/dio.dart';

import '../../domain/domain.dart';
import '../infrastructure.dart';

class CategoriesDatasourceImpl extends CategoriesDatasource {
  late final Dio dio;

  CategoriesDatasourceImpl() {
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
  Future<List<Category>> getCategories() async {
    final responsee = await dio.get("categories");
    final List<Category> categories = [];
    for (final category in responsee.data ?? []) {
      categories.add(CategoryMapper.jsonToEntity(category));
    }
    return categories;
  }
}

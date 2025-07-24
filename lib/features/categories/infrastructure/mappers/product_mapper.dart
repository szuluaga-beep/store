import 'package:store/features/categories/domain/entities/entities.dart';

import 'category_mapper.dart';

class ProductMapper {
  static jsonToEntity(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    price: (json["price"] as num).toDouble(),
    description: json["description"],
    category: CategoryMapper.jsonToEntity(json["category"]),
    images: List<String>.from(json["images"].map((x) => x)),
    creationAt: DateTime.parse(json["creationAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );
}

import 'package:store/features/categories/domain/domain.dart';

class CategoryMapper {
  static jsonToEntity(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["name"],
    slug: json["slug"],
    image: json["image"],
    creationAt: DateTime.parse(json["creationAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );
}

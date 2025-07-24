class Category {
  final int id;
  final String title;
  final String slug;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });
}

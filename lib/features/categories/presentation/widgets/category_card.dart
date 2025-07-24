import 'package:flutter/material.dart';
import 'package:store/features/categories/domain/domain.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _ImageViewer(image: category.image),
          Text(category.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}

class _ImageViewer extends StatelessWidget {
  final String image;

  const _ImageViewer({required this.image});

  @override
  Widget build(BuildContext context) {

    if(image.isEmpty){
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Image.asset(
          'assets/images/no-image.png',
          fit: BoxFit.cover,
          height: 250,
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: FadeInImage(
        fit: BoxFit.cover,
        height: 250,
        fadeOutDuration: const Duration(milliseconds: 100),
        fadeInDuration: const Duration(milliseconds: 200),
        image: NetworkImage(image),
        placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
      ),
    );
  }
}

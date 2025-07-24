import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:store/features/categories/presentation/presentation.dart';
import 'package:store/features/categories/presentation/widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesProvider = Provider.of<CategoryProvider>(
      context,
      listen: false,
    );

    categoriesProvider.fetchCategories();

    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.categories.isEmpty) {
          return const Center(child: Text('No categories found'));
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Categories')),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 20,
              physics: const BouncingScrollPhysics(),
              itemCount: provider.categories.length,
              itemBuilder: (context, index) {
                final category = provider.categories[index];
                return GestureDetector(
                  onTap: (){
                    print(category.id);
                  },
                  child: CategoryCard(category: category),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

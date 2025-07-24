
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:store/features/categories/presentation/providers/products_provider.dart';
import 'package:store/features/categories/presentation/widgets/product_card.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryId;

  const CategoryScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );
    productsProvider.fetchProducts(int.parse(categoryId));

    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.products.isEmpty) {
          return const Center(
              child: Text('No products found for this category'));
        }

        return Scaffold(
            appBar: AppBar(title: Text('Category: ${provider.products[0].category.title}')),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 20,
                physics: const BouncingScrollPhysics(),
                itemCount: provider.products.length,
                itemBuilder: (context, index) {
                  final product = provider.products[index];
                  return ProductCard(product: product);
                },
              ),
            ),
        );
      },

    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/categories/domain/domain.dart';
import 'package:store/features/categories/presentation/providers/cart_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            _ImageViewer(images: product.images),
            SizedBox(height: 10),
            Text(
              product.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 10),
            _AddButton(product: product),
          ],
        ),
      ),
    );
  }
}

class _ImageViewer extends StatelessWidget {
  final List<String> images;

  const _ImageViewer({required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
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
        image: NetworkImage(images.first),
        placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Product product;

  const _AddButton({ required this.product});

  @override
  Widget build(BuildContext context) {
    var isInCart = context.watch<CartProvider>();

    if (isInCart.isInCart(product)) {
      return Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              var cart = context.read<CartProvider>();
              cart.addToCart(product);
            },
            icon: Icon(Icons.add),
            label: Text('Add'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40), // Full width button
            ),
          ),
          SizedBox(width: 10),
          Text(
            'Quantity: ${isInCart.getItemCount(product)}',
            style: TextStyle(fontSize: 16),
          ),
          ElevatedButton.icon(
            onPressed: () {
              var cart = context.read<CartProvider>();
              cart.removeFromCart(product);
            },
            icon: Icon(Icons.remove),
            label: Text('Remove'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40), // Full width button
            ),
          ),
        ],
      );
    }

    return ElevatedButton.icon(
      onPressed: () {
        var cart = context.read<CartProvider>();
        cart.addToCart(product);
      },
      icon: Icon(Icons.add_shopping_cart),
      label: Text('Agregar'),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 40), // Full width button
      ),
    );
  }
}

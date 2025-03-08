import 'package:flutter/material.dart';
import 'package:fluttertest/data/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.image),
            SizedBox(height: 20),
            Text('Categoría: ${product.category}'),
            SizedBox(height: 10),
            Text('Descripción: ${product.description}'),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text(
                  ' ${product.rating.rate} (${product.rating.count} reviews)',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

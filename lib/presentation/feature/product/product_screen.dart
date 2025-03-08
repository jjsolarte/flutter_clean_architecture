import 'package:flutter/material.dart';
import 'package:fluttertest/presentation/providers/product_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ProductProvider>(context, listen: false);
      provider.loadProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    if (provider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(child: Text('Error: ${provider.error}'));
    }

    return ListView.builder(
      itemCount: provider.products.length,
      itemBuilder: (context, index) {
        final product = provider.products[index];
        return ListTile(
          title: Text(product.title),
          subtitle: Text(
            product.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text('\$${product.price.toStringAsFixed(2)}'),
          onTap: () => context.push('/product/${product.id}', extra: product),
        );
      },
    );
  }
}


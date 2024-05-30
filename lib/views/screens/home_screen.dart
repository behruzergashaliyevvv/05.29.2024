// views/screens/home_screens.dart
import 'package:dars/controller/products_controller.dart';
import 'package:dars/models/product/product.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  HomeScreens({super.key});
  final productsControllers = ProductsControllers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uyishi'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<List<Product>>(
        future: productsControllers.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Mahsulotlar mavjud emas'),
            );
          }
          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (ctx, index) {
              final product = products[index];
              return Card(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                      product.images.first,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                            'assets/images/not_found_images.png');
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(product.description),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

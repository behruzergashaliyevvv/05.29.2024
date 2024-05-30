// services/products_http_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product/product.dart';

class ProductsHttpService {
  Future<List<Product>> getProducts() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/products");

    try {
      final response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        print('Decoded data: $data');

        List<Product> loadedProducts = [];
        if (data.isNotEmpty) {
          for (var item in data) {
            // Additional null check for category name
            if (item['category']['name'] != null) {
              loadedProducts.add(Product.fromJson(item));
            }
          }
        }
        return loadedProducts;
      } else {
        print('Failed to load products: ${response.reasonPhrase}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }
}
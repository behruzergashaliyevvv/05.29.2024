
import 'package:dars/services/products_http_services.dart';

import '../models/product/product.dart';


class ProductsControllers {
  final productsHttpService = ProductsHttpService();

  Future<List<Product>> getProducts() async {
    List<Product> products = await productsHttpService.getProducts();
    return products;
  }
}
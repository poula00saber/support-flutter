import 'package:trial/data/web_services/products_web_services.dart';

import '../models/products.dart';

class ProductsRepository{

final ProductsWebServices productsWebServices;


  ProductsRepository(this.productsWebServices);

  Future<List<Product>> getAllProducts() async {
    final products = await productsWebServices.getAllProducts(); // take what i get from getAllProducts function and store in new variable
    return products.map((product) => Product.fromJson(product)).toList();
  }

}
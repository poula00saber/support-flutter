import 'package:dio/dio.dart';
import 'package:trial/constants/strings.dart';

class ProductsWebServices {
  late Dio dio;

  ProductsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://dummyjson.com/products',  // Replace with your actual base URL
      receiveDataWhenStatusError: true,       // In case of error, still receive data
      connectTimeout: const Duration(seconds: 20),  // 20 seconds timeout
      receiveTimeout: const Duration(seconds: 20),  // 20 seconds timeout
    );

    dio = Dio(options);
  }

  // Fetch data from the API
  Future<List<dynamic>> getAllProducts() async {
    try {               //in case of error to get the required info
      Response response = await dio.get('products');
      print(response.data.toString());
      return response.data;
    } catch (e) {    // print the error
      print(e.toString());
      return [];
    }
  }
}

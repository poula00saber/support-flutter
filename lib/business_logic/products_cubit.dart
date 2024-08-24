import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trial/data/models/products.dart';

import '../data/repo/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {

  final ProductsRepository productsRepository;
late List<Product> products;
  ProductsCubit(this.productsRepository) : super(ProductsInitial());

  // retreive data from repository to cubit
  List<Product> getAllProducts(){
productsRepository.getAllProducts().then((products){
emit(ProductsLoaded(products));  // send or start the state
this.products = products; // this refers to the variable above in the same class ,, the second product refer to line 17

});
return products;
  }

}


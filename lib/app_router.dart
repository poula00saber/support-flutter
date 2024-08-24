import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/business_logic/products_cubit.dart';
import 'package:trial/data/web_services/products_web_services.dart';
import 'package:trial/presentation/screens/account_screen.dart';
import 'package:trial/presentation/screens/favortie_screen.dart';
import 'package:trial/presentation/screens/products_screen.dart';

import 'data/repo/products_repository.dart';

class AppRouter{
  // these 2 objects for the details screen
  late ProductsRepository productsRepository;
late ProductsCubit productsCubit;

AppRouter(){
  productsRepository = ProductsRepository(ProductsWebServices()); // new object of webservices
productsCubit= ProductsCubit(productsRepository); // the above one in this page
}


  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(
    builder: (_)=> BlocProvider(
    create: (BuildContext context) =>
    productsCubit,

          child : ProductsScreen()),
    );

        case 'favorite_screen':
          return MaterialPageRoute(builder: (_)=> FavoriteScreen());

      case 'account_screen':
        return MaterialPageRoute(builder: (_)=> AccountScreen());





    }


  }

}
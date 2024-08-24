import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial/business_logic/products_cubit.dart';
import 'package:trial/constants/my_colors.dart';
import 'package:trial/presentation/widgets/product_item.dart';

import '../../data/models/products.dart';
class ProductsScreen extends StatefulWidget {
  const  ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  late List <Product> allProdcuts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // UI requests  the data from bloc
    allProdcuts = BlocProvider.of<ProductsCubit>(context).getAllProducts();
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          allProdcuts =
              (state).products; // products from the ProductsLoaded class
          return BuildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }


  Widget BuildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myBlack,
        child: Column(
          children: [
            BuildProductsList(),
          ],
        ),
      ),
    );
  }

  Widget BuildProductsList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      // the tutor doesn't know how it solved the error but it works
      padding: EdgeInsets.zero,
      itemCount: allProdcuts.length,
      itemBuilder: (ctx, index) {
        return ProductItem(product: allProdcuts[index],);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myOrange,
        title: Text("Products", style: TextStyle(color: MyColors.myBlack),

        ),
      ),
      body: BuildBlocWidget(),
    );
  }

}
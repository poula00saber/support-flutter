import 'package:flutter/material.dart';
import 'package:trial/constants/my_colors.dart';

import '../../data/models/products.dart';
class ProductItem extends StatelessWidget {

final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8,  8, 8),
      padding:EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridTile(child:
      Container(
        color: MyColors.myBlack,
        child: product.images.isNotEmpty ?
          FadeInImage.assetNetwork(
              width: double.infinity,
              height: double.infinity,

              placeholder: 'assets/images/loading.gif',
              image: product.images[0] , fit: BoxFit.cover,) :
        Image.asset('assets/images/placeholder.png'),
// that point
      ),
          footer: Container(
          width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Colors.black54,
alignment: Alignment.bottomCenter,
        child: Text(  product.title, style: TextStyle(
          height: 1.3,
          fontSize: 16,
          color: MyColors.myWhite,
           fontWeight: FontWeight.bold,
        ),
overflow:   TextOverflow.ellipsis, // put .... if long name
          maxLines: 2,
textAlign: TextAlign.center,
        ),
      ),
      ),
    );
  }
}

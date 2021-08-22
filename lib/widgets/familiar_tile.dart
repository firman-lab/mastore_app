import 'package:flutter/cupertino.dart';
import 'package:mastore_app/models/product_model.dart';
import 'package:mastore_app/theme.dart';

class FamiliarTile extends StatelessWidget {
  final ProductModel product;
  FamiliarTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          12,
        ),
        child: Image.network(
          product.galleries![0].url!,
          width: 54,
          height: 54,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

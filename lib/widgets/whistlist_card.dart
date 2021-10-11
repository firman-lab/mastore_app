import 'package:flutter/material.dart';
import 'package:mastore_app/models/product_model.dart';
import 'package:mastore_app/pages/product_page.dart';
import 'package:mastore_app/provider/whislist_provider.dart';
import 'package:mastore_app/theme.dart';
import 'package:provider/provider.dart';

class WhislistCard extends StatelessWidget {
  final ProductModel productModel;
  WhislistCard(this.productModel);

  @override
  Widget build(BuildContext context) {
    WhislistProvider whislistProvider = Provider.of<WhislistProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(productModel),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        padding: EdgeInsets.only(
          top: 10,
          left: 12,
          bottom: 14,
          right: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor4,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                productModel.galleries![0].url!,
                width: 60,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name!,
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    productModel.price.toString(),
                    style: priceTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                whislistProvider.setProduct(productModel);
              },
              child: Image.asset(
                'assets/whislist_icon.png',
                width: 34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

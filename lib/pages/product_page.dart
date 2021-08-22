import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mastore_app/models/product_model.dart';
import 'package:mastore_app/models/user_model.dart';
import 'package:mastore_app/provider/auth_provider.dart';
import 'package:mastore_app/provider/product_provider.dart';
import 'package:mastore_app/provider/whislist_provider.dart';
import 'package:mastore_app/theme.dart';
import 'package:mastore_app/widgets/familiar_tile.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  ProductPage(this.product);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_1.png',
    'assets/image_11.png',
    'assets/image_111.png'
  ];
  List fimiliar_shoes = [
    'assets/image_1.png',
    'assets/image_shoes.png',
    'assets/image_1.png',
    'assets/image_shoes.png',
    'assets/image_1.png',
    'assets/image_shoes.png',
    'assets/image_1.png',
    'assets/image_shoes.png',
    'assets/image_1.png',
    'assets/image_shoes.png',
    'assets/image_1.png',
    'assets/image_shoes.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    WhislistProvider whislistProvider = Provider.of<WhislistProvider>(context);

    Widget indicator(int index) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffc4c4c4),
        ),
      );
    }

    PreferredSizeWidget head() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: backgroundColor6,
          centerTitle: false,
          title: Container(
            width: double.infinity,
            height: 70,
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: Color(0xff000000),
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: primaryColor,
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          CarouselSlider(
            items: widget.product.galleries!
                .map(
                  (image) => Image.network(
                    image.url!,
                    width: MediaQuery.of(context).size.width,
                    height: 318,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries!.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget fimiliarShoes(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      );
    }

    Widget content() {
      int index = -1;
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                right: defaultMargin,
                left: defaultMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name!,
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.product.category!.name!,
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      whislistProvider.setProduct(widget.product);

                      if (whislistProvider.isWhishlist(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text(
                              'Has been added to wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: Text(
                              'Has been removed to wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      whislistProvider.isWhishlist(widget.product)
                          ? 'assets/whislist_icon.png'
                          : 'assets/home.png',
                      width: 46,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price start from',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$ ${widget.product.price.toString()}',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            //Description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.product.description!,
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    child: Text(
                      'Fimiliar Shoes',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: productProvider.products.map((product) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                              left: index == 0 ? defaultMargin : 8),
                          child: FamiliarTile(product),
                        );
                      }).toList(),
                      // children: productProvider.products
                      //     .map(
                      //       (product) => FamiliarTile(product),
                      //     )
                      //     .toList(),
                    ),
                  ),
                ],
              ),
            ),
            //Button
            Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/button_chat.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: primaryColor,
                        ),
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      appBar: head(),
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mastore_app/theme.dart';
import 'package:mastore_app/widgets/whistlist_card.dart';

class WhislistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text('Favorite Items'),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/headset_icon.png',
                width: 80,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'You don\'t have any fav items?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Let\'s find your favorite items',
                style: secondaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: light,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            children: [
              WhislistCard(),
              WhislistCard(),
              WhislistCard(),
              WhislistCard(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        //emptyWishlist(),
        content(),
      ],
    );
  }
}
